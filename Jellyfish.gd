extends StaticBody2D

const LEFT = Vector2(-1, 0);
const SCROLL_SPEED = 1;
const LEFT_LIMIT = -400;


# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _physics_process(delta):
	position += SCROLL_SPEED*LEFT
	if position.x < LEFT_LIMIT:
		queue_free()

