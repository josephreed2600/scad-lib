$fn = 60;
use <pattern.scad>;
use <color.scad>;

module square_tubing(x,y,t,l,center=true) {
	color(c_glass_stained_red())
	difference() {
		cube([x,y,l],center=center);
		translate(center?[0,0,0]:[t,t,-1/2])
		cube([x-t-t,y-t-t,l+1],center=center);
	}
}

// Produces a cylinder pointing along the x-axis
module hole(d,t) {
	color(c_metal())
	rotate([0,90,0])
	cylinder(h=t*1.1,d=d,center=true);
}

x = 2;
y = 2;
l = 8;
thick = 1/8;
hole_d = 0.196; // #9 bit
color(c_glass_stained_yellow())
cube(2);
difference() {
	square_tubing(x,y,thick,l,true);
	for(i = [0:3]) {
		rotate([0,0,i*90])
		linear_pattern([0,-0.5,0],[0,1,0],1)
		linear_pattern([x/2-thick/2,0,-l/2+1],[0,0,1],l-2)
		hole(hole_d,thick);
	}
}