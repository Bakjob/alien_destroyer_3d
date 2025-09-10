extends CharacterBody2D

const SPEED = 300.0
var health : float = 100:
	set(value):
		health = value
		%Health.value = value


var nearest_enemy : CharacterBody2D
var nearest_enemy_distance : float = INF 

var XP : int = 0:
	set(value):
		XP = value
		%XP.value = value
var total_XP : int = 0
var level : int = 1:
	set(value):
		level = value
		%Level.text = "Lv" + str(value)
		
		if level >= 3:
			%XP.max_value = 20
		elif level >= 7:
			%XP.max_value = 40

func _physics_process(delta):
	if is_instance_valid(nearest_enemy):
		nearest_enemy_distance = nearest_enemy.separation
		print(nearest_enemy.name)
	else:
		nearest_enemy_distance =INF
	
	
	velocity = Input.get_vector("left","right","up","down") * SPEED
	move_and_collide(velocity * delta)
	check_XP()

func take_damage(amount):
	health -= amount
	print(amount)


func _on_self_damage_body_entered(body: Node2D) -> void:
	take_damage(body.damage)


func _on_timer_timeout() -> void:
	%Collision.set_deferred("disabled", true)
	%Collision.set_deferred("disabled", false)

func gain_XP(amount):
	XP += amount
	total_XP += amount

func check_XP():
	if XP > %XP.max_value:
		XP -= %XP.max_value
		level += 1
