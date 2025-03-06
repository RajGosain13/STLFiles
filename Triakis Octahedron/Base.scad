obj_height=.98; // Toggleable
slab_height=0.25; 
obj_width = 25; //adjust to make pretty
scale_factor = 1.0 / obj_width;
rotation = 82; //adjust to make pretty
filename="All.stl";


rotate([63,0,90]) {
    // First Line: Shape Name (Larger Font)
    translate([-0.93, -0.33, 0.95]) linear_extrude(0.1) 
    text("Triakis Octahedron", size=0.1);

    // Second Line: Mu Value (Smaller Font)
    translate([-0.93, -0.45, 0.95]) linear_extrude(0.1) 
    text("μ = 1.0306624927073935", size=0.08);
}
rotate([0,0,90])translate([0,-2.08,0])polyhedron(
               points=[[-0.99,0.99,0], [0.99,0.99,0], [0.99,1.09,0], [-0.99,1.09,0], [-0.99,1.09,slab_height], [0.99,1.09,slab_height]],
               faces=[[0,1,2,3],[5,4,3,2],[0,4,5,1],[0,3,4],[5,2,1]]
               );
// Prints shape base is for
// color([1, 0, 0, 1]) translate([0,0,obj_height])rotate([0,0,rotation])scale([scale_factor, scale_factor, scale_factor])import(filename);
        
difference(){translate([-0.99,-0.99,0])
cube(size=[1.98,1.98,slab_height]);
translate([0,0,obj_height])rotate([0,0,rotation])scale([scale_factor, scale_factor, scale_factor])import(filename);
}

difference(){translate([0,-0.96,slab_height])rotate([0,90,0])
cylinder(h=1.98, r1=0.03, r2=0.03, center=true, $fn=10);;
translate([0,0,obj_height])rotate([0,0,rotation])scale([scale_factor, scale_factor, scale_factor])import(filename);
}
difference(){translate([0,-0.48,slab_height])rotate([0,90,0])
cylinder(h=1.98, r1=0.03, r2=0.03, center=true, $fn=10);;
translate([0,0,obj_height])rotate([0,0,rotation])scale([scale_factor, scale_factor, scale_factor])import(filename);
}
difference(){translate([0,0,slab_height])rotate([0,90,0])
cylinder(h=1.98, r1=0.03, r2=0.03, center=true, $fn=10);;
translate([0,0,obj_height])rotate([0,0,rotation])scale([scale_factor, scale_factor, scale_factor])import(filename);
}
difference(){translate([0,0.48,slab_height])rotate([0,90,0])
cylinder(h=1.98, r1=0.03, r2=0.03, center=true, $fn=10);;
translate([0,0,obj_height])rotate([0,0,rotation])scale([scale_factor, scale_factor, scale_factor])import(filename);
}
difference(){translate([0,0.96,slab_height])rotate([0,90,0])
cylinder(h=1.98, r1=0.03, r2=0.03, center=true, $fn=10);;
translate([0,0,obj_height])rotate([0,0,rotation])scale([scale_factor, scale_factor, scale_factor])import(filename);
}


difference(){translate([-0.96,0,slab_height])rotate([90,0,0])
cylinder(h=1.98, r1=0.03, r2=0.03, center=true, $fn=10);;
translate([0,0,obj_height])rotate([0,0,rotation])scale([scale_factor, scale_factor, scale_factor])import(filename);
}
difference(){translate([-0.48,0,slab_height])rotate([90,0,0])
cylinder(h=1.98, r1=0.03, r2=0.03, center=true, $fn=10);;
translate([0,0,obj_height])rotate([0,0,rotation])scale([scale_factor, scale_factor, scale_factor])import(filename);
}
difference(){translate([0,0,slab_height])rotate([90,0,0])
cylinder(h=1.98, r1=0.03, r2=0.03, center=true, $fn=10);;
translate([0,0,obj_height])rotate([0,0,rotation])scale([scale_factor, scale_factor, scale_factor])import(filename);
}
difference(){translate([0.48,0,slab_height])rotate([90,0,0])
cylinder(h=1.98, r1=0.03, r2=0.03, center=true, $fn=10);;
translate([0,0,obj_height])rotate([0,0,rotation])scale([scale_factor, scale_factor, scale_factor])import(filename);
}
difference(){translate([0.96,0,slab_height])rotate([90,0,0])
cylinder(h=1.98, r1=0.03, r2=0.03, center=true, $fn=10);;
translate([0,0,obj_height])rotate([0,0,rotation])scale([scale_factor, scale_factor, scale_factor])import(filename);
}