extends KinematicBody2D

export var speed = 150
onready var joystick = get_parent().get_node("CanvasLayer/joystick/joystick_button")
func _process(delta):
	move_and_slide(joystick.get_value()*speed)
