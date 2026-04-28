extends Area2D

@export var item_type = "stick" # "stick", "log", "marshmallow"

func _ready():
	# Define o frame baseado no tipo de item
	match item_type:
		"stick":
			$Sprite2D.frame = 0
		"log":
			$Sprite2D.frame = 1
		"marshmallow":
			$Sprite2D.frame = 0  # Usar o mesmo sprite para marshmallow

func _on_body_entered(body):
	if body.is_in_group("player"):
		body.collect_item(item_type)
		queue_free()
