extends PlayerState

func enter(_previous_state_path: String, _data := {}) -> void:
	print("Entered falling state")
	##player.animation_player.play("fall")

func physics_update(delta: float) -> void:
	var input_direction_x := Input.get_axis("Left", "Right")
	var input_direction_y := Input.get_axis("Up", "Down")
	player.velocity.x = player.speed * input_direction_x
	player.velocity.y = player.speed * input_direction_y
	
	player.z_velocity -= player.gravity * delta
	player.z_position += player.z_velocity
	
	print("z_velocity=" + str(player.z_velocity) + " z_position=" + str(player.z_position))
	%PlayerSprite.offset.y = -player.z_position/500
	player.move_and_slide()

	if player.z_position <= 0:
		player.z_position = 0
		finished.emit(IDLE)
