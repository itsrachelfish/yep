// A small test mold to check if the pins fit together nicely

use <mold.scad>;

rotate([0, -90, 0])
{
    moldA(7, 20, 20);
    
    translate([7, 25, 0]) mirror()
    {
        moldB(7, 20, 20);
    }
}