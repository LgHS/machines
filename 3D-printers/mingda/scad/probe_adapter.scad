thickness = 3.5;
mountHeight = 20;
mountLargeHole = 11;
mountSmallHole = 5;
mountDistanceBtwHoles = 9;
probeDiameter = 20;
mountLength = 49.5;

module holes() {
    distance1 = 3 + mountSmallHole / 2;
    translate([distance1, 0, 0])
    cylinder(100, mountSmallHole / 2, mountSmallHole / 2);
    
    distance2 = distance1 + mountSmallHole / 2 + mountDistanceBtwHoles + mountLargeHole / 2;
    
    translate([distance2, 0, 0])
    cylinder(100, mountLargeHole / 2, mountLargeHole / 2);
    
    distance3 = distance2 + mountLargeHole / 2 + mountDistanceBtwHoles + mountSmallHole / 2;
    
    translate([distance3, 0, 0])
    cylinder(100, mountSmallHole / 2, mountSmallHole / 2);
}

/**
* mount
**/
difference() {
    difference() {
        cube([mountLength, 3 + mountLargeHole + 2, (thickness * 2) + mountHeight]);
        translate([thickness, 3 + mountLargeHole / 2, 0])
        holes();
    }
    cube([mountLength, 50, mountHeight + thickness]);
}

/**
* Radius
**/
difference() {
    translate([mountLength - 19, 16, mountHeight + thickness])
#    cube([19, 19, thickness]);
    translate([mountLength - 19, 35, mountHeight + thickness])
    cylinder(100, 19, 19);
}
    
/**
* Wall
*/
translate([mountLength, 0, 0])
cube([thickness, 35, mountHeight + thickness * 2]);

/**
* probe
**/
translate([mountLength + thickness, 0, 0])
group() {
    difference() {
        cube([40, 35, thickness]);
        translate([21, 17.5, 0])
        cylinder(100, probeDiameter / 2, probeDiameter / 2, 0, 0);
    }

    /**
    * radius
    **/
    difference() {
        translate([0, 0, thickness])
        cube([5, 35, 5]);
        translate([5, 0, thickness + 5]) 
        rotate([-90, 0, 0])
        cylinder(35, 5, 5);
    }
}
