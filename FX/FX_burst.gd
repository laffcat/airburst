extends Spatial

onready var sprite = $Sprite
onready var mesh = $boom3d/Mesh

export var fps : int

var frames : int
var counter := 0
var clock := -1.0

var active = true

func _ready():
	$boom3d/Mesh.mesh = $boom3d/Mesh.mesh.duplicate()
	frames = sprite.hframes
	if randi() % 2: sprite.flip_h = true
	if randi() % 2: sprite.flip_v = true
	mesh.global_rotation.x = randi() % 359
	mesh.global_rotation.y = randi() % 359
	mesh.global_rotation.z = randi() % 359
	yield(get_tree(), "idle_frame")
	$SoundBoom.play()
	
func _process(delta):
	if active:
		clock += delta*fps
		if clock >= counter:
			counter += 1
			if counter == frames: 
				sprite.queue_free()
				active = false
				return
			sprite.frame += 1







