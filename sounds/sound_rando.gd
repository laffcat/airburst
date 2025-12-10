extends Node

export var three_dee := false
export var once := false

export var vol := 0.0

export var pitch_min := .9
export var pitch_max := 1.1

var active_sounds : Array = []
var last_sound : Node


func _ready():
	active_sounds = get_children()
	
func play():
	var shpee := randi() % active_sounds.size()
	var sfx : Node = active_sounds[shpee]
	if three_dee:
		sfx.unit_db = vol
	else:
		sfx.volume_db = vol
	sfx.pitch_scale = pitch_min + fmod(randf(), pitch_max - pitch_min)
	sfx.play()
	if once: return
	if last_sound:
		active_sounds[shpee] = last_sound
		last_sound = sfx
	else:
		last_sound = active_sounds.pop_at(shpee)
	
