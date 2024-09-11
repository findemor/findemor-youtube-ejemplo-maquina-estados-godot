extends PlayerStateGravityBase

func on_physics_process(delta):	
	controlled_node.play_animation(controlled_node.animations.run)
	controlled_node.velocity.x = Input.get_axis("ui_left", "ui_right") * controlled_node.movement_stats.running_speed
	
	handle_gravity(delta)
	controlled_node.move_and_slide()

func on_input(_event):
	# seria mejor usar el parametro _event para obtener la información del evento
	if Input.is_action_just_pressed("ui_up"): 
		state_machine.change_to(player.states.Jumping)
	elif Input.is_action_just_pressed("ui_down"): 
		state_machine.change_to(player.states.Crouched)
	elif not Input.is_action_pressed("ui_left") and not Input.is_action_pressed("ui_right"): 
		state_machine.change_to(player.states.Idle)
