include <config.scad>

for (i = [0:COLUMNS - 1]) {
  pos_x = container_width/2 - i*(CELL_WIDTH + BORDER_SIZE*2);
  translate([pos_x, 0, 0]) {
    cover(extra = (i == 0 || i == COLUMNS - 1));
  }
}

// extra: controls whether some extra size has to be include in the lateral
//        portion of the cover to fit on the sides.
module cover(extra = false) {
  cover_width = CELL_WIDTH + BORDER_SIZE;
  cube([cover_width, container_depth, BORDER_SIZE], center = true);
  for (i = [0:ROWS-1]) {
    cover_slot_y = container_depth/2 - (CELL_DEPTH + BORDER_SIZE)*i - CELL_DEPTH/2 - BORDER_SIZE;
    translate([0, cover_slot_y, BORDER_SIZE])
      cube([CELL_WIDTH - ERROR_MARGIN*2, CELL_DEPTH - ERROR_MARGIN*2, BORDER_SIZE], center = true);
  }
  cover_extra_x = (cover_width + BORDER_SIZE/2)/2;
  translate([extra ? cover_extra_x : 0, 0, 0])
    cube([BORDER_SIZE/2, container_depth, BORDER_SIZE], center = true);
}
