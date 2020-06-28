/// @func layer_tilemap_to_grid
/// @desc {void} takes a given tile layer and populates a given ds_grid with a given value
/// @arg {string} layerName
/// @arg {grid} grid
/// @arg {any} value

var _layerName = argument[0];
var _grid = argument[1];
var _value = argument[2];

var _layer = layer_get_id(_layerName);
var _tileMap = layer_tilemap_get_id(_layer);

var _width = ds_grid_width(_grid)
var _height = ds_grid_height(_grid)

var _tile = -1;

for (var _y = 0; _y < _height ; _y++){
	for (var _x = 0; _x < _width; _x++){
		_tile = tilemap_get(_tileMap, _x, _y);
		if (_tile == 1){
			_grid[# _x, _y] = _value;
		}
	}
}
