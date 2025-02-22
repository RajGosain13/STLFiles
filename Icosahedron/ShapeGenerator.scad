// Auto-generated OpenSCAD file

    shift = 0;

    inner_points = 10*[[-0.10478564415220674, 1.812125352983475, -0.5685557691238555], [-1.2232186825144085, 1.1159039129143473, 0.936231008159878], [-1.5758866823490085, 0.5080249991351536, -0.9362295409773502], [-0.755134871262123, -1.3015966072441039, -1.1634653355233544], [1.6251566094255592, 0.8084820900232448, -0.5685566758925255], [-0.18450606078529752, -0.3180278637050018, 1.8662394755739735], [0.7551348712621214, 1.3015966072441039, 1.1634653355233544], [-1.625156609425561, -0.8084820900232448, 0.5685566758925255], [0.1845060607852959, 0.3180278637050019, -1.8662394755739735], [0.10478564415220516, -1.812125352983475, 0.5685557691238555], [1.2232186825144067, -1.1159039129143473, -0.936231008159878], [1.5758866823490068, -0.5080249991351536, 0.9362295409773502]];

    outer_points_unshifted = 10*[[0.022492027587857028, -1.8836716169952243, 0.2632666647554888], [-1.646420939638002, -0.9154337478589233, -0.26327387176166644], [-0.8702839861489778, -0.6512080335983845, 1.5609509502798178], [0.13335927681165047, 1.0787342199736543, 1.5609554044545926], [1.5779012113784923, -0.9154337478589233, -0.5387418761903946], [-1.1224566938583869, 0.6512080335983845, -1.390702360729757], [-0.13335927681165047, -1.0787342199736543, -1.5609554044545926], [-1.5779012113784923, 0.9154337478589233, 0.5387418761903946], [1.1224566938583869, -0.6512080335983845, 1.390702360729757], [-0.022492027587857028, 1.8836716169952243, -0.2632666647554888], [1.646420939638002, 0.9154337478589233, 0.26327387176166644], [0.8702839861489778, 0.6512080335983845, -1.5609509502798178]];
    
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
                translate([0,0,5]) inner_hull();
                translate([0,0,-5]) inner_hull();
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
                    translate([0,0,5]) inner_hull();
                    translate([0,0,-5]) inner_hull();
                };
            }
        }
    }

    // Rendering all with colors applied
    // color([1, 0, 0, 0.5]) inner_hull(); // Transparent red
    // color([0, 1, 0, 1]) outer_minus_AllTranslationInner(); // Opaque green
    color([1, 1, 0, 1]) outer_minus_inner_diff(); // Opaque yellow
    