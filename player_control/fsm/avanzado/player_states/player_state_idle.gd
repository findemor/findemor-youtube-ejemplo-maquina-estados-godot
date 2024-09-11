extends PlayerStateGravityBase


func start():
	player.play_animation(player.animations.idle)

func on_physics_process(delta):	
	player.velocity.x = 0
	
	handle_gravity(delta)
	controlled_node.move_and_slide()
	
	
func on_input(_event):
	# seria mejor usar el parametro _event para obtener la información del evento
	if Input.is_action_pressed("ui_left") or Input.is_action_pressed("ui_right"): 
		state_machine.change_to(player.states.Running)
	elif Input.is_action_just_pressed("ui_up"):  
		state_machine.change_to(player.states.Jumping)
	elif Input.is_action_just_pressed("ui_down"):  
		state_machine.change_to(player.states.Crouched)
