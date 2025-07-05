extends PlayerState

func enter(_previous_state_path: String, _data := {}) -> void:
	##player.animation_player.play("jump")
	player.z_velocity = player.jump_impulse
	print("Entered jump state")

func physics_update(delta: float) -> void:
	var input_direction = Input.get_vector("Left", "Right", "Up", "Down")
	player.velocity = input_direction * player.speed 

	player.z_velocity -= player.gravity * delta
	player.z_position += player.z_velocity 
	print("z_velocity=" + str(player.z_velocity) + " z_position=" + str(player.z_position))
	%PlayerSprite.offset.y = -player.z_position
	
	player.move_and_slide()

	if player.z_velocity <= 0:
		finished.emit(FALLING)
