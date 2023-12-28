extends Control

export var spd_color1 : Color
export var spd_color2 : Color
export var spd_color3 : Color
export var spd_color4 : Color

onready var player = $"../../.."
onready var text_speed = $TextSpeed

onready var spd_needle = $speed/needle
onready var spd_bg = $speed/bg
onready var spd_rim = $speed/rim

var needle_angle : int

# Declare member variables here. Examples:
# var a = 2
# var b = "text"


# Called when the node enters the scene tree for the first time.
func _ready():
	needle_angle = spd_needle.rotation_degrees


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	var vel : int = round(player.velocity.length())
	
	text_speed.bbcode_text = "[center]" + str(vel) + "[/center]"
	spd_needle.rotation_degrees = (needle_angle + vel) % 360
	
	if vel < 100:
		spd_needle.modulate = spd_color1.linear_interpolate(spd_color2, vel*.01)
	elif vel < 200:
		spd_needle.modulate = spd_color2.linear_interpolate(spd_color3, (vel-100)*.01)
	elif vel < 300:
		spd_needle.modulate = spd_color3.linear_interpolate(spd_color4, (vel-200)*.01)
	else:
		spd_needle.modulate = spd_color4
	
	
	
	
	
	
	
	
