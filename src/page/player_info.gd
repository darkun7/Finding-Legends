extends HBoxContainer

onready var DB = load("res://src/lib/json_reader.gd").new()
onready var Helper = preload("res://src/lib/json_helper.gd").new()

var data_bab setget set_data_bab, get_data_bab
var data_jilid setget set_data_jilid, get_data_jilid
var data_pemain setget set_data_pemain, get_data_pemain
var data_penghargaan setget set_data_penghargaan, get_data_penghargaan

func _ready():
	_update_data()

func _process(delta):
	if(delta):
		var timeDict = OS.get_time()
		var hour     = str(timeDict.hour)
		var minute   = timeDict.minute
		if(minute<10):
			minute = str(minute)
			minute ='0'+minute
		$watch.text = hour+':'+str(minute)
	var isi = int($Timer.time_left)
	if(isi/60 == 0):
		isi = stepify($Timer.time_left,1)
	else:
		isi = str(isi/60)+" menit"
	$apple_group.hint_tooltip = str(get_data_pemain()["ap"])+" buah apel\n Terisi dalam: "+str(isi)

func _update_data():
	var pemain = get_data_pemain()
	$coin_group/num.text    = str(pemain["ko"])
	$apple_group/extra.text = _get_apple()
	$py_star/num.text       = _get_all_star()
	

func _get_all_star()->String:
	var pemain = get_data_pemain()
	var value = 0
	for n in range(len(pemain["fjb"])):
		value += pemain["fjb"][n][2]
	return str(value)

func _get_apple()->String:
	var extra
	var temp
	var apple = int(get_data_pemain()["ap"])
	var path = "apple_group/apple"
	var tex_apple_full = preload("res://asset/img/apel_0.png")
	var tex_apple_half = preload("res://asset/img/apel_1.png")
	var tex_apple_empty = preload("res://asset/img/apel_2.png")
	
	
	if apple <=10:
		if apple %2 == 0:
			temp = ((10-apple)/2)-1
			for i in range(1,5-temp):
				get_node(path+(str(i))).texture = tex_apple_full
			for i in range(5-temp,6):
				get_node(path+(str(i))).texture = tex_apple_empty
		else:
			print("apple",apple)
			temp = int((apple/2)+1)
			for i in range(1,temp):
				get_node(path+(str(i))).texture = tex_apple_full
			if(temp>0):
				get_node(path+(str(temp))).texture = tex_apple_half
			for i in range(temp,6):
				print(i)
			#	get_node(path+(str(i))).texture = tex_apple_empty
			#get_node(path+"1")
			pass #ganjil
	else:
		extra = apple-10
		for i in range(1,6):
			get_node(path+(str(i))).texture = tex_apple_full
		return "+"+str(extra)
	return ""


### SETTER GETTER ###
func set_data_bab(value):
	DB.saveJSON(value,"bab")
	pass
func get_data_bab():
	var value = DB.readJSON("bab")
	return value 

func set_data_jilid(value):
	DB.saveJSON(value,"jilid")
	pass
func get_data_jilid():
	var value = DB.readJSON("jilid")
	return value 

func set_data_pemain(value):
	DB.saveJSON(value,"pemain")
	pass
func get_data_pemain():
	var value = DB.readJSON("pemain")
	return value 

func set_data_penghargaan(value):
	DB.saveJSON(value,"penghargaan")
	pass
func get_data_penghargaan():
	var value = DB.readJSON("penghargaan")
	return value 

func _on_apple_regen_timeout():
	DB.pushJSON(["ap"], [get_data_pemain()["ap"]+1], "pemain")
	_update_data()
