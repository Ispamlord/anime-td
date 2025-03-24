extends Button

# В дальнейшем все взаимодействия с кнопками в меню можно перенести в ноду Menu для удобства.

func _on_pressed() -> void:
	$"../Control".visible = true;
	$".".visible = false;


func _on_button_pressed() -> void:
		get_tree().change_scene_to_file("res://Scenes/1_st_level.tscn")
