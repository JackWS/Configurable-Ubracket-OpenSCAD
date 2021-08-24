/* This drawing is for completely parameterized strap-type of bracket. Originally it was designed for the Curt powered tailight converter - since they do not produce them. 
*/

//Dimensions of box
bheightz = 19.5; //height of box **** Z-Axis  - Size of space under bracket
//bwidthx = 56.25;  //width of box
bwidthx = 75;  //width of box *** X-Axis
bracketwidthy = 25; // width of bracket **** Y-Axis
wingdepthx = 25; //originally 25 *** X-Axis
material_thicknessz = 5.5;  // X-Axis

//Lower Piece variables
b_lower = [wingdepthx,bracketwidthy, material_thicknessz]; // lower extension
plate= [bwidthx, bracketwidthy, material_thicknessz]; //top covering

b_vertical= [material_thicknessz,bracketwidthy,   bheightz + material_thicknessz];//vertical part (2 of them), length is bheightz _+ material thickness
b_vertical2= [material_thicknessz,bracketwidthy,  bheightz + material_thicknessz];//vertical part (2 of them), length is bheightz _+ material thickness
b_lower2 = [wingdepthx,bracketwidthy,material_thicknessz];
center_hole_x = bracketwidthy / 2;
center_hold_y = wingdepthx / 2;
hole_diameter = 2;

//Holes
hole_dm = 3;
hole_margin = 4;
adjustment_for_seeing_hole = 1.05; //To adjust the Z or height of the hole so it can be seen

//Build the bracket
//First Wing and Hole
difference(){
cube(b_lower);
translate([wingdepthx/2,bracketwidthy/2, -.025]) color("red") cylinder(material_thicknessz  * adjustment_for_seeing_hole);
}


translate([wingdepthx, 0, 0]) cube(b_vertical);
translate([wingdepthx + material_thicknessz, 0, bheightz]) cube(plate);
translate([wingdepthx + material_thicknessz+bwidthx, 0, 0]) cube(b_vertical2);

//Add Hole to second wing
difference(){
translate([wingdepthx + (2*material_thicknessz)+bwidthx, 0, 0]) cube(b_lower2);
    //take total length and back off 1/2 of wing depth
translate([((wingdepthx * 2) + (2*material_thicknessz)+bwidthx) - (wingdepthx / 2)
   ,bracketwidthy/2, -.025]) color("red") cylinder(material_thicknessz  * adjustment_for_seeing_hole);
}







