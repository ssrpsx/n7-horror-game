extends PointLight2D

var is_active := true
@onready var sound = $light
func _ready():
	flicker_loop()

func flicker_loop() -> void:
	while is_active:
		await get_tree().create_timer(2).timeout
		for i in range(5):
			sound.play()
			
			visible = true
			await get_tree().create_timer(0.25).timeout
			
			visible = false
			await get_tree().create_timer(0.25).timeout
		
		await get_tree().create_timer(5.0).timeout
