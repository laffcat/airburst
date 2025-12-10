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
	$SoundShoot.play()
	animation_player.play("shoot")
	var pew = my_proj.instance()
	god.add_child(pew)
	pew.global_translation = from
	pew.look_at(from + dir, Vector3.UP)
	pew.velocity = dir * pew.shot_speed
	pew.player = god.player
	god.player.atk1_able = false
	yield(get_tree().create_timer(0.8),"timeout")
	god.player.atk1_able = true
	
# Called every frame. 'delta' is the elapsed time since the previous frame.
#func _process(delta):
#	pass
