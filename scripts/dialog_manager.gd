extends CanvasLayer

var dialog_lines = [
	"Zelador Fantasma: Aqui, Leo! Pegue esta lanterna.",
	"Zelador Fantasma: Você vai precisar dela para explorar a floresta escura.",
	"Zelador Fantasma: Coleta madeira para manter a fogueira acesa!"
]

var current_line = 0
var dialog_box = null
var text_label = null
var is_showing = false

func _ready():
	show_dialog()

func _input(event):
	if is_showing and event.is_action_pressed("next_dialog"):
		get_tree().get_root().set_input_as_handled()
		next_line()

func show_dialog():
	if current_line >= dialog_lines.size():
		close_dialog()
		return
	
	is_showing = true
	
	if dialog_box == null:
		dialog_box = Control.new()
		dialog_box.name = "DialogBox"
		dialog_box.mouse_filter = Control.MOUSE_FILTER_IGNORE
		
		var bg = ColorRect.new()
		bg.color = Color(0, 0, 0, 0.85)
		bg.anchor_left = 0.1
		bg.anchor_top = 0.7
		bg.anchor_right = 0.9
		bg.anchor_bottom = 0.95
		bg.mouse_filter = Control.MOUSE_FILTER_IGNORE
		dialog_box.add_child(bg)
		
		text_label = Label.new()
		text_label.anchor_left = 0.12
		text_label.anchor_top = 0.72
		text_label.anchor_right = 0.88
		text_label.anchor_bottom = 0.93
		text_label.custom_minimum_size = Vector2(1000, 100)
		text_label.text_overrun_behavior = TextServer.OVERRUN_TRIM_ELLIPSIS
		text_label.autowrap_mode = TextServer.AUTOWRAP_WORD
		text_label.add_theme_font_size_override("font_size", 18)
		text_label.mouse_filter = Control.MOUSE_FILTER_IGNORE
		dialog_box.add_child(text_label)
		
		add_child(dialog_box)
	
	text_label.text = dialog_lines[current_line]

func next_line():
	current_line += 1
	if current_line >= dialog_lines.size():
		close_dialog()
	else:
		show_dialog()

func close_dialog():
	is_showing = false
	if dialog_box:
		dialog_box.queue_free()
		dialog_box = null
