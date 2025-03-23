extends CharacterBody2D

const speed = 300

@onready var nav_agent := $NavigationAgent2D as NavigationAgent2D
@onready var parent = get_parent()

func _physics_process(delta: float) -> void:
	var dir = to_local(nav_agent.get_next_path_position()).normalized()
	parent.velocity = dir * speed
	parent.move_and_slide()
	
	if Input.is_action_just_pressed('right_mouse'):
		nav_agent.target_position = get_global_mouse_position()
		print(nav_agent.target_position)
		
