extends Control

onready var DB     = load("res://src/lib/json_reader.gd").new()
onready var Helper = preload("res://src/lib/json_helper.gd").new()

const frame_penghargaan  = preload("res://asset/ui/utility/penghargaan_frame.res")
const frame_jilid  = preload("res://asset/ui/utility/jilid_frame.res")
const button_bab   = preload("res://asset/ui/utility/bab_button.res")

signal switch_scene_done

var ID_jilid setget set_id_jilid, get_id_jilid
var ID_bab setget set_id_bab, get_id_bab
var setting_state  = false
var sound_state    = true

onready var info   = $nav/top_py_info

func _ready():
	_starter()
	_update_data()
	$side_panel.hide()
	if(get_node(".").name == "story_page"):
		_render("jilid")
		for btn in get_tree().get_nodes_in_group("action_btn"):
			btn.connect("pressed", self, "action_btn_group", [btn.name])
		$side_panel/action_btn_group.hide()
		$side_panel/panel/score.hide()
	else:
		_render("penghargaan")

func _starter():
	$setting_window/window/btn_close.connect("pressed",self, "setting_btn_close_pressed")
	$transition/AnimationPlayer.connect("animation_finished",self, "trasition_finished")
	$transition.visible = true
	$transition/AnimationPlayer.play("wipe_out");
	
	# == Update Baru == #
	DB.saveJSON(Helper.get_bab(),"bab")
	DB.saveJSON(Helper.get_jilid(),"jilid")
	DB.saveJSON(Helper.get_penghargaan(),"penghargaan")
	
	info.get_data_bab()
	info.get_data_jilid()
	info.get_data_pemain()
	info.get_data_penghargaan()

func _render(type, id = null):
	match type:
		"jilid":
			for child in $panel/scroll/contain/.get_children():
				child.free()
			var jilid  = info.get_data_jilid()
			for n in range(len(jilid)):
				var obj = frame_jilid.instance()
				obj.name = "jilid_"+str(n)
				$panel/scroll/contain.add_child(obj)
				var new_obj = "panel/scroll/contain/jilid_"+str(n)
				get_node(new_obj+"/title/Label").text = jilid[n][1] #set judul jilid
				get_node(new_obj+"/cover").texture = load(jilid[n][2])
				get_node(new_obj).connect("pressed", self, "select_jilid", [new_obj])
		"bab":
			$side_panel.show()
			for child in $side_panel/panel/scroll/contain.get_children():
				child.free()
			var bab  = info.get_data_bab()
			for n in range(len(bab)):
				if(bab[n][0] == id):
					var obj  = button_bab.instance()
					obj.name = "bab_"+str(bab[n][1])
					$side_panel/panel/scroll/contain.add_child(obj)
					var new_obj = "side_panel/panel/scroll/contain/bab_"+str(bab[n][1])
					get_node(new_obj+"/Label").text = bab[n][2]
					get_node(new_obj).connect("pressed", self, "select_bab", [new_obj])
		"penghargaan":
			for child in $panel/scroll/contain/.get_children():
				child.free()
			var penghargaan  = info.get_data_penghargaan()
			for n in range(len(penghargaan)):
				var obj = frame_penghargaan.instance()
				obj.name = "penghargaan_"+str(n)
				$panel/scroll/contain.add_child(obj)
				var new_obj = "panel/scroll/contain/penghargaan_"+str(n)
				get_node(new_obj+"/Label").text = penghargaan[n][1]
				
				var pemain = info.get_data_pemain()
				get_node(new_obj+"/cover").texture = load(penghargaan[n][3])
				get_node(new_obj+"/cover").self_modulate = Color("5f5f5f")
				for p_ach in pemain["achievement"]:
					if penghargaan[n][0] == p_ach[0] && p_ach[1] >0:
						get_node(new_obj+"/cover").self_modulate = Color("ffffff")
				
				get_node(new_obj).connect("pressed", self, "select_penghargaan", [new_obj])

func _update_data():
	var pemain = info.get_data_pemain()
	#render
	

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
func select_jilid(button):
	var bid = button.split('_', false, 1)
	set_id_jilid(int(bid[1])+1)
	$side_panel/action_btn_group.hide()
	$side_panel/panel/score.hide()
	_render("bab", int(get_id_jilid())) #kode id stage. karena awalnya 0 jadi +1

func select_bab(button):
	var bid = button.split('_', false, 2)
	bid = bid[2]
	$side_panel/action_btn_group.show()

	set_id_bab(bid)
	var pemain = info.get_data_pemain()
	$side_panel/panel/score.texture = load("res://asset/img/score_0.png")
	for stage in pemain["fjb"]:
		if str(stage[0]) == get_id_jilid() && str(stage[1]) == get_id_bab():
			$side_panel/panel/score.texture = load("res://asset/img/score_"+str(stage[2])+".png")
	$side_panel/panel/score.show()
	

func action_btn_group(button):
	var type = button.split('_', false, 1)[1]
	match type:
		"confirm":
			print(get_id_bab())
		"clue":
			var bab = info.get_data_bab()
			for n in range(len(bab)):
				if( str(bab[n][0]) == get_id_jilid() and str(bab[n][1]) == get_id_bab() ):
					var story = bab[n][3]
					$dialog_window.create(story)
		"return":
			_ready()
	


### SELECT ACHIEVEMENT ###
func select_penghargaan(button):
	var ach = info.get_data_penghargaan()
	var bid = button.split('_', false, 1)
	var id  = bid[1]
	$side_panel.show()
	$side_panel/panel/Label.text = ach[int(id)][2]


### SETGET ###
func set_id_jilid(value):
	ID_jilid = value
func get_id_jilid():
	return str(ID_jilid)

func set_id_bab(value):
	ID_bab = value
func get_id_bab():
	return str(ID_bab)