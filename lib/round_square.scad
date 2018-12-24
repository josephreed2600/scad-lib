function is_undef ( a ) = (undef == a);
module round_square(size=1,radius=0) {
    x = is_undef(size[0])?size:size[0];
    y = is_undef(size[1])?(is_undef(size[0])?size:size[0]):size[1];
    r = radius;
    rx = min(x/2,is_undef(r[0])?r:r[0]);
    ry = min(y/2,is_undef(r[1])?(is_undef(r[0])?r:r[0]):r[1]);
    echo(r);
    echo(rx);
    echo(ry);
    translate([0,ry]) square([x,y-ry-ry]);
    translate([rx,0]) square([x-rx-rx,y]);
    if(rx>0 && ry>0) {
    translate([  rx,  ry]) resize([2*rx,2*ry]) circle();
    translate([x-rx,  ry]) resize([2*rx,2*ry]) circle();
    translate([x-rx,y-ry]) resize([2*rx,2*ry]) circle();
    translate([  rx,y-ry]) resize([2*rx,2*ry]) circle();
    }
}
$fn = 30;
//round_square([2,4],0);
round_square();
translate([0,0,1]) round_square(2);
translate([0,0,2]) round_square(2,0.5);
translate([0,0,3]) round_square([2],0.5);
translate([0,0,4]) round_square([2,3]);
translate([0,0,5]) round_square(2,[0.5]);
translate([0,0,6]) round_square([2,3],0.5);
translate([0,0,7]) round_square([2,3],[0.5,0.2]);
//translate([0.5,0.25]) resize([2*0.5,2*0.25]) circle();