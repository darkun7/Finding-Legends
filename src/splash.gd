extends Control
onready var Page = load("res://src/page/pageController.gd").new()


func _ready():
	yield(get_tree().create_timer(0.5), "timeout")
	$AnimationPlayer.play("tape_open")

func _on_AnimationPlayer_animation_finished(anim_name):
	if(anim_name == "tape_open"):
		get_tree().change_scene("res://src/page/story_page.tscn")