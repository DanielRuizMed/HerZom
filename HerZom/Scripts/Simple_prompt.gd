extends Control

onready var total_puntos = $total_puntos
onready var vida_puntos = $vida_puntos
onready var ataque_puntos = $ataque_puntos
onready var defensa_puntos = $defensa_puntos

var numero

func _ready():
	numero = int($total_puntos.get_text().split(" ")[0])

func _on_Ok_pressed():
	get_tree().change_scene("res://Network_setup.tscn")

func set_text(text) -> void:
	$Label.text = text


func _on_up_vida_pressed():
	if numero > 0 :
		numero -= 1
		total_puntos.text = str(numero) + " puntos"
		$vida_puntos.text = str(int($vida_puntos.get_text()) + 1)


func _on_down_vida_pressed():
	if int($vida_puntos.get_text()) > 0 :
		$vida_puntos.text = str(int($vida_puntos.get_text()) - 1)
		numero += 1
		total_puntos.text = str(numero) + " puntos"


func _on_up_ataque_pressed():
	if numero > 0 :
		numero -= 1
		total_puntos.text = str(numero) + " puntos"
		$ataque_puntos.text = str(int($ataque_puntos.get_text()) + 1)


func _on_down_ataque_pressed():
	if int($ataque_puntos.get_text()) > 0 :
		$ataque_puntos.text = str(int($ataque_puntos.get_text()) - 1)
		numero += 1
		total_puntos.text = str(numero) + " puntos"


func _on_up_defensa_pressed():
	if numero > 0 :
		numero -= 1
		total_puntos.text = str(numero) + " puntos"
		$defensa_puntos.text = str(int($defensa_puntos.get_text()) + 1)


func _on_down_defensa_pressed():
	if int($defensa_puntos.get_text()) > 0 :
		$defensa_puntos.text = str(int($defensa_puntos.get_text()) - 1)
		numero += 1
		total_puntos.text = str(numero) + " puntos"
