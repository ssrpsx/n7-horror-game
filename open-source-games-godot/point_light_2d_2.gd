extends PointLight2D

var is_active := true
@onready var sound = $emergency
func _ready():
	flicker_loop()

func flicker_loop() -> void:
	while is_active:
		await get_tree().create_timer(7).timeout
		for i in range(2):
			sound.play()
			
			visible = true
			var digit = 2.5
			for j in range(20):
				if j % 2 == 0:
					digit += 1.25
				else:
					digit -= 0.75
				energy = digit
				await get_tree().create_timer(0.225).timeout
			
			visible = false
			await get_tree().create_timer(7).timeout
		
		await get_tree().create_timer(14).timeout
