xa = 0;
dx = 0.5;
xb = 36*2;
ya = 0;
dy = 0.5;
yb = 36*2;

for(i=[xa:dx:xb]) {
	for(j=[ya:dy:yb]) {
		color( [0.5+sin(10*i)/2, 0.5+sin(10*j)/2, 0.5+sin(10*(i+j))/2] )
			translate( [i, j, 0] )
			cube( size = [1, 1, 11+10*cos(10*i)*sin(10*j)] );
	}
}
