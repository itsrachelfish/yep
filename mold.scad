// This file contains two modules
// Each module creates one half of a general purpose mold
// Use difference() to create a mold for custom shapes

// Mold A has pegs which snap into Mold B
// The pegs occur every 5 mm, in a grid starting 5mm from the sides; each peg is 3mm long
// If your mold is smaller than this, no pegs will be generated

// The length, width, and height refer to the total size of both halves

module moldA(length, width, height)
{
    cube([length / 2, width, height]);

    for(y = [5 : 5 : width - 5])
    {
        for(z = [5 : 5 : height - 5])
        {
            translate([length / 2, y, z])
            rotate([0, 90, 0])
            cylinder(d = 1.8, h = 3);
        }
    }
}

module moldB(length, width, height)
{
    difference()
    {
        translate([length / 2, 0, 0])
        cube([length / 2, width, height]);
        
        for(y = [5 : 5 : width - 5])
        {
            for(z = [5 : 5 : height - 5])
            {
                translate([length / 2, y, z])
                rotate([0, 90, 0])
                cylinder(d = 2, h = 3.5);
            }
        }        
    }
}

translate([-5, 0, 0]) moldA(25, 25, 50);
translate([5, 0, 0]) moldB(25, 25, 50);

$fn = 44;