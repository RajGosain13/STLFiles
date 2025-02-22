// Auto-generated OpenSCAD file

    shift = 0;

    inner_points = 10*[[-0.7217617826689717, 0.6065878485161154, -0.33333333333331405], [-0.6353813320543069, -0.3896743748726871, 0.6666666666666896], [-0.27450044071986923, -0.6929682991307544, -0.6666666666666534], [0.7217617826689717, -0.6065878485161154, 0.33333333333331405], [0.6353813320543069, 0.3896743748726871, -0.6666666666666896], [0.27450044071986923, 0.6929682991307544, 0.6666666666666534]];

    outer_points_unshifted = 10*[[-0.7655439763897738, 0.6433835716066518, 4.3410487328328886e-08], [-0.6433835716066508, -0.765543976389775, 3.648333112644759e-08], [-5.670541297058882e-08, 0.0, -0.9999999999999984], [0.7655439763897738, -0.6433835716066518, -4.3410487328328886e-08], [0.6433835716066508, 0.765543976389775, -3.648333112644759e-08], [5.670541297058882e-08, 0.0, 0.9999999999999984]];
    
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
    