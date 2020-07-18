
import os
import re
import unittest
from updatepackage import UpdatePackage

pkg_dir = os.path.join(os.path.dirname(__file__), "../../vendor")

pkg = lambda n: os.path.join(pkg_dir, n)

updaters = [
    # Vortex
    UpdatePackage(pkg("vortex/POK3R_V113.exe"), name="pok3r", version=(1,1,3)),
    UpdatePackage(pkg("vortex/POK3R_V114.exe"), name="pok3r", version=(1,1,4)),
    UpdatePackage(pkg("vortex/POK3R_V115.exe"), name="pok3r", version=(1,1,5)),
    UpdatePackage(pkg("vortex/POK3R_V116.exe"), name="pok3r", version=(1,1,6)),
    UpdatePackage(pkg("vortex/POK3R_V117.exe"), name="pok3r", version=(1,1,7)),
    UpdatePackage(pkg("vortex/POK3R2_V110.exe"), name="pok3r2", version=(1,1,0)),
    UpdatePackage(pkg("vortex/POK3R_RGB_V124.exe"), name="pok3r_rgb", version=(1,2,4)),
    UpdatePackage(pkg("vortex/POK3R_RGB_V130.exe"), name="pok3r_rgb", version=(1,3,0)),
    UpdatePackage(pkg("vortex/POK3R_RGB_V140.exe"), name="pok3r_rgb", version=(1,4,0)),
    UpdatePackage(pkg("vortex/POK3R_RGB2_V105.exe"), name="pok3r_rgb2", version=(1,0,5)),
    UpdatePackage(pkg("vortex/CORE_V141.exe"), name="core", version=(1,4,1)),
    UpdatePackage(pkg("vortex/CORE_V143.exe"), name="core", version=(1,4,3)),
    UpdatePackage(pkg("vortex/CORE_V145.exe"), name="core", version=(1,4,5)),
    UpdatePackage(pkg("vortex/CORE_MPC.exe"), name="core", version=(1,4,6)),
    UpdatePackage(pkg("vortex/CORE_RGB_V146.exe"), name="core_rgb", version=(1,4,6)),
    UpdatePackage(pkg("vortex/RACE_V121.exe"), name="race", version=(1,2,1)),
    UpdatePackage(pkg("vortex/RACE_V124.exe"), name="race", version=(1,2,4)),
    UpdatePackage(pkg("vortex/RACE_V125.exe"), name="race", version=(1,2,5)),
    UpdatePackage(pkg("vortex/VIBE_V113.exe"), name="vibe", version=(1,1,3)),
    UpdatePackage(pkg("vortex/CYPHER_V136.exe"), name="cypher", version=(1,3,6)),
    UpdatePackage(pkg("vortex/TAB_60_V1113.exe"), name="tab60"),
    UpdatePackage(pkg("vortex/TAB_75_V100.exe"), name="tab75", version=(1,0,4)),
    UpdatePackage(pkg("vortex/TAB_90_V100.exe"), name="tab90", version=(1,0,4)),
    # TEX
    UpdatePackage(pkg("tex/AP_0163_1.01.01r.exe"), name="tex_yoda_ii", version=(1,1,1)),
    UpdatePackage(pkg("tex/1.00.31.exe"), name="tex_yoda_ii", version=(1,0,31)),
    # Mistel
    UpdatePackage(pkg("mistel/BOROCO_MD200.exe"), name="boroco_md200", version=(1,1,2)),
    UpdatePackage(pkg("mistel/BOROCO_MD600.exe"), name="boroco_md600", version=(1,4,8)),
    # KBP
    UpdatePackage(pkg("kbp/cykb112_v106.exe"), name="kbpv60", version=(1,0,6)),
    UpdatePackage(pkg("kbp/cykb112_v107.exe"), name="kbpv60", version=(1,0,7)),
    UpdatePackage(pkg("kbp/cykb129_v106.exe"), name="kbpv80", version=(1,0,6)),
    # Cooler Master
    UpdatePackage(pkg("coolermaster/masterkeys-pro-l-white-v1.08.exe"), name="masterkeys_pro_l_white", version=(1,8,0)),
    UpdatePackage(pkg("coolermaster/masterkeys-pro-m-white-v1.06.exe"), name="masterkeys_pro_m_white", version=(1,6,0)),
    UpdatePackage(pkg("coolermaster/mech_FW108.exe"), type=UpdatePackage.SIG_COOLERMASTER),
    UpdatePackage(pkg("coolermaster/rapid_i_v122_us.exe"), type=UpdatePackage.SIG_COOLERMASTER),
    UpdatePackage(pkg("coolermaster/rapid_i_v122_eu.exe"), type=UpdatePackage.SIG_COOLERMASTER),
    UpdatePackage(pkg("coolermaster/XTI_v114_us.exe"), type=UpdatePackage.SIG_COOLERMASTER),
    UpdatePackage(pkg("coolermaster/XTi_v114_eu.exe"), type=UpdatePackage.SIG_COOLERMASTER),
]


class TestExtract(unittest.TestCase):
    pass


def test_generator(u):
    def test(self):
        u.decode()
        u.print_info()
    return test


for u in updaters:
    name = os.path.splitext(os.path.basename(u.exe))[0]
    name = "test_" + re.sub('[^0-9a-zA-Z_]', '_', name)
    setattr(TestExtract, name, test_generator(u))


if __name__ == "__main__":
    unittest.main()
