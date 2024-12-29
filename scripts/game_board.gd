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

var data : Array = [ [0,0,0],[0,0,0],[0,0,0] ]
var row_sum : int
var collum_sum :int
var crros1_sum : int
var crros2_sum: int

var forCircle = true
# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	pass
	
func game_over():
	for i in len(data):
		row_sum = data[i][0] + data[i][1] + data[i][2]
		collum_sum = data[0][i] + data[1][i] + data[2][i]
		crros1_sum = data[0][0] + data[1][1] + data[2][2]
		crros2_sum = data[0][2] + data[1][1] + data[2][0]
		
		if row_sum == 3 or collum_sum == 3 or crros1_sum == 3 or crros2_sum == 3 :
			print("circle winner")
			get_tree().quit()
		elif row_sum == -3 || collum_sum == -3 || crros1_sum == -3 || crros2_sum == -3:
			print("Crros winner")
			get_tree().quit()
	
	

func add_circle_or_cross(box,y,x) -> void:
	if box.visible == false:
		if forCircle:
			box.play("circle")
			data[y][x] = 1
			forCircle = false
		else:
			box.play("cross")
			data[y][x] = -1
			forCircle = true
		box.visible = true
		game_over()


func _on_b_0_button_down() -> void:
	add_circle_or_cross(s_0,0,0)
	


func _on_b_1_button_down() -> void:
	add_circle_or_cross(s_1,0,1)


func _on_b_2_button_down() -> void:
	add_circle_or_cross(s_2,0,2)


func _on_b_3_button_down() -> void:
	add_circle_or_cross(s_3,1,0)


func _on_b_4_button_down() -> void:
	add_circle_or_cross(s_4,1,1)


func _on_b_5_button_down() -> void:
	add_circle_or_cross(s_5,1,2)


func _on_b_6_button_down() -> void:
	add_circle_or_cross(s_6,2,0)


func _on_b_7_button_down() -> void:
	add_circle_or_cross(s_7,2,1)


func _on_b_8_button_down() -> void:
	add_circle_or_cross(s_8,2,2)
