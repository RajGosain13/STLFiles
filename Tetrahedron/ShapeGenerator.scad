// Auto-generated OpenSCAD file

    shift = 2;

    inner_points = 10*[[0.12901184565419158, -1.1699259752211888, 1.4142135623758847], [1.0490265825492964, 1.1002222322471154, -5.792921697889142e-12], [0.12901184565014698, -1.1699259752302433, -1.414213562370305], [-1.704632831118821, 0.45418830626724893, 2.1305179842556754e-13]];

    outer_points_unshifted = 10*[[-1.6152381377604375, 0.6038761652565141, -0.16229397819784264], [1.044668423926776, 1.2788016175447572, 0.52281383590649], [0.02365654881311341, -1.2788016175447572, 1.1679498236924246], [0.5469131650205479, -0.6038761652565141, -1.5284696814010719]];
    
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
    