extends Control


# Declare member variables here. Examples:
# var a = 2
# var b = "text"


# Called when the node enters the scene tree for the first time.
func _ready():
	pass


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	get_input()

func get_input():
	if Input.is_action_just_pressed("ui_right"):
		var karakter = $Character/AnimationPlayer.play("char_m_idle")
		$Label.text = "IDLE"
	elif Input.is_action_just_pressed("ui_left"):
		var karakter = $Character/AnimationPlayer.play("char_cooking")
		$Label.text = "Memasak"
	elif Input.is_action_just_pressed("ui_up"):
		var karakter = $Character/AnimationPlayer.play("char_merakit")
		$Label.text = "Merakit"
	pass
