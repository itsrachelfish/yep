// This module makes a donger
// The diameter applies to the thickest point, with a taper at the end

module donger(diameter, length)
{
    hull()
    {
        sphere(d = diameter / 4);
        translate([0, 0, length / 4]) sphere(d = diameter / 1.5);
        translate([0, 0, length]) sphere(d = diameter);
    }
}

donger(17, 50);
$fn = 44;