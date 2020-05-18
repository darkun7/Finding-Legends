extends KinematicBody2D

export var speed = 150
export var move_speedx = Vector2(240, 0)
export var move_speedy = Vector2(0, 240)
var floor_normalx = Vector2(0, -1)
var floor_normaly = Vector2(-1, 0)

onready var joystick = get_parent().get_parent().get_node("CanvasLayer/joystick/joystick_button")
func _process(delta):
	move_and_slide(joystick.get_value()*speed)
	_move_left()
	_move_right()
	_move_up()
	_move_bottom()
	
func _move_left():
	if Input.is_action_pressed("ui_left"):
		move_and_slide(-move_speedx, floor_normalx)
		print("kiri")
		
func _move_right():
	if Input.is_action_pressed("ui_right"):
		move_and_slide(move_speedx, floor_normalx)
		print("kanan")

func _move_up():
	if Input.is_action_pressed("ui_up"):
		move_and_slide(-move_speedy, floor_normaly)
		print("atas")
		
func _move_bottom():
	if Input.is_action_pressed("ui_down"):
		move_and_slide(move_speedy, floor_normaly)
