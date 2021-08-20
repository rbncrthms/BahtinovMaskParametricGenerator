capDiam=151.5;
outerDiam=125;
innerDiam=50;
focalLen=1250;
BahtinovFactor=150;

GridPeriod=focalLen/BahtinovFactor;

module mask() {
    difference() {
        translate([0,0,-0.001]) {
            cylinder(d=outerDiam,h=2.002,$fn=360);
        }
        translate([0,0,-1]) {
            cylinder(d=innerDiam,h=4,$fn=360);
            translate([-outerDiam,-GridPeriod/4,0]) {
                cube([outerDiam*2,GridPeriod/2,4]);
            }
            translate([-GridPeriod/4,0,0]) {
                cube([GridPeriod/2,outerDiam/2,4]);
            }
        }
        
    }
}

module Bahtoniv() {
    BahtinovBottom();
    BahtinovTopLeft();
    BahtinovTopRight();
}

module BahtinovBottom() {
    for (slot=[-outerDiam/2-3*GridPeriod/4:GridPeriod:outerDiam/2+GridPeriod]) {
        translate([slot-GridPeriod/2,-outerDiam/2,-0.002]) {
            cube([GridPeriod/2,outerDiam/2,2.004]);
        }
    }
}

module BahtinovTopLeft() {
    intersection() {
        translate([-outerDiam/2,0,-0.002]) {
            cube([outerDiam/2-GridPeriod/4,outerDiam/2,2.002]);
        }
        for (slot=[-outerDiam/2-3*GridPeriod/4:GridPeriod:outerDiam/2+GridPeriod]) {
            rotate([0,0,20]) {
                translate([slot-GridPeriod/2,0,-0.002]) {
                    cube([GridPeriod/2,outerDiam,2.004]);
                }
            }
        }
    }
}

module BahtinovTopRight() {
    intersection() {
        translate([GridPeriod/4,0,-0.002]) {
            cube([outerDiam/2-GridPeriod/4,outerDiam/2,2.002]);
        }
        for (slot=[-outerDiam/2-3*GridPeriod/4:GridPeriod:outerDiam/2+GridPeriod]) {
            rotate([0,0,-20]) {
                translate([slot-GridPeriod/2,0,-0.002]) {
                    cube([GridPeriod/2,outerDiam,2.004]);
                }
            }
        }
    }
}

difference() {
    cylinder(d=capDiam+4,h=12,$fn=360);
    translate([0,0,2]) cylinder(d=capDiam,h=13,$fn=360);
    translate([0,0,-1]) cylinder(d=innerDiam-GridPeriod,h=4,$fn=360);
    difference() {
        mask();
        Bahtoniv();
    }
}
