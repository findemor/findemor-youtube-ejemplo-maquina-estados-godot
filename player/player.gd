class_name Player
extends CharacterBody2D

@export var movement_stats:CharacterMovementStats

@onready var body: Node2D = $body
@onready var animation_player = $AnimationPlayer

var states:PlayerStateNames = PlayerStateNames.new()
var animations:PlayerAnimations = PlayerAnimations.new()

func set_facing_direction(x:float) -> void:
	if abs(x) > 0:
		body.scale.x = -1 if (x < 0) else 1

func is_facing_right() -> bool:
	return body.scale.x > 0
	
func _process(_delta):
	set_facing_direction(velocity.x)
	
func play_animation(animation_name:String):
	animation_player.play(animation_name)
