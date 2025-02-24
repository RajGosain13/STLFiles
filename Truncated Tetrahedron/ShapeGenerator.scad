// Auto-generated OpenSCAD file

    shift = 4;

    inner_points = 10*[[1.5058415524902728, -0.8469090122267284, 2.828427124745977], [0.5858268155911234, -3.1170572197040873, 1.4142135623814647], [-1.247817861177845, -1.492942938206595, 2.8284271247519825], [2.425856289385377, 1.423239195241576, 1.4142135623642988], [0.5858268155870788, -3.117057219713142, -1.414213562364725], [-3.0814625379508573, 0.1311713432818428, 1.414213562376311], [-1.247817861185934, -1.4929429382247037, -2.8284271247403967], [-2.1614478010557527, 2.4013195507501472, -5.366929123340469e-12], [2.4258562893813322, 1.4232391952325214, -1.4142135623818908], [-3.0814625379549025, 0.13117134327278826, -1.4142135623698793], [0.5922116126123643, 3.047353476730014, -1.1372902619655179e-11], [1.5058415524821833, -0.8469090122448373, -2.828427124746403]];

    outer_points_unshifted = 10*[[-2.1858078515940984, 2.4865539480577854, 0.19822587951080473], [-3.206819726707762, -0.07104928703172886, 0.8433618672967396], [-2.683563110500327, 0.6038761652565141, -1.8530576377967574], [0.474098710093115, 3.1614794003460287, 0.8833336936151375], [-1.5679250401342106, -1.953727069833, 2.1736056691870065], [-0.5214118077193417, -0.6038761652565141, -3.2192333409999865], [0.5942262626467746, -3.1614794003460287, 0.8074299659837771], [2.138494753967872, 0.07104928703172886, -2.534125526895654], [2.1129933966666656, 1.2788016175447572, 2.2135774955054046], [1.1174828788542088, -2.4865539480577854, -1.8889895391097193], [2.6362500128741004, 1.953727069833, -0.48284200958809187], [1.091981521553003, -1.2788016175447572, 2.8587134832913392]];
    
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
    