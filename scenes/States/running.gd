extends PlayerState

func enter(_previous_state_path: String, _data := {}) -> void:
	##player.animation_player.play("run")
	pass

func physics_update(_delta: float) -> void:
	var input_direction = Input.get_vector("Left", "Right", "Up", "Down")
	if Input.is_action_pressed("Sprint") :
		player.velocity = input_direction * player.sprint
	else : 
		player.velocity = input_direction * player.speed 
	
	player.move_and_slide()

	if Input.is_action_just_pressed("Jump"):
		finished.emit(JUMPING)
	elif Input.is_action_just_pressed("Dash") and player.can_dash==true:
		finished.emit(DASHING)
	elif input_direction == Vector2(0.0,0.0) :
		finished.emit(IDLE)
