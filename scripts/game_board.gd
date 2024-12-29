extends Node2D

@onready var s_0: AnimatedSprite2D = $Board/b0/s0
@onready var s_1: AnimatedSprite2D = $Board/b1/s1
@onready var s_2: AnimatedSprite2D = $Board/b2/s2
@onready var s_3: AnimatedSprite2D = $Board/b3/s3
@onready var s_4: AnimatedSprite2D = $Board/b4/s4
@onready var s_5: AnimatedSprite2D = $Board/b5/s5
@onready var s_6: AnimatedSprite2D = $Board/b6/s6
@onready var s_7: AnimatedSprite2D = $Board/b7/s7
@onready var s_8: AnimatedSprite2D = $Board/b8/s8


var forCircle = true
# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	pass

func add_circle_or_cross(box) -> void:
	if box.visible == false:
		if forCircle:
			box.play("circle")
			forCircle = false
		else:
			box.play("cross")
			forCircle = true
		box.visible = true


func _on_b_0_button_down() -> void:
	add_circle_or_cross(s_0)


func _on_b_1_button_down() -> void:
	add_circle_or_cross(s_1)


func _on_b_2_button_down() -> void:
	add_circle_or_cross(s_2)


func _on_b_3_button_down() -> void:
	add_circle_or_cross(s_3)


func _on_b_4_button_down() -> void:
	add_circle_or_cross(s_4)


func _on_b_5_button_down() -> void:
	add_circle_or_cross(s_5)


func _on_b_6_button_down() -> void:
	add_circle_or_cross(s_6)


func _on_b_7_button_down() -> void:
	add_circle_or_cross(s_7)


func _on_b_8_button_down() -> void:
	add_circle_or_cross(s_8)
