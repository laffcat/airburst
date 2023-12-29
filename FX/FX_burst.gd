extends Spatial

onready var sprite = $Sprite

export var fps : int

var frames : int
var counter := 0
var clock := -1.0

func _ready():
	frames = sprite.hframes
	if randi() % 2: sprite.scale.x = -1.0
	if randi() % 2: sprite.scale.y = -1.0
	
func _process(delta):
	clock += delta*fps
	if clock >= counter:
		counter += 1
		if counter == frames: queue_free()
		sprite.frame += 1







