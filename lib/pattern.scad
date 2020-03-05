// Produces a set of copies of the children.
// Children start at pos0 and are repeated count more times
// in the direction of dpos.
module linear_pattern(pos0,dpos,count) {
	for(i = [0:count]) {
		translate([
			pos0[0]+i*dpos[0],
			pos0[1]+i*dpos[1],
			pos0[2]+i*dpos[2]])
		children([0:$children-1]);
	}
}
