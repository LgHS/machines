/**
* Variables
**/
outerLength=143.6;
outerWidth = 95;
innerLength = 105;
innerWidth = 86;
lengthPadding = 4;
widthPadding = 6;
height = 3;
holeRadius = 2;

/**
* Modules
**/
module hole() {
    cylinder(height * 2, holeRadius, holeRadius);
}

module quarter() {
    difference() {
        union() {
            translate([-outerLength / 2 - lengthPadding, 0, 0])
            cube([outerLength / 2 + lengthPadding, outerWidth / 2 + widthPadding, height]);
        }
        translate([-outerLength / 2, outerWidth / 2, 0]) hole();
        translate([-innerLength / 2, innerWidth / 2, 0]) hole();
        
        translate([-outerLength / 2 - lengthPadding, 0, 0])
        cube([outerLength / 2 + lengthPadding, innerWidth / 2 - widthPadding, height + 2]);
    }
}


/**
* Shape
**/
quarter();

mirror([1, 0, 0]) quarter();