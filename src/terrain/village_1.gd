extends YSort


# Declare member variables here. Examples:
# var a = 2
# var b = "text"
var up_state = 0

# Called when the node enters the scene tree for the first time.
func _ready():
	pass

func _process(delta):
	read_keyboard()
	refresh_upg()
	
func read_keyboard():
	if Input.is_action_just_released("ui_cancel"): #p
		var pos = $player.position
		print(pos)
		var obj = TextureRect.new()
		obj.rect_position = Vector2(pos.x-70, pos.y-75)
		obj.texture = load("res://asset/tilemap/hole.png")
		$upgrade.add_child(obj)
	if Input.is_action_just_released("ui_focus_next"): #tab
		up_state +=1
		refresh_upg()
	if Input.is_action_just_released("ui_home"): #home
		$CanvasLayer/dialog_window.create(["Harul: Kau tahu bahwa ada banyak legenda di negeri ini?\nIndri: Hmmm apa kau bisa membuktikannya? Aku akan mencatatnya di Buku Jurnalku\nHarul: Kau siap?\nIndri: Aku selalu siap!!\nHarul: Ayo kita membuktikannya!"])
	if Input.is_action_just_released("ui_end"): #end
		$CanvasLayer/dialog_window.create(["Aku perlu bantuanmu, Harul... Temui Kakek dan bantulah dia merakit alat ventilator."])
	if Input.is_action_just_released("ui_select"): #space
		get_tree().change_scene("res://src/page/action_page.tscn")
	if Input.is_action_just_released("ui_page_up"): #pageup
		$CanvasLayer/dialog_window.create(["Memperoleh:\nAksara Petunjuk          x1"])
		
func refresh_upg():
	match up_state:
			0:
				$upgrade/one.hide()
				$upgrade/two.hide()
			1:
				$upgrade/one.show()
				$upgrade/two.hide()
			2:
				$upgrade/one.show()
				$upgrade/two.show()
