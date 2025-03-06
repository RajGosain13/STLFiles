// Auto-generated OpenSCAD file

    shift = 0.25;

    inner_points = 10*[[0.22327401859321738, -0.8367488946038767, 0.6123724356961423], [-0.22327401859321738, 0.8367488946038767, -0.6123724356961423], [0.836282808612776, -0.22501347519511394, -0.6123724356952596], [-0.836282808612776, 0.22501347519511394, 0.6123724356952596], [0.613008790018514, 0.6117354194092477, 0.6123724356959815], [-0.613008790018514, -0.6117354194092477, -0.6123724356959815], [0.8362828086122537, -0.2250134751948715, 0.30618621784843225], [0.6130087900190364, 0.6117354194090052, -0.30618621784771016], [0.2232740185937397, -0.8367488946041193, -0.3061862178475494], [5.22267782335276e-13, -2.42445028968155e-13, -0.9185586535436918], [-5.22267782335276e-13, 2.42445028968155e-13, 0.9185586535436918], [-0.2232740185937397, 0.8367488946041193, 0.3061862178475494], [-0.6130087900190364, -0.6117354194090052, 0.30618621784771016], [-0.8362828086122537, 0.2250134751948715, -0.30618621784843225]];

    outer_points_unshifted = 10*[[-0.4707968572409631, 0.904114699830419, 0.293132954071328], [0.4707968572409631, -0.904114699830419, -0.293132954071328], [0.5606144055656594, 0.0, 0.900395184500818], [-0.5606144055656594, 0.0, -0.900395184500818], [0.7675036205024015, 0.5545958975240901, -0.4778719315519111], [-0.7675036205024015, -0.5545958975240901, 0.4778719315519111], [0.42866058441354893, 0.7293552986772546, 0.3578281035101174], [0.899457441654512, -0.17475940115316446, 0.06469514943878946], [-0.3388430360888526, 0.17475940115316446, 0.8357000350620285], [0.13195382115211052, -0.7293552986772546, 0.5425670809907006], [-0.13195382115211052, 0.7293552986772546, -0.5425670809907006], [0.3388430360888526, -0.17475940115316446, -0.8357000350620285], [-0.899457441654512, 0.17475940115316446, -0.06469514943878946], [-0.42866058441354893, -0.7293552986772546, -0.3578281035101174]];

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
    // color([1, 0, 0, 0.5]) inner_hull(); // Transparent red
    // color([0, 0, 1, 1]) outer_minus_inner(); // Opaque blue
    color([1, 1, 0, 1]) outer_minus_inner_diff(); // Opaque yellow
    