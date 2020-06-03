extends Control

onready var DB = load("res://src/lib/json_reader.gd").new()
onready var Helper = preload("res://src/lib/json_helper.gd").new()

signal switch_scene_done
var setting_state = false
var sound_state = true

func _ready():
	$setting_window/window/btn_close.connect("pressed",self, "setting_btn_close_pressed")
	
	$transition/AnimationPlayer.connect("animation_finished",self, "trasition_finished")
	$transition.visible = true
	$transition/AnimationPlayer.play("wipe_out");
	
	#--load data--
	var data_pemain = DB.readJSON("pemain")
	var data_penghargaan = DB.readJSON("penghargaan")
	var data_jilid = DB.readJSON("jilid")
	var data_bab = DB.readJSON("bab")
	printraw(data_pemain)
	print(data_penghargaan)
	print(data_jilid)
	print(data_bab)

func _process(delta):
	if(delta):
		var timeDict = OS.get_time()
		var hour     = str(timeDict.hour)
		var minute   = timeDict.minute
		if(minute<10):
			minute = str(minute)
			minute ='0'+minute
		$nav/top_py_info/watch.text = hour+':'+str(minute)

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


func _on_jilid_sample_pressed():
	get_tree().change_scene("res://src/terrain/village1.tscn")
