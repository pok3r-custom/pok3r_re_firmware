#ifndef USB_H
#define USB_H

#include "../ht32f165x.h"

// Request Data Direction
#define REQUEST_DIR_MASK    0x80
#define REQUEST_DIR_H2D     0x00
#define REQUEST_DIR_D2H     0x80

// Request Type
#define REQUEST_TYPE_MASK       0x60
#define REQUEST_TYPE_STANDARD   0x00
#define REQUEST_TYPE_CLASS      0x20
#define REQUEST_TYPE_VENDOR     0x40

// Request Recipient
#define REQUEST_RECIPIENT_MASK      0x1F
#define REQUEST_RECIPIENT_DEVICE    0x00
#define REQUEST_RECIPIENT_INTERFACE 0x01
#define REQUEST_RECIPIENT_ENDPOINT  0x02
#define REQUEST_RECIPIENT_OTHER     0x03

// Standard Requests
#define GET_STATUS          0x00
#define CLEAR_FEATURE       0x01
#define SET_FEATURE         0x03
#define SET_ADDRESS         0x05
#define GET_DESCRIPTOR      0x06
#define SET_DESCRIPTOR      0x07
#define GET_CONFIGURATION   0x08
#define SET_CONFIGURATION   0x09
#define GET_INTERFACE       0x0A
#define SET_INTERFACE       0x11
#define SYNCH_FRAME         0x12

// Device Features
#define DEVICE_REMOTE_WAKEUP    1

#define FEAT_SELF_POWERED       0x01
#define FEAT_REMOTE_WAKEUP      0x02


typedef enum {
    H2D = 0,
    D2H = 1,
} Request_Direction;

typedef enum {
    STANDARD    = 0,
    CLASS       = 1,
    VENDOR      = 2,
} Request_Type;

typedef enum {
    DEVICE      = 0,
    INTERFACE   = 1,
    ENDPOINT    = 2,
    OTHER       = 3,
} Request_Recipient;

typedef enum {
    DATA_IN,
    DATA_OUT,
    STALL,
} Control_Action;

typedef struct {
    // Request Fields
    u8 bmRequestType;
    u8 bRequest;
    u16 wValue;
    u16 wIndex;
    u16 wLength;

    Request_Direction direction;
    Request_Type type;
    Request_Recipient recipient;

    // Control Buffer
    Control_Action action;
    u8 controlLength;
    const u8 *controlData;
    u8 controlBuffer[64];
} USB_Request;

typedef struct {
    // Device descriptors
    const u8 *deviceDesc;

    // Configuration descriptors
    const u8 *configDesc;

    // Interface descriptors
    const u8 **interfaceDescs;
    u8 numInterfaceDescs;

    // Endpoint descriptors
    const u8 **endpointDescs;
    u8 numEndpointDescs;

    // String descriptors
    const u8 **stringDescs;
    u8 numStringDescs;
} USB_Descriptors;

typedef enum {
    POWERED     = 0,    //!< Device is powered.
    SUSPENDED   = 1,    //!< Device is suspended.
    ADDRESS     = 2,    //!< Device has address.
    CONFIGURED  = 3,    //!< Device is configured.
} USB_Status;

typedef struct {
    u8 enable;
    u8 length;
    volatile u8 *buffer;

    // endpoint config backup
    u32 cfgr;
    u32 ier;
} USB_Endpoint;

typedef struct {
    USB_Status currStatus;
    USB_Status prevStatus;

    u8 deviceFeature;

    USBIER_reg ier;

    USB_Endpoint ep[8];
    USB_Descriptors descriptors;
} USB_Device;

// API
void usb_init();
void usb_pull_up(char en);

#endif // USB_H
