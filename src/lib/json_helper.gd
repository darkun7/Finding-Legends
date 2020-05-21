extends Node

var default_pemain = {
            ve = '0-beta1',#versi database
            na = "Tester", #nama
            ap = 5,   #apel
            ko = 500, #koin
            st = 3, #bintang stage
            wt = 0, #waktu total
            ws = 0, #waktu session
            achievement = [],    #(id,step)
            jb = [[1,1], [1,2]], #stage yang terbuka (jilid, bab)
            fjb = [[1,1,3]],     #stage yang diselesaikan (jilid, bab, bintang)
            rune = [],           #aksara yang dimiliki (id, jumlah)
            items = {}           #barang yang dimiliki (id, jumlah)
        } setget , get_pemain
var default_penghargaan = [
       "Petualang Pemula",
       "Kolektor Apel",
       "Pahlawan Desa",
       "Arkeolog",
       "Hartawan",
       "Lupa Waktu"
    ] setget , get_penghargaan
var default_jilid = [
       ["Julid 1", "res://asset/ui/utility/null.png"],
       ["Julid 2", "res://asset/ui/utility/null.png"],
       ] setget , get_jilid
var default_bab = [
       [1,1, "Desa 1", "Deskripsi Story1"],
       [1,2, "Desa 2", "Deskripsi Story2"],
       [1,3, "Desa 3", "Deskripsi Story3"],
       [2,1, "Desa 1", "Deskripsi Story1"],
       [2,1, "Desa 2", "Deskripsi Story2"]
    ] setget , get_bab

func get_pemain():
	return default_pemain
func get_penghargaan():
	return default_penghargaan
func get_jilid():
	return default_jilid
func get_bab():
	return default_bab

func path4(target: String)->String:
	match target:
		"pemain":
			return "user://userdata.json"
		"penghargaan":
			return "user://achievement.json"
		"jilid":
			return "user://chapter.json"
		"bab":
			return "user://stage.json"
	return "null :("
