function is_undef ( a ) = (undef == a);

module dim_length(l, sh=1, lbl=" ", linesize=0.02, depth=0, center=true) {
	// If label is " ", automatically label dimension
	// If label is "", leave blank
	// Otherwise, use given label
	label = (lbl==" ")?str(l, " mm"):lbl;
	// Actual height of lines includes height offset from tips,
	// radius of crossbar, font height, and
	// 0.1*fontsize padding on top and bottom of dimension label
	h = abs(sh); // height = abs(signed height)
	below = sh<0; // is this dimension upside-down?
	labellen = len(label)+2;
	widthperchar = l / labellen;
	fontsize = (label=="")?0:widthperchar * 1;
	radius = l*(linesize/2);
	h_act = h + radius + fontsize*1.2;
	fontrendersize = 72;

	module outline() {
		module upright() {
			translate([l/2,-radius,0])
				difference() {
					cube([radius, 2*radius, h_act]);
					translate([0,0,0])
						rotate([0,30,0])
						cube([radius*2,radius*2+2,radius*2]);
				}
		}
		projection() rotate([below?-90:90,0,180]) {
			// Uprights
			upright();
			mirror([1,0,0]) upright();
			// Crossbar
			translate([0,0,h+radius/2])
				cube([l,radius*2,radius],center=true);
		}
		projection() rotate([90,0,180]) {
			// Label
			translate([0, -radius, (below?-1:1)*(h + radius + (below?1.1:0.1)*fontsize)])
				rotate([90,0,180])
				linear_extrude(height=radius*2)
				scale(fontsize/fontrendersize)
				text(label, fontrendersize, font="Courier New", halign="center", $fn=1440*6);
		}
	}
	if(depth > 0) {
		translate(center?[0,0,-depth/2]:[l/2,0,0])
			linear_extrude(height=depth) outline();
	} else {
		translate(center?[0,0]:[l/2,0])
			outline();
	}
}

threeD = false;
if(threeD) {
	dim_length(20, 8, "20 mm", 0.1, 1);
	dim_length(30, 30, center=true);
	dim_length(40, 15, "40 mm", 0.1, 3, center=false);
	//rotate($vpr) dim_length(15, 30, "15 mm", 0.05, 1);
} else {
	dim_length(20, 8, "20 mm", 0.2);
	dim_length(30, 30, "", center=false);
	dim_length(50, 80, center=false);
	dim_length(45, -30, center=false);
	dim_length(40, 15, "40 mm", 0.05, center=false);
}
