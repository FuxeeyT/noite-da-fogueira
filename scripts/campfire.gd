extends Node2D

@onready var sprite = $Sprite2D
@onready var interaction_area = $Area2D

var player_in_range = false
var animation_frame = 0
var animation_speed = 0.1
var animation_timer = 0.0

func _ready():
	interaction_area.body_entered.connect(_on_body_entered)
	interaction_area.body_exited.connect(_on_body_exited)

func _process(delta):
	# Anima a fogueira mudando o frame
	animation_timer += delta
	if animation_timer >= animation_speed:
		animation_frame = (animation_frame + 1) % 4
		sprite.frame = animation_frame
		animation_timer = 0.0

func _on_body_entered(body):
	if body.is_in_group("player"):
		player_in_range = true

func _on_body_exited(body):
	if body.is_in_group("player"):
		player_in_range = false

func get_player_in_range():
	return player_in_range
