extends KinematicBody2D

export var speed = 600
onready var joystick = get_parent().get_node("joystick/joystick_button")
func _process(delta):
	move_and_slide(joystick.get_value()*speed)
