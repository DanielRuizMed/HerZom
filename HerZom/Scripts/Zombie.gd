extends KinematicBody2D

var puntofinal
var puntoIncial
var hp = 100
export var hp_max = 100
var bullet = load("res://Scenes/Player_bullet.tscn")
var dano = 20
var animacion = "andar"
var velocidad = 300
var accion = 0

onready var timer = $Timer

func _process(delta):
	if hp <= 0:
		hide()
		get_parent().remove_child(self)
		queue_free()
		$Area2D.queue_free()
		$AnimatedSprite.animation = "muerto"
	else:
		puntoIncial = Vector2(self.position.x, self.position.y)
		puntofinal = Vector2(Global.alive_players[randi() % 1].position.x,Global.alive_players[randi() % 1].position.y)
		var vector = (puntofinal - puntoIncial).normalized()
		move_and_collide(vector * velocidad * delta)
	
	if animacion == "atacar" && accion == 0:
		$AnimatedSprite.animation = animacion
		timer.start()
		accion = 1
		
	elif animacion == "dano" && accion == 0:
		$AnimatedSprite.animation = animacion
		timer.start()
		accion = 1
	else:
		$AnimatedSprite.animation = "andar"

func set_hp(new_value):
	hp = new_value

func actualizar_barraVida():
	$HP.value = (hp * $HP.max_value) / hp_max

func _physics_process(delta):
	actualizar_barraVida()

func getPointFinal(x,y):
	puntofinal = Vector2(x,y)

func getPointIncial(x,y):
	puntoIncial = Vector2(x,y)

func _on_Area2D_area_entered(area):
	
	if area.is_in_group("Player_damager"):
		hp -= 20
		
		animacion = "dano"
		velocidad = 0
		if hp <= 0:
			area.get_parent().player.add_contador()
		
		
		area.get_parent().destroy2()
		
	elif area.is_in_group("player"):
		animacion = "atacar"
		area.get_parent().res_hp(dano)
		velocidad = 0
	

func _on_Timer_timeout():
	velocidad = 300
	accion = 0
