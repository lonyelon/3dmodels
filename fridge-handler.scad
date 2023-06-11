/*
 * FRIDGE HANDLER
 *
 * A piece I made when the handler of my fridge broke and I had to make it again.
 *
 * Made by SERGIO MIGUÉNS IGLESIAS <sergio@lony.xyz> for personal use, 2023.
 */

$fn = 50;  // Resolution for circles.

M = 4.5;   // Size of the screws (diameter, add 0.5mm just in case).
S = 133;   // Separation between the screws (add 1mm just in case).

W = 35;    // Width of the piece.
H = S+M*8; // Total height of the piece. Leave it like this.
D = 7;     // Depth of the piece.

R = 20;    // Radius for the union piece.
T = 2.5;   // Multiplier for the union piece to make it an oval.

HW = 40;   // Width of the handle.

// Square piece that first into the fridge with the two screws.
difference() {
  cube([W, D, H], center = true);
  for (i = [-1, 1])
    translate([0, 0, i*S/2])
      rotate([0, 90, 90])
        cylinder(D, M/2, M/2, center = true);
}

// Bridge between pieces with a hole so that you can grab it.
translate([W/2, R - D/2]) {
  scale([T, 1]) {
    difference() {
      cylinder(H, R, R, center = true);
      scale([(T*R - D)/(R - D)/T, 1])
        cylinder(H, R - D, R - D, center = true);
      translate([-R/2, 0])
        cube([R, R*2, H], center = true);
      translate([0, R/2])
        cube([R*2, R, H], center = true);
      // TODO That 8*M is there because it makes the center hole have two
      //      thicker bridges on top and bottom. Read below because this is in
      //      the same situation.
      scale([1, 1, (H - 8*M)/(R + D)])
        rotate([90, 0, 45])
          // TODO See that 0.4? It adjusts the size of the whole so it fits the
          //      piece better. I don't know how to parametrize this so like
	  //      this it stays.
          cylinder(H, R/2 + 0.4*D, R/2 + 0.4*D, center = true);
    }
  }
}

// Handler with rounded edge to be comfortable.
translate([W/2 + T*R - D/2, HW/2 + R - D/2]) {
  cube([D, HW, H], center = true);
  r = 0.75*HW;
  desp = sqrt(r*r - HW*HW/4);
  intersection() {
    translate([desp - D/2, 0])
      cylinder(H, r, r, center = true);
    translate([-HW/2 - D/2, 0])
      cube([HW, HW, H], center = true);
  }
}
