extends Node2D

@onready var start_button: Button = $"HFlowContainer/Start Button"
@onready var exit_button: Button = $"HFlowContainer/Exit Button"

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	pass


func _on_start_button_pressed() -> void:
	get_tree().change_scene_to_file("res://scenes/game_board.tscn")


func _on_exit_button_pressed() -> void:
	get_tree().quit()
