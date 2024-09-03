extends Node2D

var player
var tiles


# Called when the node enters the scene tree for the first time.
func _ready():
	spawn_player()


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	pass
	
func _input(event):
	event_handler(event)


func event_handler(event):
	if event is InputEventKey:
		if event.pressed:
			if event.keycode == KEY_ESCAPE:
				get_tree().quit()				

func spawn_player():
	var player_scn = preload("res://player_scene.tscn")
	player = player_scn.instantiate()
	$".".add_child(player)
	



	
