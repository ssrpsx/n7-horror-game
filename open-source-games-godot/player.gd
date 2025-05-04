extends CharacterBody2D

const speed = 110.0
var gravity = ProjectSettings.get_setting("physics/2d/default_gravity")
@onready var sprite = $AnimatedSprite2D
@onready var light = $PointLight2D
@onready var camera = $Camera2D

@onready var l = $Sprite2D/PointLight2D
@onready var sound = $Sprite2D/AudioStreamPlayer2D
@onready var jump = $Sprite2D
var check = false

var flashlight_on = false

func _input(event):
	if event.is_action_pressed("ui_select"):  # กด F หรือปุ่มที่คุณตั้งค่า
		toggle_flashlight()

func toggle_flashlight():
	flashlight_on = !flashlight_on  # สลับสถานะ
	light.enabled = flashlight_on  # เปิดหรือปิดไฟฉาย

func _physics_process(delta):
	# แรงโน้มถ่วง
	if not is_on_floor():
		velocity.y += gravity * delta
	
	if global_position.x >= 643 and check == false:
		jump.position = sprite.position + Vector2(-180, -10)
		l.visible = true
		jump.visible = true
		check = true
		sound.play()
	print(global_position)
	# การเคลื่อนที่
	var direction = Input.get_axis("ui_left", "ui_right")
	if direction:
		velocity.x = direction * speed
	else:
		velocity.x = move_toward(velocity.x, 0, speed)

	# การเล่นแอนิเมชั่นและการตั้งค่าตำแหน่งของไฟฉาย
	if velocity.x < 0:
		if flashlight_on:
			sprite.play("walk_flashlight")
		else:
			sprite.play("walk_no_flashlight")
		sprite.flip_h = true
		camera.position = sprite.position + Vector2(-118, 0)
		light.position = sprite.position + Vector2(-202, -13)
		light.texture = preload("res://sprite/flashlight_left.png")
		
	elif velocity.x > 0:
		if flashlight_on:
			sprite.play("walk_flashlight")
		else:
			sprite.play("walk_no_flashlight")
		sprite.flip_h = false
		camera.position = sprite.position + Vector2(118, 0)
		light.position = sprite.position + Vector2(202, -13)
		light.texture = preload("res://sprite/flashlight_right.png")
		print(velocity.x)
	else:
		if flashlight_on:
			sprite.play("idle_flashlight")
		else:
			sprite.play("idle_no_flashlight")

	move_and_slide()
