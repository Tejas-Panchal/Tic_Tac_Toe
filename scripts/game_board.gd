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

@onready var reset: Button = $Reset
@onready var white_box: Button = $"Color Box/White Box"
@onready var green_box: Button = $"Color Box/Green Box"
@onready var blue_box: Button = $"Color Box/Blue Box"

var data : Array = [ [0,0,0],[0,0,0],[0,0,0] ]
var forCircle = true
var gameActive = true

func _ready() -> void:
	reset.visible = false
	$Board.set_layer_enabled(0, true)
	white_box.visible = false
	$Board.set_layer_enabled(1, false)
	$Board.set_layer_enabled(2, false)

func _process(_delta: float) -> void:
	if gameActive == false:
		reset.visible = true

func game_over() -> void:
	for i in range(3):
		var row_sum = data[i][0] + data[i][1] + data[i][2]
		var collum_sum = data[0][i] + data[1][i] + data[2][i]
		
		if row_sum == 3 or collum_sum == 3:
			print("circle winner")
			gameActive = false
			return
		elif row_sum == -3 or collum_sum == -3:
			print("cross winner")
			gameActive = false
			return
	
	var cross1 = data[0][0] + data[1][1] + data[2][2]
	var cross2 = data[0][2] + data[1][1] + data[2][0]
	
	if cross1 == 3 or cross2 == 3:
		print("circle winner")
		gameActive = false
	elif cross1 == -3 or cross2 == -3:
		print("cross winner")
		gameActive = false
	
	var allClicked = 0
	for i in range(3):
		for j in range(3):
			if data[i][j] != 0:
				allClicked += 1
	if allClicked == 9:
		print("tie")
		gameActive = false

func add_circle_or_cross(box,y,x) -> void:
	if box.visible == false and gameActive:
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

func _on_b_0_button_down() -> void: add_circle_or_cross(s_0,0,0)
func _on_b_1_button_down() -> void: add_circle_or_cross(s_1,0,1)
func _on_b_2_button_down() -> void: add_circle_or_cross(s_2,0,2)
func _on_b_3_button_down() -> void: add_circle_or_cross(s_3,1,0)
func _on_b_4_button_down() -> void: add_circle_or_cross(s_4,1,1)
func _on_b_5_button_down() -> void: add_circle_or_cross(s_5,1,2)
func _on_b_6_button_down() -> void: add_circle_or_cross(s_6,2,0)
func _on_b_7_button_down() -> void: add_circle_or_cross(s_7,2,1)
func _on_b_8_button_down() -> void: add_circle_or_cross(s_8,2,2)
func _on_reset_button_down() -> void: get_tree().reload_current_scene()

func _on_white_box_button_down() -> void:
	$Board.set_layer_enabled(0, true)
	$Board.set_layer_enabled(1, false)
	$Board.set_layer_enabled(2, false)
	white_box.visible = false
	green_box.visible = true
	blue_box.visible = true

func _on_green_box_button_down() -> void:
	$Board.set_layer_enabled(0, false)
	$Board.set_layer_enabled(1, true)
	$Board.set_layer_enabled(2, false)
	white_box.visible = true
	green_box.visible = false
	blue_box.visible = true

func _on_blue_box_button_down() -> void:
	$Board.set_layer_enabled(0, false)
	$Board.set_layer_enabled(1, false)
	$Board.set_layer_enabled(2, true)
	white_box.visible = true
	green_box.visible = true
	blue_box.visible = false
