extends Node

@onready var base: Sprite2D = $"../Base"
@onready var timer: Timer = $Timer
const CUMMER = preload("res://Scenes/cummer.tscn")

var enemy_ammount = 5

func _ready() -> void:
	timer.start(5.0) 


func _on_base_tree_exited() -> void:
	for i in 1000000000:
		print('UMER!UMER!UMER!')


func _on_timer_timeout() -> void:
	var cummer = CUMMER.instantiate()
	$"..".add_child(cummer)
