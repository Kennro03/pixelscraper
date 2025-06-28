extends CharacterBody2D

@export var speed = 400
@export var dash_cooldown = 2


func get_input():
	var input_direction = Input.get_vector("Left", "Right", "Up", "Down")
	velocity = input_direction * speed 

func get_sprint():
	if Input.is_action_pressed("Sprint"):
		speed = 750
	else : 
		speed = 400

func get_dash():
	if Input.is_action_pressed("Dash") :
		var input_direction = Input.get_vector("Left", "Right", "Up", "Down")
		velocity = input_direction * 1000
	

func _physics_process(_delta):
	get_sprint()
	get_input()
	get_dash()
	move_and_slide()


func _on_dash_timer_timeout() -> void:
	pass # Replace with function body.
