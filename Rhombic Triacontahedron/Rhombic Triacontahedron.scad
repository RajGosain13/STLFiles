// Auto-generated OpenSCAD file

    shift = 0.2;

    inner_points = 10*[[-1.4925768928517944, 0.3744972732538202, 0.7694208842939634], [0.10506355323964955, -1.5352510018008023, -0.7694208842939347], [-0.10506355323964955, 1.5352510018008023, 0.7694208842939347], [1.4925768928517944, -0.3744972732538202, -0.7694208842939634], [-0.8173996973653821, -1.3037989582358627, 0.7694208842937847], [-1.4276440459709443, -0.5743400271213236, -0.7694208842937383], [1.4276440459709443, 0.5743400271213236, 0.7694208842937383], [0.8173996973653821, 1.3037989582358627, -0.7694208842937847], [1.4125503771397584e-13, -1.2631123895450308e-13, 1.7204774005889667], [0.9873960974861977, -1.180289343940366, 0.7694208842936455], [-0.9873960974861977, 1.180289343940366, -0.7694208842936455], [-1.4125503771397584e-13, 1.2631123895450308e-13, -1.7204774005889667], [-0.6102443486053336, 0.7294589311143346, 1.2449491424414938], [0.9873960974861105, -1.180289343940288, -0.2938926261464043], [-0.9873960974861105, 1.180289343940288, 0.2938926261464043], [0.6102443486053336, -0.7294589311143346, -1.2449491424414938], [-1.427644045970857, -0.5743400271214016, 0.2938926261463116], [-0.8173996973654696, -1.3037989582357845, -0.2938926261462652], [0.8173996973654696, 1.3037989582357845, 0.2938926261462652], [1.427644045970857, 0.5743400271214016, -0.2938926261463116], [0.06493284688107887, -0.9488373003753483, 1.244949142441315], [-0.9224632506052604, 0.23145204356514415, -1.2449491424412973], [0.9224632506052604, -0.23145204356514415, 1.2449491424412973], [-0.06493284688107887, 0.9488373003753483, -1.244949142441315], [-0.8823325442463197, -0.3549616578606406, 1.2449491424414367], [0.10506355323973704, -1.5352510018008805, 0.2938926261461153], [-1.4925768928518819, 0.37449727325389837, -0.2938926261460865], [-0.5051807953658253, -0.8057920706863415, -1.2449491424414079], [0.5051807953658253, 0.8057920706863415, 1.2449491424414079], [1.4925768928518819, -0.37449727325389837, 0.2938926261460865], [-0.10506355323973704, 1.5352510018008805, -0.2938926261461153], [0.8823325442463197, 0.3549616578606406, -1.2449491424414367]];

    outer_points_unshifted = 10*[[1.0628525456970679, -1.330107906744217, 0.24738615252100915], [0.16810884819315208, 1.330107906744217, 1.078236920863433], [-0.16810884819315208, -1.330107906744217, -1.078236920863433], [-1.0628525456970679, 1.330107906744217, -0.24738615252100915], [0.3934802280314942, -0.37731459459103, 1.6318239772702994], [1.5982571461218291, 0.37731459459103, 0.5130792117368246], [-1.5982571461218291, -0.37731459459103, -0.5130792117368246], [-0.3934802280314942, 0.37731459459103, -1.6318239772702994], [-0.6981939930271678, -1.4325597335725755, 0.6483365204773054], [-1.251176009304342, 0.21154405657322783, 1.1618305348918885], [1.251176009304342, -0.21154405657322783, -1.1618305348918885], [0.6981939930271678, 1.4325597335725755, -0.6483365204773054], [0.07507530663137034, -1.5633011506528607, -0.06971423925335238], [-0.8196683908725453, 1.0969146628355733, 0.7611365290890716], [0.8196683908725453, -1.0969146628355733, -0.7611365290890716], [-0.07507530663137034, 1.5633011506528607, 0.06971423925335238], [1.1667495276900324, -0.5080560116713154, 0.9137732175396416], [0.8249878464632909, 0.5080560116713154, 1.2311299714674824], [-0.8249878464632909, -0.5080560116713154, -1.2311299714674824], [-1.1667495276900324, 0.5080560116713154, -0.9137732175396416], [-0.5942970110342034, -0.6105078384996738, 1.3147235854959378], [1.3550729912973065, 0.6105078384996738, -0.4954434698732562], [-1.3550729912973065, -0.6105078384996738, 0.4954434698732562], [0.5942970110342034, 0.6105078384996738, -1.3147235854959378], [0.28958324603852964, -1.1993664896639316, 0.965436912251667], [-0.26339877023864466, 0.44473730048187166, 1.47893092666625], [1.4943601641288646, -0.44473730048187166, -0.15330785328180774], [0.9413781478516903, 1.1993664896639316, 0.36018616113277535], [-0.9413781478516903, -1.1993664896639316, -0.36018616113277535], [-1.4943601641288646, 0.44473730048187166, 0.15330785328180774], [0.26339877023864466, -0.44473730048187166, -1.47893092666625], [-0.28958324603852964, 1.1993664896639316, -0.965436912251667]];
    
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
    