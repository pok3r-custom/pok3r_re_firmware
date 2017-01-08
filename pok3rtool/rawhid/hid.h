#ifndef HID_H
#define HID_H

#ifdef __cplusplus
extern "C" {
#endif

typedef struct hid_struct hid_t;

hid_t *rawhid_open(int vid, int pid, int usage_page, int usage);
int rawhid_recv(hid_t *hid, void *buf, int len, int timeout);
int rawhid_send(hid_t *hid, const void *buf, int len, int timeout);
void rawhid_close(hid_t *hid);

#ifdef __cplusplus
}
#endif

#endif // HID_H
