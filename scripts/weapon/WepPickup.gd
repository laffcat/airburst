extends Spatial

export var my_weapon : PackedScene

# Declare member variables here. Examples:
# var a = 2
# var b = "text"


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	$Spinerooni.rotate_y(delta * .4)


func _on_Area_body_entered(body):
	if body is Player:
		body.wep_equip(my_weapon.instance())
		queue_free()
