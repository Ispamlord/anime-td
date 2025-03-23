extends Node2D
class_name HealthComponent

@export var MAX_HEALTH := 100
var health : int


func _ready():
	health = MAX_HEALTH

func damage(attack: Attack):
	health -= attack.damage
	print('left hp: ' + str(health))
	
	if health <= 0 :
		print('a warrior has fallen')
		get_parent().queue_free()
