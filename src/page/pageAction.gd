extends Control

onready var DB     = load("res://src/lib/json_reader.gd").new()
onready var Helper = preload("res://src/lib/json_helper.gd").new()

onready var info   = $nav/top_py_info

func _ready():
	pass # Replace with function body.

func _on_btn_close_pressed():
	$".".visible = false #will be changed return to village


func _on_btn_aksi_button_up():
	info.set_pemain_value("apel", "-", 1)
	print("do action")
