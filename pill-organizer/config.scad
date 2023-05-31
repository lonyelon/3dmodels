// Config for the model

COLUMNS = 7;
ROWS = 3;
CELL_WIDTH = 20;
CELL_HEIGHT = 20;
CELL_DEPTH = 25;
BORDER_SIZE = 1.5;  // This also controls ceilings and floors.
ERROR_MARGIN = 0.4; // Printer error margin.

// Do not touch anything after this.

container_width = (CELL_WIDTH+BORDER_SIZE)*COLUMNS + BORDER_SIZE;
container_depth = (CELL_DEPTH+BORDER_SIZE)*ROWS + BORDER_SIZE;
container_height = CELL_HEIGHT + BORDER_SIZE;
