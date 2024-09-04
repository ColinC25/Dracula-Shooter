extends CharacterBody2D

#TODOS
#Correct velocity when opposite direction input is pressed
#to match cold stop velocity drop
#Create health bar
#Create collision signal with enemies to lose health
#Fix jump bug so that can_jump only turns true when touching ground, not any wall
#TESTING NEW BRANCH

var gravity = 25
var move_speed = 50
var max_move_speed_left = -1300
var max_move_speed_right = 1300
var jump_velocity = 1500
var char_facing_right = true
var can_jump = false
#penist and ballst 

# Called when the node enters the scene tree for the first time.
func _ready():
	$".".position[0] = 100
	$".".position[1] = 100


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	velocity.y = velocity.y + gravity
	movement_handler(delta)
	jump()
	move_and_slide()
	pass

func movement_handler(delta):
	if Input.is_action_pressed("walk_left"):
		if char_facing_right:
			char_facing_right = not char_facing_right
			$PlayerSprite.flip_h = true
		if velocity.x > max_move_speed_left:
			velocity.x = velocity.x - move_speed
	elif Input.is_action_pressed("walk_right"):
		if not char_facing_right:
			char_facing_right = not char_facing_right
			$PlayerSprite.flip_h = false
		if velocity.x < max_move_speed_right:
			velocity.x = velocity.x + move_speed
	else:
		if velocity.x > 0:
			velocity.x = velocity.x - velocity.x / 8
		if velocity.x < 0:
			velocity.x = velocity.x - velocity.x / 8

func jump():
	if Input.is_action_just_pressed("jump") and can_jump == true:
		velocity.y = - jump_velocity
		can_jump = false
		





func _on_area_2d_body_entered(body):
	print("you are touching the floor")
	if body.is_in_group("floor"):
		can_jump = true
