extends PointLight2D

var is_active := true

func _ready():
	flicker_loop()

func flicker_loop() -> void:
	while is_active:
		# กระพริบ 4 ครั้ง
		for i in range(4):
			visible = true
			await get_tree().create_timer(0.25).timeout
			visible = false
			await get_tree().create_timer(0.25).timeout
		
		# ดีเลย์ 10 วินาที
		await get_tree().create_timer(5.0).timeout
