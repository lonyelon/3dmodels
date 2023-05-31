include <config.scad>

difference () {
  translate([0, 0, -BORDER_SIZE/2])
    cube([container_width, container_depth, container_height], center = true);
  for (i = [0:COLUMNS-1]) {
    cell_x = container_width/2 - (CELL_WIDTH + BORDER_SIZE)*i - CELL_WIDTH/2 - BORDER_SIZE;
    for (j = [0:ROWS-1]) {
      cell_y = container_depth/2 - (CELL_DEPTH + BORDER_SIZE)*j - CELL_DEPTH/2 - BORDER_SIZE;
      translate([cell_x, cell_y, 0])
        cube([CELL_WIDTH, CELL_DEPTH, CELL_HEIGHT], center = true);
    }
  }
}

