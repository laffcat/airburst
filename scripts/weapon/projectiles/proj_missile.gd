extends Projectile
onready var mesh = $missile

var player: Player
onready var god = get_tree().get_root().get_node("Spatial")
export var splash_kb = 200.0
export var splash_range = 20.0
# Declare member variables here. Examples:
# var a = 2
# var b = "text"


# Called when the node enters the scene tree for the first time.
func _ready():
	pass
	splash(player)
	yield(get_tree(),"idle_frame")
	queue_free()
	

func impact():
	mesh.queue_free()

# Called every frame. 'delta' is the elapsed time since the previous frame.
#func _process(delta):
#	pass


func splash(target: Spatial):
	target = god.player
	var shpee = global_translation.distance_to(target.global_translation)
	if shpee < splash_range: 
		var owo: Vector3 = target.global_translation
		var pwnage = shpee / splash_range
		var owning = splash_kb * pwnage
		target.push(owning, global_translation.direction_to(owo), owning)




