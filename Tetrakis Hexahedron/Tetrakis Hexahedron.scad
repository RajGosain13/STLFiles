// Auto-generated OpenSCAD file

    shift = 0.25;

    inner_points = 10*[[1.5327957276060136, -0.12164394971032078, 0.4086441079125258], [-1.5327957276060136, 0.12164394971032078, -0.4086441079125258], [0.3222216494042708, -0.6680925499074873, -1.4075068573237228], [-0.3222216494042708, 0.6680925499074873, 1.4075068573237228], [0.2792140148487219, 1.438785979309287, -0.6190189331959671], [-0.2792140148487219, -1.438785979309287, 0.6190189331959671], [1.422820927906004, 0.4326996531276527, -1.078587788404776], [-0.6209067089020139, 0.5948915860747469, -1.6234465989548104], [1.050535574774375, -1.4856816526180632, -0.25322921081015326], [-0.993192062033643, -1.323489719670969, -0.7980880213601876], [0.993192062033643, 1.323489719670969, 0.7980880213601876], [-1.050535574774375, 1.4856816526180632, 0.25322921081015326], [0.6209067089020139, -0.5948915860747469, 1.6234465989548104], [-1.422820927906004, -0.4326996531276527, 1.078587788404776]];

    outer_points_unshifted = 10*[[-3.649148042351724e-05, -1.1250600440804117, -1.1249399521228471], [3.649148042351724e-05, 1.1250600440804117, 1.1249399521228471], [-1.590990256832662, 0.0, 5.1609501201958964e-05], [1.590990256832662, 0.0, -5.1609501201958964e-05], [-3.649537601964202e-05, 1.1249399527147135, -1.1250600434884823], [3.649537601964202e-05, -1.1249399527147135, 1.1250600434884823], [-1.06070882912607, -8.006091046552921e-05, -1.4999655907400848], [-1.0606601738188386, 1.4999999978634166, -4.565457628876734e-05], [-1.0606601686247104, -1.4999999978634166, 0.00011446724455804595], [-1.060611513317479, 8.006091046552921e-05, 1.5000344034083541], [1.060611513317479, -8.006091046552921e-05, -1.5000344034083541], [1.0606601686247104, 1.4999999978634166, -0.00011446724455804595], [1.0606601738188386, -1.4999999978634166, 4.565457628876734e-05], [1.06070882912607, 8.006091046552921e-05, 1.4999655907400848]];
    
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
    