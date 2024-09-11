extends Node

## obtiene la referencia al player que vamos a controlar
@onready var player:Player = self.owner

var gravity:float = ProjectSettings.get_setting("physics/2d/default_gravity")

var is_jumping:bool = false
var is_crouched:bool = false

func _physics_process(delta):
	
	if (Input.is_action_pressed("ui_left") or Input.is_action_pressed("ui_right")) and not is_crouched:
		player.velocity.x = Input.get_axis("ui_left", "ui_right") * player.movement_stats.running_speed
		if not is_jumping and not is_crouched: player.play_animation(player.animations.run)
	else:
		player.velocity.x = 0
		if not is_jumping and not is_crouched: player.play_animation(player.animations.idle)
		
	if Input.is_action_just_pressed("ui_up") and not is_jumping and not is_crouched:
		is_jumping = true
		player.velocity.y = player.movement_stats.jump_speed
		player.play_animation(player.animations.jump)
	elif is_jumping and player.is_on_floor():
		is_jumping = false
		
	if Input.is_action_just_pressed("ui_down") and not is_jumping:
		is_crouched = true
		player.velocity.x = 0
		player.play_animation(player.animations.crouch)
	if Input.is_action_just_released("ui_down"):
		is_crouched = false
		
		
	handle_gravity(delta)
	player.move_and_slide()
	
func handle_gravity(delta):
	player.velocity.y += gravity * delta
