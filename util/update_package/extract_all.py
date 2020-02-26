
import os
import re
import unittest
from updatepackage import UpdatePackage

d = os.path.join(os.path.dirname(__file__), "../../vendor")

updaters = [
    # Vortex
    UpdatePackage(os.path.join(d, "vortex/POK3R_V113.exe"), name="pok3r"),
    UpdatePackage(os.path.join(d, "vortex/POK3R_V114.exe"), name="pok3r"),
    UpdatePackage(os.path.join(d, "vortex/POK3R_V115.exe"), name="pok3r"),
    UpdatePackage(os.path.join(d, "vortex/POK3R_V116.exe"), name="pok3r"),
    UpdatePackage(os.path.join(d, "vortex/POK3R_V117.exe"), name="pok3r"),
    UpdatePackage(os.path.join(d, "vortex/POK3R2_V110.exe"), name="pok3r2"),
    UpdatePackage(os.path.join(d, "vortex/POK3R_RGB_V124.exe"), name="pok3r_rgb"),
    UpdatePackage(os.path.join(d, "vortex/POK3R_RGB_V130.exe"), name="pok3r_rgb"),
    UpdatePackage(os.path.join(d, "vortex/POK3R_RGB_V140.exe"), name="pok3r_rgb"),
    UpdatePackage(os.path.join(d, "vortex/POK3R_RGB2_V105.exe"), name="pok3r_rgb2"),
    UpdatePackage(os.path.join(d, "vortex/CORE_V141.exe"), name="vortex_core"),
    UpdatePackage(os.path.join(d, "vortex/CORE_V143.exe"), name="vortex_core"),
    UpdatePackage(os.path.join(d, "vortex/CORE_V145.exe"), name="vortex_core"),
    UpdatePackage(os.path.join(d, "vortex/CORE_MPC.exe"), name="vortex_core"),
    UpdatePackage(os.path.join(d, "vortex/CORE_RGB_V146.exe"), name="vortex_core_rgb"),
    UpdatePackage(os.path.join(d, "vortex/RACE_V121.exe"), name="vortex_race"),
    UpdatePackage(os.path.join(d, "vortex/RACE_V124.exe"), name="vortex_race"),
    UpdatePackage(os.path.join(d, "vortex/RACE_V125.exe"), name="vortex_race"),
    UpdatePackage(os.path.join(d, "vortex/VIBE_V113.exe"), name="vortex_vibe"),
    UpdatePackage(os.path.join(d, "vortex/CYPHER_V136.exe"), name="vortex_cypher"),
    UpdatePackage(os.path.join(d, "vortex/TAB_60_V1113.exe"), "name=vortex_tab60"),
    UpdatePackage(os.path.join(d, "vortex/TAB_75_V100.exe"), name="vortex_tab75"),
    UpdatePackage(os.path.join(d, "vortex/TAB_90_V100.exe"), name="vortex_tab90"),
    # TEX
    UpdatePackage(os.path.join(d, "tex/AP_0163_1.01.01r.exe"), name="tex_yoda_ii"),
    UpdatePackage(os.path.join(d, "tex/1.00.31.exe"), name="tex_yoda_ii"),
    # Mistel
    UpdatePackage(os.path.join(d, "mistel/BOROCO_MD200.exe"), name="boroco_md200"),
    UpdatePackage(os.path.join(d, "mistel/BOROCO_MD600.exe"), name="boroco_md600"),
    # KBP
    UpdatePackage(os.path.join(d, "kbp/cykb112_v106.exe"), type=UpdatePackage.TYPE_KBPV60),
    UpdatePackage(os.path.join(d, "kbp/cykb112_v107.exe"), type=UpdatePackage.TYPE_KBPV60),
    UpdatePackage(os.path.join(d, "kbp/cykb129_v106.exe"), type=UpdatePackage.TYPE_KBPV80),
    # Cooler Master
    UpdatePackage(os.path.join(d, "coolermaster/masterkeys-pro-l-white-v1.08.exe"), name="cm_mk_pro_l_white"),
    UpdatePackage(os.path.join(d, "coolermaster/masterkeys-pro-m-white-v1.06.exe"), name="cm_mk_pro_m_white"),
    UpdatePackage(os.path.join(d, "coolermaster/mech_FW108.exe")),
    UpdatePackage(os.path.join(d, "coolermaster/rapid_i_v122_us.exe")),
    UpdatePackage(os.path.join(d, "coolermaster/rapid_i_v122_eu.exe")),
    UpdatePackage(os.path.join(d, "coolermaster/XTI_v114_us.exe")),
    UpdatePackage(os.path.join(d, "coolermaster/XTi_v114_eu.exe")),
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
