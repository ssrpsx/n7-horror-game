extends CharacterBody2D

const speed = 150.0
var gravity = ProjectSettings.get_setting("physics/2d/default_gravity")

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
	
	if velocity.x < 0:
		get_node("AnimatedSprite2D").play("walk")
		get_node("AnimatedSprite2D").set_flip_h(true)
	elif velocity.x > 0:
		get_node("AnimatedSprite2D").play("walk")
		get_node("AnimatedSprite2D").set_flip_h(false)
	else:
		get_node("AnimatedSprite2D").play("idle")
	move_and_slide()
