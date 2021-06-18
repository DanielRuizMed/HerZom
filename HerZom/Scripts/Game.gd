extends Node2D

var current_spawn_location_instance_number = 1
var current_player_for_spawn_location_number = null

func _ready() -> void:
	get_tree().connect("network_peer_disconnected", self, "_player_disconnected")
	
	if get_tree().is_network_server():
		setup_players_positions()

func setup_players_positions() -> void:
	for player in Persistent_nodes.get_children():
		if player.is_in_group("Player"):
			for spawn_location in $Spawn_locations.get_children():
				if int(spawn_location.name) == current_spawn_location_instance_number and current_player_for_spawn_location_number != player:
					player.rpc("update_position", spawn_location.global_position)
					player.rpc("initial_position", spawn_location.global_position)
					current_spawn_location_instance_number += 1
					current_player_for_spawn_location_number = player

func _player_disconnected(id) -> void:
	if Persistent_nodes.has_node(str(id)):
		Persistent_nodes.get_node(str(id)).username_text_instance.queue_free()
		Persistent_nodes.get_node(str(id)).queue_free()

var numero_enemigos = 10
var enemy = load("res://Scenes/Zombie.tscn").instance()

func _on_Timer_timeout():
	var duplicado = enemy.duplicate()
	#duplicado.getPointFinal($Spawn_enemys/Position2D4.position.x, $Spawn_enemys/Position2D4.position.y);
	duplicado.getPointIncial($Spawn_enemys/Position2D.position.x, $Spawn_enemys/Position2D.position.y);
	duplicado.position.x = $Spawn_enemys/Position2D.position.x
	duplicado.position.y = $Spawn_enemys/Position2D.position.y
	
	add_child(duplicado)
