extends Weapon

onready var animation_player = $AnimationPlayer
onready var my_proj: PackedScene = preload("res://weapons/projectiles/proj_missile.tscn")
onready var god = get_tree().get_root().get_node("Spatial")
# Declare member variables here. Examples:
# var a = 2
# var b = "text"


# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.

func shoot(dir: Vector3, from: Vector3):
	animation_player.play("shoot")
	var pew = my_proj.instance()
	god.add_child(pew)
	pew.global_translation = from
	pew.look_at(from + dir, Vector3.UP)
	pew.velocity = dir * shot_speed
	#pew.player = god.player
	
# Called every frame. 'delta' is the elapsed time since the previous frame.
#func _process(delta):
#	pass
