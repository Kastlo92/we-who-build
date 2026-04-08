
# Scripts Guide

## Grid Manager

> *Allow the placement of tiles and what happens in the game world*

### Methods
<b>_ready() </b> -> initialize world with fill_with_grass()\
<b>fill_with_grass() </b> -> cycle from the variable -COLUMNS to COLUMNS and -ROWS to ROWS and calls TileMapLayer.set_cell() to place tiles
<b>insertTile</b> -> place the tile in the position passed as parameter. COMPUTED_TILES_SOURCE_ID it's simply an ID that's already on the position passed as a parameter