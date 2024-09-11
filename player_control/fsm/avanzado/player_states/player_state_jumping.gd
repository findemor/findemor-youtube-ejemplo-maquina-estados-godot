extends PlayerStateGravityBase

func on_physics_process(delta):	
	player.play_animation(player.animations.jump)
	player.velocity.x = \
		Input.get_axis("ui_left", "ui_right") * player.movement_stats.running_speed		
		
	# si esta en el suelo y esta parado sobre él, podemos darle impulso de salto
	if controlled_node.is_on_floor() and controlled_node.velocity.y >= 0: 
		controlled_node.velocity.y = controlled_node.movement_stats.jump_speed
	# en otro caso, si está bajando, cambiamos al estado de cayendo
	elif controlled_node.velocity.y > 0: state_machine.change_to(player.states.Falling)
	
	handle_gravity(delta)
	controlled_node.move_and_slide()
