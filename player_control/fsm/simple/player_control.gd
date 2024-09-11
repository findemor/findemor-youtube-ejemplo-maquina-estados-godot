extends Node

## obtiene la referencia al player que vamos a controlar
@onready var player:Player = self.owner

var gravity:float = ProjectSettings.get_setting("physics/2d/default_gravity")

enum STATE {
	IDLE,
	RUNNING,
	JUMPING,
	FALLING,
	CROUCHED
}

var current_state:STATE = STATE.IDLE


func _input(event):
	match current_state:
		STATE.IDLE:			
			if Input.is_action_pressed("ui_left") or Input.is_action_pressed("ui_right"): current_state = STATE.RUNNING
			elif Input.is_action_just_pressed("ui_up"): current_state = STATE.JUMPING
			elif Input.is_action_just_pressed("ui_down"): current_state = STATE.CROUCHED
		STATE.RUNNING:			
			if Input.is_action_just_pressed("ui_up"): current_state = STATE.JUMPING
			elif Input.is_action_just_pressed("ui_down"): current_state = STATE.CROUCHED
			elif not Input.is_action_pressed("ui_left") and not Input.is_action_pressed("ui_right"): current_state = STATE.IDLE
		STATE.JUMPING:
			pass
		STATE.FALLING:
			pass
		STATE.CROUCHED:			
			if Input.is_action_just_released("ui_down"): current_state = STATE.IDLE

func _physics_process(delta):	
	match current_state:
		STATE.IDLE:
			player.play_animation(player.animations.idle)
			player.velocity.x = 0			
		STATE.RUNNING:
			player.play_animation(player.animations.run)
			player.velocity.x = Input.get_axis("ui_left", "ui_right") * player.movement_stats.running_speed
		STATE.JUMPING:
			player.play_animation(player.animations.jump)
			player.velocity.x = Input.get_axis("ui_left", "ui_right") * player.movement_stats.running_speed		
			if player.is_on_floor() and player.velocity.y >= 0: 
				player.velocity.y = player.movement_stats.jump_speed
			if player.velocity.y > 0: current_state = STATE.FALLING
		STATE.FALLING:
			player.velocity.x = Input.get_axis("ui_left", "ui_right") * player.movement_stats.running_speed			
			if player.velocity.y >= 0 and player.is_on_floor(): current_state = STATE.IDLE	
		STATE.CROUCHED:
			player.play_animation(player.animations.crouch)
			player.velocity = Vector2.ZERO
			
	handle_gravity(delta)
	player.move_and_slide()
	
func handle_gravity(delta):
	player.velocity.y += gravity * delta
