extends CharacterBody2D

const SPEED = 300.0


func _physics_process(delta):
	velocity = Input.get_vector("left","right","up","down") * SPEED
	move_and_collide(velocity * delta)
