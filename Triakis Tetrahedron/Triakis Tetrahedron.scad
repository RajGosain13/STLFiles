// Auto-generated OpenSCAD file

    inner_points = 10*[[1.0604459675587286, -1.499224011924999, -0.04976923122714006], [1.0605858378028112, 1.499218084698337, 0.04690017258485223], [-1.0628300308746872, 0.04833824506895366, -1.4977851479919946], [-1.0587749704965013, -0.04833125950038337, 1.5006542066342825], [0.6350357038940415, 0.02899917903699332, -0.9003925239805696], [0.6374687401209531, -0.029002523704608985, 0.8986710887951969], [-0.6365807810855463, -0.899530427482239, -0.028140103550911386], [-0.6364968589390965, 0.8995348304917629, 0.029861538736284082]];

    outer_points = 10*[[1.060590175160667, 1.4999938160676403, 0.012924090354969903], [1.0604502328208316, -1.4999938160676403, 0.021537304127526278], [-1.0848879892588956, 0.004307175273605468, 1.4825651752968407], [-1.036152418722603, -0.004307175273605468, -1.517026569779337], [0.6216914512335617, 0.002584305164163303, 0.9102159418676022], [0.6509327935553374, -0.002584305164163303, -0.8895391051781046], [-0.636270139692499, 0.8999962896405842, -0.012922382476515787], [-0.6363541050964001, -0.8999962896405842, -0.0077544542129819195]];

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
    