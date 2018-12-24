bot_rad = 15;
top_rad = 5;
height = 15;
c2c_x = 30;
c2c_y = 40;

difference() {
union() {
cylinder(h=height, r1=bot_rad,  r2=top_rad);

translate([c2c_x,0,0])
cylinder(h=height, r1=bot_rad,  r2=top_rad);

rotate([0,-90,180])
linear_extrude(c2c_x)
polygon([
    [0,-bot_rad],
    [0,bot_rad],
    [height,top_rad],
    [height,-top_rad]
]);

translate([0,c2c_y,0])
cylinder(h=height, r1=bot_rad,  r2=top_rad);

rotate([0,-90,-90])
linear_extrude(c2c_y)
polygon([
    [0,-bot_rad],
    [0,bot_rad],
    [height,top_rad],
    [height,-top_rad]
]);

cube([
    bot_rad+top_rad,
    bot_rad+top_rad,
    height
]);
}
translate([
    (bot_rad+top_rad),
    (bot_rad+top_rad),
    0
])
cylinder(h=height, r1=top_rad, r2=bot_rad);
}