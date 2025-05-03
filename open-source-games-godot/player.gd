extends CharacterBody2D

const speed = 110.0
var gravity = ProjectSettings.get_setting("physics/2d/default_gravity")
@onready var sprite = $AnimatedSprite2D
@onready var light = $PointLight2D
@onready var camera = $Camera2D

func _physics_process(delta):
	# แรงโน้มถ่วง
	if not is_on_floor():
		velocity.y += gravity * delta

	# การเคลื่อนที่ซ้ายขวา
	var direction = Input.get_axis("ui_left", "ui_right")
	if direction:
		velocity.x = direction * speed
	else:
		velocity.x = move_toward(velocity.x, 0, speed)
	
	# อัปเดต animation และไฟ
	if velocity.x < 0:
		# เดินไปทางซ้าย
		sprite.play("walk")
		sprite.flip_h = true
		camera.position = sprite.position + Vector2(-118, 0)  # ไฟอยู่ทางซ้ายของตัวละคร
		light.position = sprite.position + Vector2(-202, -13)
		light.texture = preload("res://sprite/flashlight_left.png")
		
	elif velocity.x > 0:
		# เดินไปทางขวา
		sprite.play("walk")
		sprite.flip_h = false
		camera.position = sprite.position + Vector2(118, 0)  # ไฟอยู่ทางขวาของตัวละคร
		light.position = sprite.position + Vector2(202, -13)
		light.texture = preload("res://sprite/flashlight_right.png")
	else:
		# ถ้าไม่เคลื่อนที่
		sprite.play("idle")

	move_and_slide()
