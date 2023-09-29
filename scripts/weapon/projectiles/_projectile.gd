class_name Projectile
extends KinematicBody


#export var direction: Vector3
export var velocity: Vector3
#export var speed: float

# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.

func _physics_process(delta):
	
	var collision = move_and_collide(velocity * delta)
	if collision:
		impact()

func impact():
	queue_free()
# Called every frame. 'delta' is the elapsed time since the previous frame.
#func _process(delta):
#	pass
