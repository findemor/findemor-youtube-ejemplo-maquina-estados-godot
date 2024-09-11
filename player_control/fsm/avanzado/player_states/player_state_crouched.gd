extends PlayerStateGravityBase

const CHISPAS = preload("res://otros/chispas.tscn")
var chispas_instance = null

func start():
	chispas_instance = CHISPAS.instantiate()
	player.add_child(chispas_instance)
	
func end():
	if chispas_instance: chispas_instance.queue_free()	

func on_physics_process(delta):	
	player.play_animation(player.animations.crouch)
	player.velocity = Vector2.ZERO
	
	handle_gravity(delta)
	player.move_and_slide()
	
func on_input(_event):
	# seria mejor usar el parametro _event para obtener la información del evento
	if Input.is_action_just_released("ui_down"): 
		state_machine.change_to(player.states.Idle)
