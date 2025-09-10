extends Area2D

var direction: Vector2
var speed: float = 175

@export var type: Pickups

var _player_reference: CharacterBody2D
@export var player_reference: CharacterBody2D:
	set(value):
		_player_reference = value
		if type:
			type.player_reference = value

var can_follow: bool = false

func _ready():
	$Sprite2D.texture = type.icon

func _physics_process(delta):
	if _player_reference and can_follow:
		direction = (_player_reference.position - position).normalized()
		position += direction * speed * delta

func follow(_target: CharacterBody2D):
	can_follow = true


func _on_body_entered(body: Node2D) -> void:
	type.activate()
	queue_free()
