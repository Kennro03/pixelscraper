extends PlayerState

func enter(_previous_state_path: String, _data := {}) -> void:
	##player.animation_player.play("run")
	pass

func physics_update(_delta: float) -> void:
	var input_direction_x := Input.get_axis("Left", "Right")
	var input_direction_y := Input.get_axis("Up", "Down")
	player.velocity.x = player.speed * input_direction_x
	player.velocity.y = player.speed * input_direction_y
	player.move_and_slide()

	##if not player.is_on_floor():
	##	finished.emit(FALLING)
	if Input.is_action_just_pressed("Jump"):
		finished.emit(JUMPING)
	elif is_equal_approx(input_direction_x, 0.0) and is_equal_approx(input_direction_y, 0.0):
		finished.emit(IDLE)
