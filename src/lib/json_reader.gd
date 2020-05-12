extends Node

var Helper = preload("res://src/lib/json_helper.gd").new()

func starter():
	pass
	#var dir = Directory.new()
	#var dir_name = "test-dir"
	#var filename = "test_file.txt"
	#var user_dir = "user://"
	#if( !dir.dir_exists( dir_name ) ):
	#	print( dir_name + " doesn't exist." )
	#	dir.make_dir_recursive( dir_name )
	#else:
	#	print( dir_name + " exists." )

### GENERIC JSON ###
func readJSON(path):
	var data
	var file = File.new()
	var target = Helper.path4(path)
	if not file.file_exists(target):
		print("OTW buat bos!")
		createJSON(path)
		pass
	
	file.open(target, File.READ)
	data = JSON.parse(file.get_as_text())
	file.close()
	return data.result

func pushJSON(key : Array, value : Array, path):
	var data
	var session = readJSON(path)
	print(session)
	for n in range(len(key)):
		session[key[n]] = value[n]
	saveJSON(session, path)
	return true

func saveJSON(data, path):
	var file = File.new()
	var target = Helper.path4(path)
	
	file.open(target, File.WRITE)
	file.store_line(JSON.print(data))
	file.close()
	return true

func createJSON(kind)->void:
	var data
	match kind:
		"bab":
			data = Helper.get_bab().duplicate(true)
			saveJSON(Helper.get_bab(),"bab")
		"jilid":
			data = Helper.get_jilid().duplicate(true)
			saveJSON(Helper.get_jilid(),"jilid")
		"pemain":
			data = Helper.get_pemain().duplicate(true)
			saveJSON(Helper.get_pemain(),"pemain")
		"penghargaan":
			data = Helper.get_penghargaan().duplicate(true)
			saveJSON(Helper.get_penghargaan(),"penghargaan")
	pass
