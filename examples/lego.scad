// configured variables
wallThickness = 1;
brickDepth = 10.0;
// bop is thing on top
// doot is thing on bottom that fits between the bops
bopRadius = 3.0;
bopDepth = 1.5;
bopSpace = 2.0; // on each side (think radius)
bopsX = 2;
bopsY = 3;

// calculated values
bopC2C = 2*(bopRadius + bopSpace);
bopFirstCenter = wallThickness + bopRadius;
dootRadius = sqrt(2)*bopSpace + sqrt(2)*bopRadius - bopRadius;
dootFirstCenter = bopFirstCenter + bopC2C/2;
dootC2C = bopC2C;
brickX = 2*wallThickness + (bopsX-1)*bopC2C + 2*bopRadius;
brickY = 2*wallThickness + (bopsY-1)*bopC2C + 2*bopRadius;

// variables that affect rendering
off = 0.001; // offset for previewing floor. larger values cause doots to look weird
$fn = 24; // resolution of circles

module bop(pos) {
    x = bopFirstCenter+bopC2C*pos[0];
    y = bopFirstCenter+bopC2C*pos[1];
    translate([x,y,brickDepth-(wallThickness/2)])
    cylinder(r=bopRadius,h=bopDepth+(wallThickness/2));
}

module doot(pos) {
    x = dootFirstCenter+dootC2C*pos[0];
    y = dootFirstCenter+dootC2C*pos[1];
    translate([x,y,0])
    difference() {
        circle(r=dootRadius);
        circle(r=dootRadius-wallThickness);
    }
}

// bops
for(j=[0:bopsY-1]){
        for(i=[0:bopsX-1]){
            bop([i,j]);
    }
}

// brick
difference() {
    // walls
    cube([brickX,brickY,brickDepth]);
    // carve out hollow parts
    translate([0,0,-off])
    linear_extrude(height=brickDepth-wallThickness+off)
    difference() {
        // profile of brick minus walls
        translate([wallThickness,wallThickness])
        square([brickX - 2*wallThickness,
            brickY - 2*wallThickness]);
        // doots
        for(j=[0:bopsY-2]){ 
                for(i=[0:bopsX-2]){
                    doot([i,j]);
            }
        }
    };
}