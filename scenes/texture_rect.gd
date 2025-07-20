extends TextureRect

var frame = 1
var max_frame = 5
var frame_delay = 0.75

func _ready():
	loop_animation()

func loop_animation() -> void:
	while true:
		texture = load("res://ui/bettery/Battery%d.png" % frame)
		frame += 1
		if frame > max_frame:
			frame = 1
		await get_tree().create_timer(frame_delay).timeout
