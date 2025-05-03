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

	open.play()
	
	timer.start(2)
	await timer.timeout
	color.energy = 0.25

	timer.start(0.5)
	await timer.timeout
	color.energy = 0.75

	timer.start(0.5)
	await timer.timeout
	color.energy = 1

	timer.start(1)
	await timer.timeout
	color.energy = 1.25

	var frames = 7
	for i in range(1, frames + 1):
		sound.play()
		texture = load("res://background/Cutscene/elevator/%s.png" % i)
		timer.start(2)
		await timer.timeout
	timer.start(1)
	await timer.timeout

	get_tree().change_scene_to_file("res://front-elevator.tscn")
