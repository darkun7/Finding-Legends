extends Control

onready var DB = load("res://src/lib/json_reader.gd").new()
onready var Helper = preload("res://src/lib/json_helper.gd").new()

const frame_jilid = preload("res://asset/ui/utility/jilid_frame.res")

signal switch_scene_done
var setting_state = false
var sound_state = true
onready var info = $nav/top_py_info

func _ready():
	_starter()
	_update_data()

func _starter():
	$setting_window/window/btn_close.connect("pressed",self, "setting_btn_close_pressed")
	$transition/AnimationPlayer.connect("animation_finished",self, "trasition_finished")
	$transition.visible = true
	$transition/AnimationPlayer.play("wipe_out");
	
	info.get_data_bab()
	info.get_data_jilid()
	info.get_data_pemain()
	info.get_data_penghargaan()

func _update_data():
	var pemain = info.get_data_pemain()
	var jilid  = info.get_data_jilid()
	#render
	for n in jilid:
		var obj = frame_jilid.instance()
		obj.title.Label.text = "a"
		$panel/scroll/contain.add_child(obj)

func goto_scene(target: String, anim = "wipe")->void:
	$transition/AnimationPlayer.play(anim+"_in")
	var transition = yield($transition/AnimationPlayer, "animation_finished")
	if(transition == "wipe_in"):
		get_tree().change_scene("res://src/"+target+".tscn")
	
func trasition_finished(anim):
	if(anim == "wipe_in"):
		$transition.visible = false
	#	$transition/AnimationPlayer.play(anim+"_out")

### BTN NAVIGATOR ###
func _btn_setting_onpress():
	toggle_setting()
func _btn_achievement_onpress():
	goto_scene("page/achievement_page")
func _btn_story_onpress():
	goto_scene("page/story_page")

### SETTING PART ###
func toggle_setting():
	$setting_window.visible = !setting_state
	setting_state = !setting_state

func setting_btn_close_pressed():
	toggle_setting()

### SELECT JILID-BAB ###
func select_jilid():
	pass

func show_bab_option():
	pass

func show_action():
	pass

func cancel_action():
	pass


### SELECT ACHIEVEMENT ###
func select_achievement():
	pass

func show_achievement_desc():
	pass