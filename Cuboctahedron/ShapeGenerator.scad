// Auto-generated OpenSCAD file

    inner_points = 10*[[0.20710693988208648, -0.11957288099850123, 1.3938468501174708], [-1.2071077061074778, 0.696921823046418, 0.2391463117374062], [1.2071077061074778, -0.696921823046412, -0.2391463117374062], [-0.2071069398820867, 0.11957288099850712, -1.3938468501174708], [0.20710847234179258, -1.2742734193816845, 0.5773502691967429], [-1.2071061736477717, -0.45777871533676523, -0.5773502691833217], [1.2071061736477717, 0.4577787153367711, 0.5773502691833217], [-0.2071084723417928, 1.2742734193816903, -0.5773502691967429], [-0.9999992337656851, -0.5773515963352692, 0.8164965809341491], [1.5324597058593505e-06, -1.15470053838318, -0.8164965809207279], [-1.5324597060731924e-06, 1.1547005383831859, 0.8164965809207279], [0.9999992337656849, 0.5773515963352752, -0.8164965809341491]];

    outer_points = 10*[[-0.40824748125735855, -0.7071051557654474, -1.1547018198378944], [1.2247458098265853, -0.7071051557654474, -1.4642153502997246e-06], [-1.2247458098265853, 0.7071051557654474, 1.4642153502997246e-06], [0.40824748125735855, 0.7071051557654474, 1.1547018198378944], [-1.2247439329544203, -0.7071084066039113, -1.1900833506439668e-06], [0.4082493581295237, -0.7071084066039113, 1.1546991655391934], [-0.4082493581295237, 0.7071084066039113, -1.1546991655391934], [1.2247439329544203, 0.7071084066039113, 1.1900833506439668e-06], [1.876872165147656e-06, -1.4142135623693588, -2.654298700943848e-06], [-0.8164964516970618, -3.250838463864092e-06, 1.154700629754544], [0.8164964516970618, 3.250838463864092e-06, -1.154700629754544], [-1.876872165147656e-06, 1.4142135623693588, 2.654298700943848e-06]];

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
    