extends CharacterBody2D

var bullet_scene = preload("res://Scenes/bullet.tscn")
const speed = 300

func _physics_process(delta: float) -> void:
	look_at(get_global_mouse_position())
	
	if Input.is_action_just_pressed('left_mouse'):
		var bullet = bullet_scene.instantiate()
		bullet.global_position = $".".global_position
		bullet.direction = (get_global_mouse_position() - global_position).normalized()
		
		$"..".add_child(bullet)
		
	move_and_slide()
