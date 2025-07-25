extends Sprite2D
var is_active := true

@onready var timer = Timer.new()
@onready var sound = $up
@onready var open = $open
@onready var color = $PointLight2D

func _ready():
	add_child(timer)
	timer.one_shot = true
	timer.autostart = false
	var digit = 0.125
	open.play()
	
	timer.start(2)
	await timer.timeout
	color.energy = 0.0625
	
	for i in range(1, 20):
		timer.start(0.075)
		await timer.timeout
		digit += 0.0625
		color.energy = digit
	
	match Global.prev_scene_name:
		"1_st_floor2":
			match Global.go_to:
				"6th-front-elevator":
					var frames = 6
					for i in range(1, frames + 1):
						sound.play()
						texture = load("res://background/Cutscene/elevator/%s.png" % i)
						timer.start(2)
						await timer.timeout
	
					for i in range(1, 20):
						timer.start(0.075)
						await timer.timeout
						digit -= 0.0625
						color.energy = digit
					timer.start(1)
					
					Global.prev_scene_name = "1_st_floor2"
					get_tree().change_scene_to_file("res://scenes/6_th_front_elevator.tscn")
				"7th-front-elevator":
					var frames = 7
					for i in range(1, frames + 1):
						sound.play()
						texture = load("res://background/Cutscene/elevator/%s.png" % i)
						timer.start(2)
						await timer.timeout
	
					for i in range(1, 20):
						timer.start(0.075)
						await timer.timeout
						digit -= 0.0625
						color.energy = digit
					timer.start(1)
	
					Global.prev_scene_name = "1_st_floor2"
					get_tree().change_scene_to_file("res://scenes/7_th_front_elevator.tscn")
				"10th-front-elevator":
					var frames = 10
					for i in range(1, frames + 1):
						sound.play()
						texture = load("res://background/Cutscene/elevator/%s.png" % i)
						timer.start(2)
						await timer.timeout
	
					for i in range(1, 20):
						timer.start(0.075)
						await timer.timeout
						digit -= 0.0625
						color.energy = digit
					timer.start(1)
	
					Global.prev_scene_name = "1_st_floor2"
					get_tree().change_scene_to_file("res://scenes/10_th_front_elevator.tscn")
		"6th-front-elevator":
			match Global.go_to:
				"1th-front-elevator":
					var frames = 7
					for i in range(1, frames + 1):
						sound.play()
						texture = load("res://background/Cutscene/elevator/%s.png" % i)
						timer.start(2)
						await timer.timeout
	
					for i in range(1, 20):
						timer.start(0.075)
						await timer.timeout
						digit -= 0.0625
						color.energy = digit
					timer.start(1)
	
					Global.prev_scene_name = "cutscene_elevator"
					get_tree().change_scene_to_file("res://scenes/front-elevator.tscn")
				"7th-front-elevator":
					var frames = 7
					for i in range(1, frames + 1):
						sound.play()
						texture = load("res://background/Cutscene/elevator/%s.png" % i)
						timer.start(2)
						await timer.timeout
	
					for i in range(1, 20):
						timer.start(0.075)
						await timer.timeout
						digit -= 0.0625
						color.energy = digit
					timer.start(1)
	
					Global.prev_scene_name = "cutscene_elevator"
					get_tree().change_scene_to_file("res://scenes/front-elevator.tscn")
				"10th-front-elevator":
					var frames = 7
					for i in range(1, frames + 1):
						sound.play()
						texture = load("res://background/Cutscene/elevator/%s.png" % i)
						timer.start(2)
						await timer.timeout
	
					for i in range(1, 20):
						timer.start(0.075)
						await timer.timeout
						digit -= 0.0625
						color.energy = digit
					timer.start(1)
	
					Global.prev_scene_name = "cutscene_elevator"
					get_tree().change_scene_to_file("res://scenes/front-elevator.tscn")
		"7th-front-elevator":
			match Global.go_to:
				"1th-front-elevator":
					var frames = 7
					for i in range(1, frames + 1):
						sound.play()
						texture = load("res://background/Cutscene/elevator/%s.png" % i)
						timer.start(2)
						await timer.timeout
	
					for i in range(1, 20):
						timer.start(0.075)
						await timer.timeout
						digit -= 0.0625
						color.energy = digit
					timer.start(1)
	
					Global.prev_scene_name = "cutscene_elevator"
					get_tree().change_scene_to_file("res://scenes/front-elevator.tscn")
				"6th-front-elevator":
					var frames = 7
					for i in range(1, frames + 1):
						sound.play()
						texture = load("res://background/Cutscene/elevator/%s.png" % i)
						timer.start(2)
						await timer.timeout
	
					for i in range(1, 20):
						timer.start(0.075)
						await timer.timeout
						digit -= 0.0625
						color.energy = digit
					timer.start(1)
	
					Global.prev_scene_name = "cutscene_elevator"
					get_tree().change_scene_to_file("res://scenes/front-elevator.tscn")
				"10th-front-elevator":
					var frames = 7
					for i in range(1, frames + 1):
						sound.play()
						texture = load("res://background/Cutscene/elevator/%s.png" % i)
						timer.start(2)
						await timer.timeout
	
					for i in range(1, 20):
						timer.start(0.075)
						await timer.timeout
						digit -= 0.0625
						color.energy = digit
					timer.start(1)
	
					Global.prev_scene_name = "cutscene_elevator"
					get_tree().change_scene_to_file("res://scenes/front-elevator.tscn")
		"10th-front-elevator":
			match Global.go_to:
				"1_st_floor2":
					var frames = 7
					for i in range(1, frames + 1):
						sound.play()
						texture = load("res://background/Cutscene/elevator/%s.png" % i)
						timer.start(2)
						await timer.timeout
	
					for i in range(1, 20):
						timer.start(0.075)
						await timer.timeout
						digit -= 0.0625
						color.energy = digit
					timer.start(1)
	
					Global.prev_scene_name = "cutscene_elevator"
					get_tree().change_scene_to_file("res://scenes/front-elevator.tscn")
				"6th-front-elevator":
					var frames = 7
					for i in range(1, frames + 1):
						sound.play()
						texture = load("res://background/Cutscene/elevator/%s.png" % i)
						timer.start(2)
						await timer.timeout
	
					for i in range(1, 20):
						timer.start(0.075)
						await timer.timeout
						digit -= 0.0625
						color.energy = digit
					timer.start(1)
	
					Global.prev_scene_name = "cutscene_elevator"
					get_tree().change_scene_to_file("res://scenes/front-elevator.tscn")
				"7th-front-elevator":
					var frames = 7
					for i in range(1, frames + 1):
						sound.play()
						texture = load("res://background/Cutscene/elevator/%s.png" % i)
						timer.start(2)
						await timer.timeout
	
					for i in range(1, 20):
						timer.start(0.075)
						await timer.timeout
						digit -= 0.0625
						color.energy = digit
					timer.start(1)
	
					Global.prev_scene_name = "cutscene_elevator"
					get_tree().change_scene_to_file("res://scenes/front-elevator.tscn")
