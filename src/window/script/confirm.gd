extends Control



var star setget set_star, get_star
var message setget set_msg, get_msg
var textbox setget set_textbox, get_textbox


# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.


func create(star : int, message, textbox):
	set_star(star)
	set_msg(message)
	set_textbox(textbox)
	$".".visible = true

func set_msg(value):
	message = value
	$window/msg_top.text = value
func get_msg():
	return message

func set_textbox(value):
	textbox = value
	$window/msg_bottom.text = value
func get_textbox():
	return textbox

func set_star(value):
	star = value
	match value:
		-1:
			pass
		0:
			$header.texture = load("res://asset/img/fail_0_coba_lagi.png")
		1:
			$header.texture = load("res://asset/img/fail_1_cukup_baik.png")
		2:
			$header.texture = load("res://asset/img/win_2_semangat.png")
		3:
			$header.texture = load("res://asset/img/win_3_berhasil.png")
func get_star():
	return star
