// Auto-generated OpenSCAD file

    shift = 2;

    inner_points = 10*[[0.6425345358559449, -1.259821175579955, -0.999999999999981], [0.6425345358559096, -1.2598211755799429, 1.0000000000000189], [-1.2598211627565699, -0.642534535552414, -1.0000000000000182], [1.2598211758834859, 0.6425345230325596, -0.9999999999999818], [-0.6425345227290287, 1.2598211630601008, -1.0000000000000189], [1.2598211758834508, 0.6425345230325717, 1.0000000000000182], [-1.259821162756605, -0.6425345355524019, 0.9999999999999818], [-0.642534522729064, 1.259821163060113, 0.999999999999981]];

    outer_points_unshifted = 10*[[-0.08729545859213583, -0.4638004049384796, 1.666513932521445], [-1.6235597497391208, -0.4638004049384796, 0.38593124181121496], [1.0650995308277986, -1.3359974492411661, 0.28403134519186607], [0.47116476031918614, 1.3359974492411661, 0.9965513455183639], [1.6235597497391208, 0.4638004049384796, -0.38593124181121496], [-1.0650995308277986, 1.3359974492411661, -0.28403134519186607], [-0.47116476031918614, -1.3359974492411661, -0.9965513455183639], [0.08729545859213583, 0.4638004049384796, -1.666513932521445]];
    
    outer_points = [for (p = outer_points_unshifted) [p[0], p[1], p[2] + shift]];


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
    color([0, 1, 0, 1]) outer_minus_AllTranslationInner(); // Opaque green
    color([1, 1, 0, 1]) outer_minus_inner_diff(); // Opaque yellow
    