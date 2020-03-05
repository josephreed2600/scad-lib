use <round_square.scad>;
use <extended_cylinder.scad>;

function is_undef ( a ) = (undef == a);

module shell_cylinder(h=1, ro=1, ri=0, center=false) {
    r1i = is_undef(ri[0])?ri:ri[0];
    r2i = is_undef(ri[1])?(is_undef(ri[0])?ri:ri[0]):ri[1];
    r1o = is_undef(ro[0])?ro:ro[0];
    r2o = is_undef(ro[1])?(is_undef(ro[0])?ro:ro[0]):ro[1];
    difference() {
        cylinder(h,r1=r1o,r2=r2o,center=center);
        extended_cylinder(h,r1=r1i,r2=r2i,shift=h/100,center=center);
    }
}

module shell_sphere(ro=1, ri=0) {
    difference() {
        sphere(ro);
        sphere(ri);
    }
}

module shell_cube(o = 1, i = 0, center = false) {
    xo = is_undef(o[0])?o:o[0];
    yo = is_undef(o[1])?(is_undef(o[0])?o:o[0]):o[1];
    zo = is_undef(o[2])?(is_undef(o[0])?o:o[0]):o[2];
    xi = is_undef(i[0])?i:i[0];
    yi = is_undef(i[1])?(is_undef(i[0])?i:i[0]):i[1];
    zi = is_undef(i[2])?(is_undef(i[0])?i:i[0]):i[2];
    xt = center?0:xo/2;
    yt = center?0:yo/2;
    zt = center?0:zo/2;
    translate([xt,yt,zt]) // translate handles center param
    difference() {
        cube([xo,yo,zo],center=true);
        cube([xi,yi,zi],center=true);
    }
}

module shell_square(o = 1, i = 0, center = false) {
    xo = is_undef(o[0])?o:o[0];
    yo = is_undef(o[1])?(is_undef(o[0])?o:o[0]):o[1];
    xi = is_undef(i[0])?i:i[0];
    yi = is_undef(i[1])?(is_undef(i[0])?i:i[0]):i[1];
    xt = center?0:xo/2;
    yt = center?0:yo/2;
    translate([xt,yt]) // translate handles center param
    difference() {
        square([xo,yo],center=true);
        square([xi,yi],center=true);
    }
}

module shell_round_square(o = 1, i = 0, or = 0, ir = 0, center = false) {
    xo = is_undef(o[0])?o:o[0];
    yo = is_undef(o[1])?(is_undef(o[0])?o:o[0]):o[1];
    xi = is_undef(i[0])?i:i[0];
    yi = is_undef(i[1])?(is_undef(i[0])?i:i[0]):i[1];
    xor = is_undef(or[0])?or:or[0];
    yor = is_undef(or[1])?(is_undef(or[0])?or:or[0]):or[1];
    xir = is_undef(ir[0])?ir:ir[0];
    yir = is_undef(ir[1])?(is_undef(ir[0])?ir:ir[0]):ir[1];
    xt = center?0:xo/2;
    yt = center?0:yo/2;
    translate([xt,yt])
    difference() {
        round_square([xo,yo],[xor,yor]);
        round_square([xi,yi],[xir,yir]);
    }
}

module shell_circle(o = 1, i = 0) {
    difference() {
        circle(o);
        circle(i);
    }
}

translate([0,0,-6]) shell_cylinder(10,[4,2],[3,1],true);
translate([0,0,0]) shell_cylinder();
translate([0,0,2]) shell_cylinder(1);
translate([0,0,4]) shell_cylinder(1,2);
translate([0,0,6]) shell_cylinder(1,3,2);
translate([0,0,8]) shell_cylinder(1,[2]);
translate([0,0,10]) shell_cylinder(1,[2],1);
translate([0,0,12]) shell_cylinder(1,[3,4],2);
translate([0,0,14]) shell_cylinder(1,[3,4],[2,3]);

translate([7,0,0]) shell_sphere();
translate([7,0,2.5]) shell_sphere(1);
difference() {
    translate([7,0,6]) shell_sphere(2,1);
    translate([7,0,8]) shell_sphere(2,1);
}

translate([11,0,0]) shell_cube();
translate([11,3,0]) shell_cube(2);
translate([11,6,0]) shell_cube([2]);
translate([11,9,0]) shell_cube([2,3,1]);
translate([11,3,3]) shell_cube(2,1);
translate([11,6,3]) shell_cube([2],1);
translate([11,9,3]) shell_cube([2,3,1],0.5);
translate([11,3,6]) shell_cube(2,[0.5,1]);
translate([11,6,6]) shell_cube([2],[0.5,1]);
translate([11,9,6]) shell_cube([2,3,1],[0.5,0.75,0.9]);

translate([14,0,0]) linear_extrude(1) shell_square();
translate([14,3,0]) linear_extrude(1) shell_square(2);
translate([14,3,3]) linear_extrude(1) shell_square(2,1);
translate([14,3,6]) linear_extrude(1) shell_square(2,[1.5,1]);
translate([14,6,0]) linear_extrude(1) shell_square([3,2]);
translate([14,6,3]) linear_extrude(1) shell_square([3,2],1);
translate([14,6,6]) linear_extrude(1) shell_square([3,2],[1.5,1]);

translate([18,0,0]) linear_extrude(1) shell_round_square();
translate([18,3,0]) linear_extrude(1) shell_round_square(2);
translate([18,3,3]) linear_extrude(1) shell_round_square(2,1,[0.5,0.25],[0.25,0.5]);
translate([18,3,6]) linear_extrude(1) shell_round_square(2,[1.5,1],[0.5,0.25]);
translate([18,6,0]) linear_extrude(1) shell_round_square([3,2]);
translate([18,6,3]) linear_extrude(1) shell_round_square([3,2],1,[0.5,0.25],[0.25,0.5]);
translate([18,6,6]) linear_extrude(1) shell_round_square([3,2],[1.5,1],[0.5,0.25],,[0.25,0.5]);

translate([22,0,0]) linear_extrude(1) shell_circle();
translate([22,0,3]) linear_extrude(1) shell_circle(2);
translate([22,0,6]) linear_extrude(1) shell_circle(2,1.5);
