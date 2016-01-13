// What happens when you combine a donger and a mold?
// DONGER MOLD.

use <donger.scad>;
use <mold.scad>;

rotate([0, -90, 0])
{
    difference()
    {
        moldA(30, 30, 134);
        translate([15, 15, 8]) donger(15, 125);
    }

    translate([30, 40, 0]) mirror()
    {
        difference()
        {
            moldB(30, 30, 134);
            translate([15, 15, 8]) donger(15, 125);
        }
    }
}