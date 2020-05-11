extends Node

onready var Helper = preload("res://src/lib/json_helper.gd").new()

### GENERIC JSON ###
func readJSON(path):
	Helper = preload("res://src/lib/json_helper.gd").new()
	var data
	var file = File.new()
	var target = Helper.path4(path)
	print(target)
	if not file.file_exists(target):
		print("OTW buat bos!")
		createJSON(path)
		pass
	
	file.open(target, File.READ)
	data = JSON.parse(file.get_as_text())
	file.close()
	return data.result

func pushSJSON(key : Array, value : Array, path):
	Helper = preload("res://src/lib/json_helper.gd").new()
	var data
	var target = Helper.path4(path)
	var session = readJSON(target)
	
	for n in range(len(key)):
		session[key[n]] = value[n]
	saveJSON(session, target)
	return true

func saveJSON(data, path):
	Helper = preload("res://src/lib/json_helper.gd").new()
	var file = File.new()
	var target = Helper.path4(path)
	
	file.open(target, File.WRITE)
	file.store_line(JSON.print(data))
	file.close()
	return true

func createJSON(kind)->void:
	Helper = preload("res://src/lib/json_helper.gd").new()
	var data
	match kind:
		"pemain":
			data = Helper.get_pemain().duplicate(true)
		"penghargaan":
			data = Helper.get_penghargaan().duplicate(true)
		"jilid":
			data = Helper.get_jilid().duplicate(true)
		"bab":
			data = Helper.get_bab().duplicate(true)
	pass
