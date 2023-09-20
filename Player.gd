extends CharacterBody2D

#@export var speed
var maxspeed = 600
var drag = 0.0125
var screenSize = Vector2.ZERO

func _ready():
	screenSize = get_viewport_rect().size
	position = Vector2(get_viewport_rect().position.x + screenSize.x/2, get_viewport_rect().position.y + screenSize.y/2)

func _physics_process(delta: float):
	
	if Input.is_action_pressed("move_up"):
		velocity.y -= 20
		$AnimatedSprite2D.animation = "engineOn"
		$AnimatedSprite2D.flip_v = false
		$AnimatedSprite2D.rotation = deg_to_rad(0)
	if Input.is_action_pressed("move_down"):
		velocity.y += 20
		$AnimatedSprite2D.flip_v = true
		$AnimatedSprite2D.rotation = deg_to_rad(0)
	if Input.is_action_pressed("move_right"):
		velocity.x += 20
		$AnimatedSprite2D.rotation = deg_to_rad(90)
		$AnimatedSprite2D.flip_v = false
	if Input.is_action_pressed("move_left"):
		velocity.x -= 20
		$AnimatedSprite2D.rotation = deg_to_rad(-90)
		$AnimatedSprite2D.flip_v = false
	
	velocity = velocity.limit_length(maxspeed)
	velocity = velocity.lerp(Vector2.ZERO, drag)
	set_velocity(velocity)
	move_and_slide()

func _on_gate_north_body_entered(body):
	print('north gate entered')
	hide()
	global_position = Vector2(body.position.x, body.position.y+1000)
	show()


func _on_gate_south_body_entered(body):
	print('south gate entered')
	hide()
	global_position = Vector2(body.position.x, body.position.y-1000)
	show()
