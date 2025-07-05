extends PlayerState
var input_direction

func enter(_previous_state_path: String, _data := {}) -> void:
	##player.animation_player.play("dash")
	print("DASHING")
	input_direction = Input.get_vector("Left", "Right", "Up", "Down")
	%DashTimer.start()
	player.can_dash = false

func physics_update(_delta: float) -> void:
	player.velocity = input_direction * player.dash_speed
	player.move_and_slide()

func _on_dash_timer_timeout() -> void:
	%DashCooldownTimer.start() 
	print("Finished Dash timer")
	finished.emit(IDLE)
