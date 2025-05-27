extends CharacterBody2D

const speed = 100

@onready var nav_agent := $NavigationAgent2D as NavigationAgent2D
@onready var parent = get_parent()
@onready var destination


func _physics_process(delta: float) -> void:
	var dir = to_local(nav_agent.get_next_path_position()).normalized()
	parent.velocity = dir * speed
	parent.move_and_slide()
	if nav_agent.target_position == null:
		if destination:
			nav_agent.target_position = destination
			print(nav_agent.target_position)

		
	if Input.is_action_pressed("right_mouse"):
		nav_agent.target_position = get_global_mouse_position()
		await get_tree().create_timer(0.5).timeout



func _on_cummer_tree_entered() -> void:
	pass
