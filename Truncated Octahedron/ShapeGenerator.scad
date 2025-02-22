// Auto-generated OpenSCAD file

    shift = 0.25;

    inner_points = 10*[[-1.7318858006234514, 0.023907605455431507, -1.4142135623731846], [-1.714980570684405, 1.2485357993167547, -0.7071067811861695], [-1.7487910305625782, -1.2007205884064303, -0.7071067811871046], [-1.7149805706844856, 1.248535799316216, 0.7071067811869255], [-1.748791030562659, -1.2007205884069694, 0.7071067811859905], [-1.7318858006236126, 0.023907605454353924, 1.4142135623730054], [-0.5998355734598786, -1.6248683899966199, -1.4142135623737482], [-0.5491198836427398, 2.04901619158735, 0.7071067811872969], [-0.5829303435207519, -0.4002401961347579, -2.1213203435598285], [-0.5491198836426593, 2.0490161915878886, -0.7071067811857982], [-0.5829303435209935, -0.40024019613637424, 2.1213203435594568], [-0.5998355734600398, -1.6248683899976974, 1.414213562372442], [0.599835573459879, 1.6248683899966216, 1.4142135623737482], [0.5491198836427402, -2.049016191587348, -0.7071067811872969], [0.5829303435207523, 0.4002401961347596, 2.1213203435598285], [0.5491198836426597, -2.049016191587887, 0.7071067811857982], [0.5829303435209939, 0.4002401961363759, -2.1213203435594568], [0.5998355734600402, 1.6248683899976992, -1.414213562372442], [1.7318858006234519, -0.023907605455429876, 1.4142135623731846], [1.7149805706844055, -1.248535799316753, 0.7071067811861695], [1.7487910305625787, 1.200720588406432, 0.7071067811871046], [1.714980570684486, -1.2485357993162143, -0.7071067811869255], [1.7487910305626595, 1.2007205884069712, -0.7071067811859905], [1.731885800623613, -0.023907605454352294, -1.4142135623730054]];

    outer_points_unshifted = 10*[[1.8872103946003194, -0.7399369194726597, 0.9438910327542147], [1.906836077173567, 0.674106390466402, 0.9537068465318261], [1.6923784357468117, -1.4359868196078143, -0.27165618736154307], [1.7316298008933075, 1.392099800270309, -0.2520245598063201], [1.517172159466552, -0.7179934098039071, -1.4773875936996894], [1.5367978420398, 0.6960499001351546, -1.467571779922078], [0.602902554769109, -2.1320367197429686, 0.3015425925479229], [0.661779602488853, 2.1100932100742162, 0.33099003388075743], [0.7977345136226167, -1.4359868196078143, 1.5170898126636807], [0.8369858787691128, 1.392099800270309, 1.5367214402189036], [0.2721156847818378, 0.7179934098039071, -2.1001044063507583], [0.25249000220858975, -0.6960499001351546, -2.1099202201283696], [-0.602902554769109, 2.1320367197429686, -0.3015425925479229], [-0.661779602488853, -2.1100932100742162, -0.33099003388075743], [-0.7977345136226167, 1.4359868196078143, -1.5170898126636807], [-0.8369858787691128, -1.392099800270309, -1.5367214402189036], [-0.2721156847818378, -0.7179934098039071, 2.1001044063507583], [-0.25249000220858975, 0.6960499001351546, 2.1099202201283696], [-1.8872103946003194, 0.7399369194726597, -0.9438910327542147], [-1.906836077173567, -0.674106390466402, -0.9537068465318261], [-1.6923784357468117, 1.4359868196078143, 0.27165618736154307], [-1.7316298008933075, -1.392099800270309, 0.2520245598063201], [-1.517172159466552, 0.7179934098039071, 1.4773875936996894], [-1.5367978420398, -0.6960499001351546, 1.467571779922078]];
    
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
    