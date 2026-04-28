extends Control

@onready var fire_bar = $FireBar
@onready var time_label = $TimeLabel
@onready var health_label = $HealthLabel
@onready var score_label = $ScoreLabel
@onready var wood_inventory_label = $WoodInventoryLabel
@onready var inventory_panel = $InventoryPanel
@onready var player = get_tree().get_first_node_in_group("player")

func _process(_delta):
	if fire_bar:
		fire_bar.value = GameManager.fire_level
	
	if score_label:
		score_label.text = "Score: " + str(GameManager.score)
	
	if health_label:
		health_label.text = "Vidas: " + str(GameManager.player_health)
	
	if time_label:
		var total_seconds = int(GameManager.game_time)
		var hours = int(total_seconds / 50) 
		var minutes = int(total_seconds) % 60
		time_label.text = "Relógio: %02d:%02d AM" % [hours, minutes]
	
	if wood_inventory_label and player:
		wood_inventory_label.text = "Lenha: %d/%d" % [player.wood_inventory, player.max_wood]
	
	# Atualiza o painel de inventário
	if inventory_panel and player:
		update_inventory_display()

func update_inventory_display():
	# Limpa os ícones antigos
	for child in inventory_panel.get_children():
		child.queue_free()
	
	# Cria ícones para cada madeira no inventário
	for i in range(player.wood_inventory):
		var icon = TextureRect.new()
		icon.texture = load("res://assets/images/items_collectible.png")
		icon.custom_minimum_size = Vector2(32, 32)
		icon.expand_mode = TextureRect.EXPAND_IGNORE_SIZE
		icon.size_flags_horizontal = Control.SIZE_SHRINK_CENTER
		icon.size_flags_vertical = Control.SIZE_SHRINK_CENTER
		
		# Define o frame do sprite (0 para stick, 1 para log)
		if i < player.wood_inventory:
			icon.modulate = Color.WHITE
		
		inventory_panel.add_child(icon)
