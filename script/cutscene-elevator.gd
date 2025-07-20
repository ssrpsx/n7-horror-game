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
