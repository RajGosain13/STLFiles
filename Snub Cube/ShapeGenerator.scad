// Auto-generated OpenSCAD file

    inner_points = 10*[[-0.9619280030809705, -0.21776887860633187, 1.925057075212961], [-1.7861093101272143, -1.2188013311674697, 0.053947732570656215], [0.6173373045353625, 1.2188013311674197, -1.6768993643036296], [2.1307000086728896, 0.21776887860644203, -0.30210544347998747], [-1.573413807384223, 1.4809108094590682, -0.09922537774321771], [0.7611001812334521, -1.9055577204426604, 0.6842147313644074], [0.4076718243584673, 1.9055577204427707, 0.9387369003685662], [0.40464180179237125, -1.480910809459118, -1.5237262539897558], [-1.0121855894512641, 1.3027105454435493, 1.3989278314929954], [-0.4818921042078648, -2.0837579844583027, -0.32296466143624797], [-0.1535563935744915, 2.0837579844582894, -0.5594163088676467], [1.647634087233688, -1.3027105454434755, -0.5165468611891005], [-2.008643459397785, 0.2023077608806283, 0.7765285141797601], [-0.7393938538103997, -1.6388779706544299, 1.202476293603857], [1.3748423515928236, 1.6388779706545036, -0.3200953232999624], [1.3731949616154284, -0.20230776088064173, -1.658909484483655], [0.3517960678972403, 0.7082694102758283, 2.013247992550328], [-1.1641096940480111, -1.1329163212594207, -1.4282586389291383], [-0.9855971757022011, 1.1329163212593036, -1.5568148016705303], [1.7979108018530396, -0.7082694102756509, 0.9718254480493408], [-1.9941876309775086, 0.10999250677307847, -0.8304762798167951], [0.5001099373183797, -0.891039945787832, 1.9064394498735424], [1.6495969324319002, 0.8910399457880095, 1.0786339907261262], [-0.15551923877270382, -0.10999250677319566, -2.1545971607828736]];

    outer_points = 10*[[-1.7861093101272378, -1.218801331167483, 0.05394773257047536], [-0.9619280030811203, -0.21776887860643623, 1.9250570752128846], [2.1307000086728944, 0.21776887860643623, -0.3021054434798307], [0.6173373045354636, 1.218801331167483, -1.6768993643035293], [0.7611001812333835, -1.9055577204427099, 0.6842147313643689], [-1.5734138073842294, 1.4809108094590613, -0.09922537774325535], [0.40464180179245535, -1.4809108094590613, -1.5237262539897984], [0.40767182435839056, 1.9055577204427099, 0.938736900368685], [-0.4818921042078646, -2.0837579844583014, -0.32296466143638025], [-1.0121855894513736, 1.30271054544347, 1.3989278314929876], [1.6476340872337034, -1.30271054544347, -0.5165468611890494], [-0.153556393574465, 2.0837579844583014, -0.5594163088675581], [-0.7393938538105033, -1.6388779706545002, 1.2024762936037283], [-2.0086434593978546, 0.2023077608805811, 0.7765285141796316], [1.3731949616155252, -0.2023077608805811, -1.6589094844835701], [1.3748423515928327, 1.6388779706545002, -0.32009532329979], [-1.1641096940479327, -1.132916321259365, -1.4282586389292722], [0.35179606789708695, 0.7082694102757165, 2.0132479925503857], [1.7979108018529546, -0.7082694102757165, 0.9718254480494307], [-0.9855971757021086, 1.132916321259365, -1.5568148016705443], [0.5001099373182297, -0.891039945787939, 1.9064394498735344], [-1.9941876309774682, 0.10999250677310773, -0.830476279816927], [-0.15551923877257323, -0.10999250677310773, -2.1545971607828895], [1.6495969324318116, 0.891039945787939, 1.078633990726282]];

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
    color([1, 0, 0, 0.5]) inner_hull(); // Transparent red
    // color([0, 0, 1, 1]) outer_minus_inner(); // Opaque blue
    // color([0, 1, 0, 1]) outer_minus_AllTranslationInner(); // Opaque green
    // color([1, 1, 0, 1]) outer_minus_inner_diff(); // Opaque yellow
    