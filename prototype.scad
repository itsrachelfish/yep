// This module makes a donger
// All measurements in millimeters
////////////////////////////////////

// The diameter specifies the thickest point along the shaft,
// with a taper at the end and a slightly larger ball at the end

module donger(diameter, length)
{
    // Place the stretched sphere on 0, 0, 0
    translate([0, 0, length / 2])

    // Resize the sphere into an oval shape
    resize([0, 0, length]) sphere(d = diameter);    

    // Create another sphere at the end of the donger
    translate([0, 0, length - diameter / 2]) sphere(d = diameter * 1.25);
}

// Regular donger
translate([20, 0, 0]) donger(15, 125);

// Hulled version
translate([50, 0, 0]) hull() donger(15, 125);

$fn = 44;