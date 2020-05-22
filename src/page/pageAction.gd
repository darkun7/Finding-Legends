extends Control

onready var DB     = load("res://src/lib/json_reader.gd").new()
onready var Helper = preload("res://src/lib/json_helper.gd").new()

onready var info   = $nav/top_py_info
onready var check = $window/HBoxContainer/prog_sample

var progress_target = 3
var progress = 0

var aksara_owned = ["1-2","1-3","1-1"]
var aksara_order = ["1-1","1-2","1-3"]
var aksara_selected = []

func _ready():
	if(get_node(".").name == "action_page"):
		_render_progres()
	elif(get_node(".").name == "aksara_page"):
		_render_aksara()
	pass # Replace with function body.

func _on_btn_close_pressed():
	$".".visible = false #will be changed return to village

### ACTION ###
func _on_btn_aksi_button_up():
	if(_add_progress() and info.get_pemain_value("apel")>0):
		info.set_pemain_value("apel", "-", 1)
		$window/bg/Character/AnimationPlayer.play("char_merakit")
		print("do action")
	else:
		$transition/AnimationPlayer.play("fade_in")

func _render_progres():
	for n in range(progress_target):
		var obj = TextureRect.new()
		obj.name = "prog_"+str(n)
		$window/HBoxContainer.add_child(obj)
		var new_obj = "window/HBoxContainer/prog_"+str(n)
		get_node(new_obj).texture = load("res://asset/img/checkbox.png")
	pass

func _add_progress():
	if progress < progress_target:
		var target = "window/HBoxContainer/prog_"+str(progress)
		get_node(target).texture = load("res://asset/img/checkbox_1.png")
		progress += 1
		return true
	else:
		print("Action Kelar")
		return false

### AKSARA ###

func _render_aksara():
	for n in range(len(aksara_owned)):
		var obj = TextureButton.new()
		obj.name = aksara_owned[n]
		$window/obtained/scroll/contain.add_child(obj)
		var new_obj = "window/obtained/scroll/contain/"+aksara_owned[n]
		get_node(new_obj).texture_normal = load("res://asset/img/aksara/"+aksara_owned[n]+".png")
		get_node(new_obj).connect("pressed", self, "select_aksara", [new_obj])
	for n in range(len(aksara_selected)):
		var obj = TextureButton.new()
		obj.name = aksara_selected[n]
		$window/put/scroll/contain.add_child(obj)
		var new_obj = "window/put/scroll/contain/"+aksara_selected[n]
		get_node(new_obj).texture_normal = load("res://asset/img/aksara/"+aksara_selected[n]+".png")
	pass

func select_aksara(aksara):
	var id = aksara.split('/', false, 4)
	if(len(aksara_selected)-1 < len(aksara_order)):
		aksara_selected.append(id[4])
	_render_aksara()

func clear_aksara():
	aksara_selected = []
	for child in $window/put/scroll/contain/.get_children():
		child.free()
	_render_aksara()
	print(aksara_selected)

func cek_aksara():
	if (info.get_pemain_value("apel")>0):
		info.set_pemain_value("apel", "-", 1)
		if(len(aksara_selected) == len(aksara_order)):
			if (aksara_selected == aksara_order):
				print("win")
				$confirm_window.create(3, "Selamat legenda berhasil dipecahkan dengan nilai memuaskan!", "")
			else:
				print("wrong")
			validator()
			clear_aksara()
	else:
		pass #apel Kurang

func validator():
	var skor = 0
	for n in range(len(aksara_order)):
		if aksara_order[n] == aksara_selected[n]:
			skor +=1
	print(skor)
	skor = skor*100/len(aksara_order)
	$window/memo/skor.text = str(skor)+"%"
	print(skor)
