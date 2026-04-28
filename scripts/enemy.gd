extends CharacterBody2D

@export var speed = 100.0
@export var damage = 1
@export var enemy_type = "raccoon" # "raccoon" ou "bear"

var player = null

func _ready():
	player = get_tree().get_first_node_in_group("player")

func _physics_process(_delta):
	if player:
		var direction = (player.global_position - global_position).normalized()
		velocity = direction * speed
		move_and_slide()
		
		for i in get_slide_collision_count():
			var collision = get_slide_collision(i)
			if collision.get_collider().is_in_group("player"):
				attack_player()

func attack_player():
	GameManager.take_damage(damage)
	# Feedback visual ou sonoro aqui
	queue_free() # Inimigo some após atacar (simplificado)
