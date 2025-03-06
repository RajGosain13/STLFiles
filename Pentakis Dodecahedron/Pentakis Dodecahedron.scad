// Auto-generated OpenSCAD file

    shift = 0.1;

    inner_points = 10*[[5.706443019642959e-06, -0.2723516987986492, 2.5837617057555686], [1.4999954393425396, 1.0642537474213205, -1.8350415916407063], [-1.4999954393425396, -1.0642537474213205, 1.8350415916407063], [-5.706443019642959e-06, 0.2723516987986492, -2.5837617057555686], [0.9270536898503097, -2.3455753471556426, 0.6235765766532704], [1.4999987850420502, -1.8350374962478342, -1.0642560933519971], [-1.4999987850420502, 1.8350374962478342, 1.0642560933519971], [-0.9270536898503097, 2.3455753471556426, -0.6235765766532704], [2.4270527678798555, 0.2381872333395192, 0.8959250547901861], [-1.5000012149505249, -1.8350392457153057, -1.0642496520232227], [1.5000012149505249, 1.8350392457153057, 1.0642496520232227], [-2.4270527678798555, -0.2381872333395192, -0.8959250547901861], [4.962674139297185e-06, -1.7387961310994404, 1.8390700989324391], [1.330582852496041, -0.5531495795607023, -2.0806647086000423], [-1.330582852496041, 0.5531495795607023, 2.0806647086000423], [-4.962674139297185e-06, 1.7387961310994404, -1.8390700989324391], [2.1529364705869334, -1.285918487941708, 0.3418610979985478], [-1.6062511876135943e-07, -2.4225275722759347, -0.7327693879394935], [1.6062511876135943e-07, 2.4225275722759347, 0.7327693879394935], [-2.1529364705869334, 1.285918487941708, -0.3418610979985478], [1.330591142168375, 0.5531511314398159, 2.080658994767834], [2.1529335027574232, 1.2859209989348601, -0.3418703431732669], [-2.1529335027574232, -1.2859209989348601, 0.3418703431732669], [-1.330591142168375, -0.5531511314398159, -2.080658994767834], [1.5000045606500354, -1.0642519979538485, 1.8350351503119327], [2.427049198357815, -0.2381844026416876, -0.8959354770790755], [-0.9270482763947859, -2.345576428386003, 0.6235805576133857], [-3.638687006146668e-06, -1.519508833073842, -2.1073900697776224], [3.638687006146668e-06, 1.519508833073842, 2.1073900697776224], [0.9270482763947859, 2.345576428386003, -0.6235805576133857], [-2.427049198357815, 0.2381844026416876, 0.8959354770790755], [-1.5000045606500354, 1.0642519979538485, -1.8350351503119327]];

    outer_points_unshifted = 10*[[-0.19608520439314178, -0.9270801333840294, -2.4191058304470165], [0.19608700353766162, -0.9270218327319238, 2.4191280265173996], [-0.19608700353766162, 0.9270218327319238, -2.4191280265173996], [0.19608520439314178, 0.9270801333840294, 2.4191058304470165], [2.344218701663454, -1.1134433769019005e-05, -1.1201065478994996], [2.4940151556499304, 1.1134433769019005e-05, 0.7279343399404099], [-2.4940151556499304, -1.1134433769019005e-05, -0.7279343399404099], [-2.344218701663454, 1.1134433769019005e-05, 1.1201065478994996], [0.9240227990973536, -2.427050982949786, -0.0748691719653011], [0.9240180888758501, 2.427050982949786, -0.0749272820319791], [-0.9240180888758501, -2.427050982949786, 0.0749272820319791], [-0.9240227990973536, 2.427050982949786, 0.0748691719653011], [1.1522975479796653, -2.5858029875943017e-05, -2.253397695612072], [1.5001770417057199, 2.5858029875943017e-05, 2.0383963444847573], [-1.5001770417057199, -2.5858029875943017e-05, -2.0383963444847573], [-1.1522975479796653, 2.5858029875943017e-05, 2.253397695612072], [2.145898311350253, -1.33058699723953, -0.1739238179767419], [2.1458957290561314, 1.33058699723953, -0.17395567577440402], [-2.1458957290561314, -1.33058699723953, 0.17395567577440402], [-2.145898311350253, 1.33058699723953, 0.1739238179767419], [-0.10749858643607466, -2.152950967663567, -1.3262115212473227], [0.10750276467573276, -2.1529190053808764, 1.326263068246747], [-0.10750276467573276, 2.1529190053808764, -1.326263068246747], [0.10749858643607466, 2.152950967663567, 1.3262115212473227], [1.3739100632364183, -1.500018015784093, -1.61626640454501], [1.616285817180746, -1.4999819839995254, 1.3739265645794962], [1.3739071521594346, 1.4999819839995254, -1.6163023185413057], [1.6162829061037622, 1.500018015784093, 1.3738906505832005], [-1.6162829061037622, -1.500018015784093, -1.3738906505832005], [-1.3739071521594346, -1.4999819839995254, 1.6163023185413057], [-1.616285817180746, 1.4999819839995254, -1.3739265645794962], [-1.3739100632364183, 1.500018015784093, 1.61626640454501]];
    
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
    