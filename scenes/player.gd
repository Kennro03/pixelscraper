class_name Player extends CharacterBody2D

@export var speed := 300.0
@export var sprint := 500
@export var gravity := 9.8
@export var jump_impulse := 5
@export var dash_speed := 850
@export var dash_duration := 1
@export var dash_cooldown := 2

var z_position := 0.0
var z_velocity := 0.0
var can_dash


func _on_dash_cooldown_timer_timeout() -> void:
	print("can dash")
	can_dash = true
	%DashCooldownTimer.stop()

func _ready() -> void:
	%DashCooldownTimer.start() 
