class_name PlayerStateBase extends StateBase

var player:Player:
	set (value):
		controlled_node = value
	get:
		return controlled_node
