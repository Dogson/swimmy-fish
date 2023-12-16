extends Node2D

const INSTANTIATE_TICK = 70;
const JELLYFISH: PackedScene = preload("res://jellyfish.tscn");

var instantiate_counter = 0;
var score = 0;

var ref_ui

func spawn_jellyfish():
	var offset = randi() % 81 - 40
	var instance = JELLYFISH.instantiate()
	instance.position.y = offset;
	
	add_child(instance)
	
			

# Called when the node enters the scene tree for the first time.
func _ready():
	ref_ui = get_tree().current_scene.get_node('UI');


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _physics_process(delta):
	instantiate_counter += 1
	if instantiate_counter == INSTANTIATE_TICK:
		spawn_jellyfish()
		instantiate_counter = 0
