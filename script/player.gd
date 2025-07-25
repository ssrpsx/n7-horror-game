extends CharacterBody2D

const speed = 110.0
var gravity = ProjectSettings.get_setting("physics/2d/default_gravity")
@onready var sprite = $AnimatedSprite2D
@onready var light = $PointLight2D
@onready var camera = $Camera2D

var flashlight_on = false

func _input(event):
	if event.is_action_pressed("ui_select"):
		toggle_flashlight()

func toggle_flashlight():
	flashlight_on = !flashlight_on
	light.enabled = flashlight_on
	
	if flashlight_on:
		if sprite.flip_h:
			light.position = sprite.position + Vector2(-202, -13)
			light.texture = preload("res://sprite/flashlight_left.png")
		else:
			light.position = sprite.position + Vector2(202, -13)
			light.texture = preload("res://sprite/flashlight_right.png")

func _physics_process(delta):
	if not is_on_floor():
		velocity.y += gravity * delta

	var direction = Input.get_axis("ui_left", "ui_right")
	if direction != 0:
		velocity.x = direction * speed
	else:
		velocity.x = move_toward(velocity.x, 0, speed)

	if velocity.x < 0:
		sprite.flip_h = true
	elif velocity.x > 0:
		sprite.flip_h = false

	if velocity.x != 0:
		if flashlight_on:
			sprite.play("walk_flashlight")
		else:
			sprite.play("walk_no_flashlight")
	else:
		if flashlight_on:
			sprite.play("idle_flashlight")
		else:
			sprite.play("idle_no_flashlight")

	if flashlight_on:
		if sprite.flip_h:
			light.position = sprite.position + Vector2(-202, -13)
			light.texture = preload("res://sprite/flashlight_left.png")
		else:
			light.position = sprite.position + Vector2(202, -13)
			light.texture = preload("res://sprite/flashlight_right.png")

	if sprite.flip_h:
		camera.position = sprite.position + Vector2(-118, 0)
	else:
		camera.position = sprite.position + Vector2(118, 0)
		
	move_and_slide()
