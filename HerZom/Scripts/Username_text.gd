extends Node2D

var player_following = null
var text = "" setget text_set
var hp = 100
var muertes

onready var label = $Label
onready var label2 = $Muertes

func _process(_delta: float) -> void:
	if player_following != null:
		global_position = player_following.global_position

func text_set(new_text) -> void:
	text = new_text
	label.text = text
	
func hp_set(new_hp) -> void:
	hp = new_hp
	$HP.value = hp

func actualizar_barraVida():
	$HP.value = hp

func muertes_set(new_muertes) -> void:
	muertes = new_muertes
	label2.text = str(muertes)

func update_position(player):
	player_following = player
	global_position = player.global_position
