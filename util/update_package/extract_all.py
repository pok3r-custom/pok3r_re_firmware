
import os
import unittest
from updatepackage import UpdatePackage

d = os.path.join(os.path.dirname(__file__), "../../vendor")


class TestExtract(unittest.TestCase):
    def setUp(self):
        self.updaters = [
            UpdatePackage(os.path.join(d, "vortex/POK3R_RGB_V124.exe"), "pok3r_rgb"),
            UpdatePackage(os.path.join(d, "vortex/POK3R_RGB_V130.exe"), "pok3r_rgb"),
            UpdatePackage(os.path.join(d, "vortex/POK3R_RGB_V140.exe"), "pok3r_rgb"),
            UpdatePackage(os.path.join(d, "vortex/POK3R_RGB2_V105.exe"), "pok3r_rgb2"),
            UpdatePackage(os.path.join(d, "vortex/CORE_V141.exe"), "vortex_core"),
            UpdatePackage(os.path.join(d, "vortex/CORE_V143.exe"), "vortex_core"),
            UpdatePackage(os.path.join(d, "vortex/CORE_V145.exe"), "vortex_core"),
            UpdatePackage(os.path.join(d, "vortex/CORE_MPC.exe"), "vortex_core"),
            UpdatePackage(os.path.join(d, "vortex/CORE_RGB_V146.exe"), "vortex_core_rgb"),
            UpdatePackage(os.path.join(d, "vortex/RACE_V121.exe"), "vortex_race"),
            UpdatePackage(os.path.join(d, "vortex/RACE_V124.exe"), "vortex_race"),
            UpdatePackage(os.path.join(d, "vortex/RACE_V125.exe"), "vortex_race"),
            UpdatePackage(os.path.join(d, "vortex/VIBE_V113.exe"), "vortex_vibe"),
            UpdatePackage(os.path.join(d, "vortex/CYPHER_V136.exe"), "vortex_cypher"),
            UpdatePackage(os.path.join(d, "vortex/TAB_60_V1113.exe"), "vortex_tab60"),
            UpdatePackage(os.path.join(d, "tex/AP_0163_1.01.01r.exe"), "tex_yoda_ii"),
            UpdatePackage(os.path.join(d, "mistel/BOROCO_MD200.exe"), "boroco_md200"),
            UpdatePackage(os.path.join(d, "mistel/BOROCO_MD600.exe"), "boroco_md600"),
        ]

    def test_extract(self):
        for u in self.updaters:
            name = os.path.splitext(os.path.basename(u.exe))[0]
            with self.subTest(name):
                u.decode_maav102()
                u.print_info()


if __name__ == '__main__':
    unittest.main()
