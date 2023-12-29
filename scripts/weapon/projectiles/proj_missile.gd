extends Projectile
onready var mesh = $missile
onready var my_fx: PackedScene = preload("res://FX/boom_rl.tscn")
onready var god = get_tree().get_root().get_node("Spatial")

var player: Player
export var splash_kb = 12000.0
export var splash_range = 16.0

# Called when the node enters the scene tree for the first time.
func _ready():
	pass
	#yield(get_tree(),"idle_frame")
	#queue_free()
	

func impact():
	var shpee = my_fx.instance()
	god.add_child(shpee)
	shpee.global_translation = global_translation 
	splash(player)

# Called every frame. 'delta' is the elapsed time since the previous frame.
#func _process(delta):
#	pass


func splash(target: Spatial):
	target = god.player
	var shpee = global_translation.distance_to(target.global_translation)
	if shpee < splash_range: 
		var owo: Vector3 = target.global_translation
		var pwnage = (1.5 - (shpee / splash_range))*.666
		var owning = splash_kb * pwnage
		target.push(owning, global_translation.direction_to(owo), 200)
	queue_free()




