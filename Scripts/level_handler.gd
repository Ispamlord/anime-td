extends Node2D

@onready var base: Sprite2D = $"../Base"
@onready var timer: Timer = $Timer
const CUMMER = preload("res://Scenes/cummer.tscn")
@onready var spawn_enemy: Node2D = $SpawnEnemy
const wall_scene = preload("res://Scenes/test_wall.tscn")
@onready var build_wall_butt = $"../UI/BuildWall"
var enemy_ammount = 5
@onready var tile_map: TileMapLayer = $"../TileMapLayer"


func _ready() -> void:
	timer.start(5.0)

func _process(delta: float) -> void:
	button_thing()

func _on_base_tree_exited() -> void:
	for i in 1000000000:
		print('UMER!UMER!UMER!')


#func _on_timer_timeout() -> void:
	#if enemy_ammount > 0:
		#var cummer = CUMMER.instantiate()
		#cummer.global_position = spawn_enemy.global_position
		#var pathfinder = cummer.get_child(2) 
		#pathfinder.destination = base.global_position
		#$"..".add_child(cummer)
		#enemy_ammount -= 1


func _on_build_wall_toggled(toggled_on: bool) -> void:
	pass


func button_thing():
	if build_wall_butt.button_pressed == true:
		if Input.is_action_pressed("right_mouse"):
			var wall = wall_scene.instantiate()
			var mouse_pos = tile_map.local_to_map(get_global_mouse_position()) #позиция тайла под курсором мыши
			wall.global_position = (tile_map.map_to_local(mouse_pos))
			#0,1 - source_id, alternative_id
			tile_map.set_cell(mouse_pos,0,Vector2i(1, 0),2)
			
			$".".add_child(wall)
			build_wall_butt.button_pressed = false
			
		
func _on_child_exiting_tree(node: Node) -> void: # Если стенка умерла, меняем тайл под ней на тот, который позволяет проходить (врубает навигацию)
	if node.scene_file_path == "res://Scenes/test_wall.tscn":
		var tile = tile_map.local_to_map(node.global_position) #узнаём позицию тайла из позиции стенки
		tile_map.set_cell(tile,0,Vector2i(1,0),1)
