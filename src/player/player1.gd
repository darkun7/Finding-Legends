extends KinematicBody2D

const kecepatan = 200
const gravitasi = 30
const kekuatan_lompat = -750
const LANTAI = Vector2(0,-1)
var pergerakan = Vector2()
var di_tanah = false
export var n = 0
var tutor = 0
export var move_speedx = Vector2(240, 0)
export var move_speedy = Vector2(0, 240)
var floor_normalx = Vector2(0, -1)
var floor_normaly = Vector2(-1, 0)


#const TEMBAKAN = preload("res://tembakan.tscn")
#const INJAKAN = preload("res://injakan.tscn") """

func _physics_process(delta):
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

