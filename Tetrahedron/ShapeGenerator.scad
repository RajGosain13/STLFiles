// Auto-generated OpenSCAD file

    shift = 0;

    inner_points = 10*[[0.8047437220960513, -1.393846849991472, 0.23914631182649504],
  [0.8047239539953089, 0.915554226459343, -1.3938468503444428],
  [-1.609481771203065, -2.0664967176731164e-05, -0.23914631141293652],
  [0.3905083451067155, 1.15469699302005, 1.3938468499308843]];

    outer_points_unshifted = 10*[[0.8165025346254455, -1.4142135622176688, -0.577341849678191],
  [-1.6329993133688663, -2.096692104291975e-05, -0.5773328694065492],
  [1.8454997806838236e-05, 2.096692104291975e-05, 1.7320508073436534],
  [0.8164783237456139, 1.4142135622176688, -0.5773760882589132]];
    
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
    