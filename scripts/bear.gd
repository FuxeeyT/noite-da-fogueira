extends CharacterBody2D

@export var speed = 80.0
@export var damage = 1
@export var patrol_radius = 150.0

var player = null
var patrol_center = Vector2.ZERO
var patrol_angle = 0.0
var patrol_speed = 2.0  # radianos por segundo
var animation_frame = 0
var animation_speed = 0.2
var animation_timer = 0.0

func _ready():
	player = get_tree().get_first_node_in_group("player")
	patrol_center = global_position
	patrol_angle = randf() * TAU

func _physics_process(delta):
	# Patrulha em círculo
	patrol_angle += patrol_speed * delta
	var patrol_pos = patrol_center + Vector2(cos(patrol_angle), sin(patrol_angle)) * patrol_radius
	
	var direction = (patrol_pos - global_position).normalized()
	velocity = direction * speed
	move_and_slide()
	
	# Anima o sprite mudando o frame
	animation_timer += delta
	if animation_timer >= animation_speed:
		animation_frame = (animation_frame + 1) % 4
		$Sprite2D.frame = animation_frame
		animation_timer = 0.0
	
	# Verifica colisão com o jogador
	for i in get_slide_collision_count():
		var collision = get_slide_collision(i)
		if collision.get_collider().is_in_group("player"):
			attack_player()

func attack_player():
	GameManager.take_damage(damage)
	# Pequeno knockback no urso
	global_position = global_position - velocity.normalized() * 20
