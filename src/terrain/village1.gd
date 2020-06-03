extends YSort


# Declare member variables here. Examples:
# var a = 2
# var b = "text"


# Called when the node enters the scene tree for the first time.
var collision_pos = []
	
func _process(delta):
	var cpos = $TileMap3.world_to_map($player.position)
	print(cpos)


# Called every frame. 'delta' is the elapsed time since the previous frame.
#func _process(delta):
#	pass


func _on_player_lewatmamang(collision):
	if collision.slider is TileMap:
		var tile_pos = collision.slider.world_to_map($Character.position)
		tile_pos -= collision.normal  # Colliding tile
		var tile = collision.slider.get_cellv(tile_pos)
		if tile > 0:
			$TileMap3.set_cellv(tile_pos, tile-1)
