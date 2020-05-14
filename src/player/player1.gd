extends KinematicBody2D

const kecepatan = 200
const gravitasi = 30
const kekuatan_lompat = -750
const LANTAI = Vector2(0,-1)
var pergerakan = Vector2()
var di_tanah = false
export var n = 0
var run = "run"
var idle = "idle"
var jump = "jump"
var fall = "fall"
var tutor = 0

#const TEMBAKAN = preload("res://tembakan.tscn")
#const INJAKAN = preload("res://injakan.tscn") """

func _physics_process(delta):
	if Input.is_action_just_pressed('ui_select'):
		n= (n+1)%2
		print('berhasil')
	#hukum gravitasi
	if get_parent().kanan:
		pergerakan.x = kecepatan
		#$Sprite.play(run+str(n))
		#$Sprite.flip_h = false
		#if sign($Position2D.position.x) == -1:
		#	$Position2D.position.x *= -1
	elif get_parent().kiri:
		pergerakan.x = -kecepatan
		#$Sprite.play(run+str(n))
		#$Sprite.flip_h = true
		#if sign($Position2D.position.x) == 1:
		#	$Position2D.position.x *= -1
	elif get_parent().atas:
		pergerakan.x = -kecepatan
		#$Sprite.play(run+str(n))
		#$Sprite.flip_h = true
		#if sign($Position2D.position.x) == 1:
		#	$Position2D.position.x *= -1
	else:
		pergerakan.x = 0
		if di_tanah == true:
			$Sprite.play(idle+str(n))

	pergerakan = move_and_slide(pergerakan, LANTAI)
	
