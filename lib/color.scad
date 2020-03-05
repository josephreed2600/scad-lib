function is_undef(a) = (undef == a);

// Color normalize, i.e., divide by 255.
function c_normalize(cs) = [
	cs[0]/255,
	cs[1]/255,
	cs[2]/255,
	is_undef(cs[3])?1:cs[3]/255
];

function c_invert(cs) = [
	1-cs[0],
	1-cs[1],
	1-cs[2],
	is_undef(cs[3])?1:cs[3]/255
];

// Material and common colors
function c_metal() = c_normalize([210, 210, 210]);
function c_glass() = c_normalize([240, 240, 240, 40]);
function c_glass_green() = c_normalize([210, 255, 210, 40]);
function c_glass_stained_red() = c_normalize([255,40,40,100]);
function c_glass_stained_orange() = c_normalize([255,127,40,100]);
function c_glass_stained_yellow() = c_normalize([255,255,40,100]);
function c_glass_stained_green() = c_normalize([40,255,40,100]);
function c_glass_stained_cyan() = c_normalize([0,230,255,100]);
function c_glass_stained_blue() = c_normalize([40,40,255,100]);
function c_glass_stained_violet() = c_normalize([255,40,255,100]);
