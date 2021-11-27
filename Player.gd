extends KinematicBody2D

export var velocity = Vector2();
var maxspeed = 600
var drag = 0.0125
var screenSize = Vector2.ZERO

func _ready():
	screenSize = get_viewport_rect().size
	position = Vector2(get_viewport_rect().position.x + screenSize.x/2, get_viewport_rect().position.y + screenSize.y/2)

func _physics_process(delta: float):
	
	if Input.is_action_pressed("move_up"):
		velocity.y -= 20
		$AnimatedSprite.flip_v = false
		$AnimatedSprite.rotation = deg2rad(0)
	if Input.is_action_pressed("move_down"):
		velocity.y += 20
		$AnimatedSprite.flip_v = true
		$AnimatedSprite.rotation = deg2rad(0)
	if Input.is_action_pressed("move_right"):
		velocity.x += 20
		$AnimatedSprite.rotation = deg2rad(90)
		$AnimatedSprite.flip_v = false
	if Input.is_action_pressed("move_left"):
		velocity.x -= 20
		$AnimatedSprite.rotation = deg2rad(-90)
		$AnimatedSprite.flip_v = false
	
	velocity = velocity.clamped(maxspeed)
	velocity = velocity.linear_interpolate(Vector2.ZERO, drag)
	move_and_slide(velocity)

func _on_Area2D_area_entered(area):
	print('gate entered')
	hide()
	global_position = Vector2(area.position.x, area.position.y+100)
	show()
