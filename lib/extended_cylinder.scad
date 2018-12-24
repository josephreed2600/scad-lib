b = 14; // bottom radius
t = 11; // top radius
h = 10; // height

// if no workey because a radius becomes negative, reduce the shift value
module extended_cylinder(h=0,r1=1,r2=1,shift=2,center=false) {
    slope = h / (r2-r1);
    // p for prime
    hp = (r1>0 && r2>0) ? h + shift : h + shift/2;
    bp = (r1>0)?r1-(1/slope)*(shift/2):0;
    tp = (r2>0)?r2+(1/slope)*(shift/2):0;
    translate([0,0,center?0:((r1>0)?-shift/2:0)])
    cylinder(hp,r1=bp,r2=tp,center=center);
}

difference(){
    cylinder(h,r=b+t,center=true);
    cylinder(h,r1=b,r2=t,center=true);
    translate([(b+t)/2,-(b+t)/2,0]) cube([b+t,b+t,h+1],center=true);
}

translate([2*(b+t)+10,0,0])
difference(){
    cylinder(h,r=b+t,center=true);
    extended_cylinder(h,b,t,0.1,true);
    translate([(b+t)/2,-(b+t)/2,0]) cube([b+t,b+t,h+1],center=true);
}