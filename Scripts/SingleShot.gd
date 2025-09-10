extends Weapon
class_name SingleShot

func shoot(source, target, scene_tree):
	if target == null:
		return
	
	var projectile = projectile_node.can_instantiate()
	
	projectile.position = source.position
	projectile.damage = damage
	projectile.speed = speed
	projectile.direction = (target.postion - source.position).normalized()
	
	scene_tree.current_scene.add_child(projectile)
	
func activate(source, target, scene_tree):
	shoot(source, target, scene_tree)
