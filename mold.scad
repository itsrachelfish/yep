// This file contains two modules
// Each module creates one half of a general purpose mold
// Use difference() to create a mold for custom shapes

// Mold A has pegs which snap into Mold B
// Pegs occur in a 10 mm grid, centered within the mold; each peg is 3mm long
// If your mold is smaller than this, no pegs will be generated

// The length, width, and height refer to the total size of both halves

module moldA(length, width, height)
{
    // Create a cube in the shape half of our mold
    cube([length / 2, width, height]);

    // Compute the maximum number of pegs in each axis
    yMax = ceil(width / 10);
    zMax = ceil(height / 10);

    // Translate the pegs to center them on the mold
    translate([0, -(width / yMax) / 2, -(height / zMax) / 2])
    {
        // Loop over the y and z coordinates
        for(y = [1 : yMax])
        {
            for(z = [1 : zMax])
            {
                // Create a peg based on the current loop coordinates
                translate([length / 2, y * (width / yMax), z * (height / zMax)])
                rotate([0, 90, 0])
                cylinder(d = 2.7, h = 3);
            }
        }
    }
}

module moldB(length, width, height)
{
    // Get the difference of the pegs in the mold
    difference()
    {
        translate([length / 2, 0, 0])
        cube([length / 2, width, height]);

        yMax = ceil(width / 10);
        zMax = ceil(height / 10);

        translate([0, -(width / yMax) / 2, -(height / zMax) / 2])
        {
            for(y = [1 : yMax])
            {
                for(z = [1 : zMax])
                {
                    translate([length / 2, y * (width / yMax), z * (height / zMax)])
                    rotate([0, 90, 0])
                    cylinder(d = 3, h = 3.5);
                }
            }
        }
    }
}

translate([-5, 0, 0]) moldA(25, 25, 50);
translate([5, 0, 0]) moldB(25, 25, 50);

$fn = 44;