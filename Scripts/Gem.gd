extends Pickups
class_name Gem

@export var XP : float

func activate():
	super.activate()
	prints("+" + "XP")
	player_reference.gain_XP(XP)
