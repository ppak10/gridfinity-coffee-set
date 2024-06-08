include <gridfinity-rebuilt-openscad/gridfinity-rebuilt-utility.scad>

// ===== PARAMETERS ===== //

/* [Setup Parameters] */
$fa = 1;
$fs = 0.25;

/* [General Settings] */
// number of bases along x-axis
gridx = 3;
// number of bases along y-axis
gridy = 2;
// bin height. See bin height information and "gridz_define" below.
gridz = 6;

/* [Linear Compartments] */
// number of X Divisions (set to zero to have solid bin)
divx = 0;
// number of Y Divisions (set to zero to have solid bin)
divy = 0;

/* [Cylindrical Compartments] */
// number of cylindrical X Divisions (mutually exclusive to Linear Compartments)
cdivx = 0;
// number of cylindrical Y Divisions (mutually exclusive to Linear Compartments)
cdivy = 0;
// orientation
c_orientation = 2; // [0: x direction, 1: y direction, 2: z direction]
// diameter of cylindrical cut outs
cd = 10;
// cylinder height
ch = 1;
// spacing to lid
c_depth = 1;
// chamfer around the top rim of the holes
c_chamfer = 0.5;

/* [Height] */
// determine what the variable "gridz" applies to based on your use case
gridz_define = 0; // [0:gridz is the height of bins in units of 7mm increments - Zack's method,1:gridz is the internal height in millimeters, 2:gridz is the overall external height of the bin in millimeters]
// overrides internal block height of bin (for solid containers). Leave zero for default height. Units: mm
height_internal = 0;
// snap gridz height to nearest 7mm increment
enable_zsnap = false;

/* [Features] */
// the type of tabs
style_tab = 1; //[0:Full,1:Auto,2:Left,3:Center,4:Right,5:None]
// how should the top lip act
style_lip = 0; //[0: Regular lip, 1:remove lip subtractively, 2: remove lip and retain height]
// scoop weight percentage. 0 disables scoop, 1 is regular scoop. Any real number will scale the scoop.
scoop = 1; //[0:0.1:1]
// only cut magnet/screw holes at the corners of the bin to save uneccesary print time
only_corners = false;

/* [Base] */
style_hole = 4; // [0:no holes, 1:magnet holes only, 2: magnet and screw holes - no printable slit, 3: magnet and screw holes - printable slit, 4: Gridfinity Refined hole - no glue needed]
// number of divisions per 1 unit of base along the X axis. (default 1, only use integers. 0 means automatically guess the right division)
div_base_x = 0;
// number of divisions per 1 unit of base along the Y axis. (default 1, only use integers. 0 means automatically guess the right division)
div_base_y = 0;

diameter = 82.50;

difference() {
    gridfinityInit(2, 2, height(6), 0, 42) {
        cutCylinders(1, cylinder_diameter=diameter, orientation=90, cylinder_height=0.5, chamfer=0.5);
    }
    hull(){
        translate([0, 0, 44]) cylinder(0.1, diameter/2, true);
        translate([0, 0, 6]) cylinder(0.1, diameter/2, true);
    }
    translate([25, -12.5, 0]) cube([25, 25, 50]);
    translate([-12.5, 25, 0]) cube([25, 25, 50]);
    translate([-50, -12.5, 0]) cube([25, 25, 50]);
    translate([-12.5, -50, 0]) cube([25, 25, 50]);
}

difference() {
    gridfinityBase(2, 2, 42, 0, 0, 1);
    hull(){
        translate([0, 0, 44]) cylinder(0.1, diameter/2, true);
        translate([0, 0, 6]) cylinder(0.1, diameter/2, true);
    }
    translate([25, -12.5, 6]) cube([25, 25, 50]);
    translate([-12.5, 25, 6]) cube([25, 25, 50]);
    translate([-50, -12.5, 6]) cube([25, 25, 50]);
    translate([-12.5, -50, 6]) cube([25, 25, 50]);
}