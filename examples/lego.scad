wallThickness = 1;
brickDepth = 10.0;
// bop is thing on top
// doot is thing on bottom that fits between the bops
bopRadius = 3.0;
bopDepth = 1.5;
bopSpace = 2.0; // on each side (think radius)
bopC2C = 2*(bopRadius + bopSpace);
bopFirstCenter = wallThickness + bopRadius;
bopsX = 2;
bopsY = 3;
dootRadius = sqrt(2)*bopSpace + sqrt(2)*bopRadius - bopRadius;
dootFirstCenter = bopFirstCenter + bopC2C/2;
dootC2C = bopC2C;
brickX = 2*wallThickness + (bopsX-1)*bopC2C + 2*bopRadius;
brickY = 2*wallThickness + (bopsY-1)*bopC2C + 2*bopRadius;
$fn = 30;

// bops
translate([0,0,brickDepth])
for(j=[0:bopsY-1]){
    translate([0,bopFirstCenter+j*bopC2C,0]) {
        for(i=[0:bopsX-1]){
        translate([bopFirstCenter+i*bopC2C,0,0])
        cylinder(r=bopRadius,h=bopDepth);
        }
    }
}

// hollow out brick
difference() {
    cube([brickX,brickY,brickDepth]);
    linear_extrude(height=brickDepth-wallThickness)
    difference() {
        translate([wallThickness,wallThickness])
        square([brickX - 2*wallThickness,
            brickY - 2*wallThickness]);
        // bops
        translate([0,0,0*brickDepth])
        for(j=[0:bopsY-2]){
            translate([0,dootFirstCenter+j*dootC2C,0]) {
                for(i=[0:bopsX-2]){
                    translate([dootFirstCenter+i*dootC2C,0,0])
                    difference() {
                        circle(r=dootRadius);
                        circle(r=dootRadius - wallThickness);
                    }
                }
            }
        }
    };
// brick
}