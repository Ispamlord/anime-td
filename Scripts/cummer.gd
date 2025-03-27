extends CharacterBody2D

var damage := 90

func _on_hitbox_component_area_entered(area: Area2D) -> void:
	if area is HitboxComponent: # если зона - класс "хитбокс", то узнаем родителя хитбокса.
		var hitbox: HitboxComponent = area
		var check = hitbox.get_parent()
		if check.name == "Base": # если родитель база то челик умирает атакуя её
			var attack = Attack.new()
			attack.damage = damage
			hitbox.damage(attack)
			print("collide with" + str(attack.damage) + "attack")
			queue_free()
			
		if check.scene_file_path == "res://Scenes/test_wall.tscn": # если родитель стенка то челик аттакует и отпрыгывает
			var attack = Attack.new()
			attack.damage = damage
			hitbox.damage(attack)
			print("collide with" + str(attack.damage) + "attack")
			self.global_position -= velocity
			
# КАК ПОЧИНИТЬ СТЕНЫ?
# КАК ПОЧИНИТЬ СТЕНЫ?
# КОРОЧЕ БЕРЕШЬ ЦИКЛ ДЕЛАЕШЬ АНТИЛ
# АНТИЛ ПРОВЕРЯЕТ ЕСТЬ ЛИ КОЛЛИЗИЯ СО СТЕНОЙ ПОТОМ ЕСЛИ ЕСТЬ ТО ХУЯРИТ СТЕНКУ И СТАВИТ КД НА СЛЕДУЮЩИЙ ЦИКЛ
# ЕСЛИ НЕТУ КОЛЛИЗИИ ТО ЦИКЛ УМИРАЕТ НАХУЙ
			
#func damaging_wall():
	#var collision_info = move_and_collide(velocity)
	#if collision_info:
		#while collision_info:
			#await get_tree().create_timer(1.0).timeout
			#print('FUCK YOU')
			#print(collision_info)
		
