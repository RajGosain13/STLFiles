// Auto-generated OpenSCAD file

    inner_points = 10*[[-2.221843475110553, -0.29097946152346194, -0.8984262072237021], [2.221843475110553, 0.29097946152346194, 0.8984262072237021], [0.40822934998208266, 1.7751470882990328, -1.5844963671346368], [-0.40822934998208266, -1.7751470882990328, 1.5844963671346368], [0.8515794118389997, -1.6101586544875546, -1.5844963671327748], [-0.8515794118389997, 1.6101586544875546, 1.5844963671327748], [-0.3984878257182108, -0.05218719241562808, -1.6847800894188376], [1.442147576003708, 0.18886808625444818, -0.9404994497718814], [-1.103959309361045, 1.2817119121066907, -0.37214031982424955], [0.7366760923608737, 1.522767190776767, 0.3721403198227068], [-0.7366760923608737, -1.522767190776767, -0.3721403198227068], [1.103959309361045, -1.2817119121066907, 0.37214031982424955], [-1.442147576003708, -0.18886808625444818, 0.9404994497718814], [0.3984878257182108, 0.05218719241562808, 1.6847800894188376]];

    outer_points = 10*[[2.3937726471049503, 0.313495835182863, -6.43015375372423e-06], [-2.3937726471049503, -0.313495835182863, 6.43015375372423e-06], [6.485062154546661e-06, 0.0, 2.4142135623643846], [-6.485062154546661e-06, 0.0, -2.4142135623643846], [0.31349583518173196, -2.393772647113587, -8.421127310518333e-07], [-0.31349583518173196, 2.393772647113587, 8.421127310518333e-07], [1.1213900085490662, -0.8616788689919702, 0.9999969877249849], [-0.8616761827881642, -1.121387322352415, 1.0000023146387709], [0.8616815551895586, 1.121387322352415, 0.9999976853540135], [-1.1213846361476718, 0.8616788689919702, 1.0000030122677992], [1.1213846361476718, -0.8616788689919702, -1.0000030122677992], [-0.8616815551895586, -1.121387322352415, -0.9999976853540135], [0.8616761827881642, 1.121387322352415, -1.0000023146387709], [-1.1213900085490662, 0.8616788689919702, -0.9999969877249849]];

    // Convex hull for inner set (I)
    module inner_hull() {
        hull() {
            for (p = inner_points) {
                translate(p) sphere(r=0.1);
            }
        }
    }

    // Convex hull for outer set (O) minus inner hull (O \ I)
    module outer_minus_inner() {
        difference() {
            hull() {
                for (p = outer_points) {
                    translate(p) sphere(r=0.1);
                }
            }
            inner_hull(); // Subtract inner hull
        }
    }

    // Convex hull for outer set (O) minus all translated inner hulls
    module outer_minus_AllTranslationInner() {
        difference() {
            hull() {
                for (p = outer_points) {
                    translate(p) sphere(r=0.1);
                }
            }
            hull() {
                translate([0,0,50]) inner_hull();
                translate([0,0,-50]) inner_hull();
            }; // Subtract translated inner hulls
        }
    }

    // Difference between outer_minus_inner and outer_minus_AllTranslationInner
    module outer_minus_inner_diff() {
        difference() {
            // Outer minus inner
            difference() {
                hull() {
                    for (p = outer_points) {
                        translate(p) sphere(r=0.1);
                    }
                }
                inner_hull();
            }

            // Subtract Outer minus AllTranslationInner
            difference() {
                hull() {
                    for (p = outer_points) {
                        translate(p) sphere(r=0.1);
                    }
                }
                hull() {
                    translate([0,0,50]) inner_hull();
                    translate([0,0,-50]) inner_hull();
                };
            }
        }
    }

    // Rendering all with colors applied
    color([1, 0, 0, 0.5]) inner_hull(); // Transparent red
    color([0, 0, 1, 1]) outer_minus_inner(); // Opaque blue
    // color([0, 1, 0, 1]) outer_minus_AllTranslationInner(); // Opaque green
    color([1, 1, 0, 1]) outer_minus_inner_diff(); // Opaque yellow
    