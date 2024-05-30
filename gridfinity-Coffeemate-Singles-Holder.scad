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

sugar_can_diameter = 80.50;

length = 3;
height_modifier = 17;

cube_size = length * 50;
cut_depth = 25;

coffee_mate_single_diameter = 30.00;
coffee_mate_single_cut_depth = 25.00;

// translate([42, 0, 0]) gridfinityBase(1, length, 42, 0, 0, 1);
// translate([42, 0, 0]) gridfinityInit(1, length, height(6), 0, 42);

gridfinityBase(1, length, 42, 0, 0, 1);

difference() {

  difference() {
    gridfinityInit(1, length, height(height_modifier), 0, 42, 2);
    hull() {
      translate([cut_depth, -cube_size / 2, 30])
      rotate([0, -15, 0])
      cube([50, cube_size, cube_size]);
    }
  }

  rotate([0, 90 - 15, 0])
  translate([-97.5, 0, 25])
  cylinder(coffee_mate_single_cut_depth, coffee_mate_single_diameter/2, coffee_mate_single_diameter/2, true);

  rotate([0, 90 - 15, 0])
  translate([-97.5, -42, 25])
  cylinder(coffee_mate_single_cut_depth, coffee_mate_single_diameter/2, coffee_mate_single_diameter/2, true);

  rotate([0, 90 - 15, 0])
  translate([-97.5, 42, 25])
  cylinder(coffee_mate_single_cut_depth, coffee_mate_single_diameter/2, coffee_mate_single_diameter/2, true);

  rotate([0, 90 - 15, 0])
  translate([-97.5 + 42, 0, 25])
  cylinder(coffee_mate_single_cut_depth, coffee_mate_single_diameter/2, coffee_mate_single_diameter/2, true);

  rotate([0, 90 - 15, 0])
  translate([-97.5 + 42, -42, 25])
  cylinder(coffee_mate_single_cut_depth, coffee_mate_single_diameter/2, coffee_mate_single_diameter/2, true);

  rotate([0, 90 - 15, 0])
  translate([-97.5 + 42, 42, 25])
  cylinder(coffee_mate_single_cut_depth, coffee_mate_single_diameter/2, coffee_mate_single_diameter/2, true);
}