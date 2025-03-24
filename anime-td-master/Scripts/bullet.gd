extends Area2D

var direction: Vector2
const speed = 45

var damage := 20

func _physics_process(delta: float) -> void:
	global_position += direction * speed
	
func _on_area_entered(area: Area2D) -> void:
	if area is HitboxComponent:
		var hitbox: HitboxComponent = area
		var attack = Attack.new()
		attack.damage = damage
		
		hitbox.damage(attack)
		print("collide with" + str(attack.damage) + "attack")


func _on_timer_timeout() -> void:
	queue_free()
