extends PlayerState

func enter(_previous_state_path: String, _data := {}) -> void:
	player.velocity.x = 0.0
	player.velocity.y = 0.0
	player.z_velocity = 0.0
	%PlayerSprite.offset.y = 0
	
	##player.animation_player.play("idle")

func physics_update(_delta: float) -> void:
	player.move_and_slide()

	##if not player.is_on_floor():
	##	finished.emit(FALLING)
	if Input.is_action_just_pressed("Jump"):
		finished.emit(JUMPING)
	elif ["Left", "Right", "Up", "Down"].any(Input.is_action_pressed):
		finished.emit(RUNNING)
