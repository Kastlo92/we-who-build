
# Scripts Guide

## Grid Manager

> *Allow the placement of tiles and what happens in the game world*

### Methods
<b>_ready() </b> -> initialize world with fill_with_grass()\
<b> fill_with_grass() </b> -> cycle from the variable -COLUMNS to COLUMNS and -ROWS to ROWS and calls TileMapLayer.set_cell() to place tiles