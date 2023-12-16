extends CharacterBody2D


const FLAP: int = 100;
const UP_VECTOR: Vector2 = Vector2(0, -1);
const MAX_FALL_SPEED: int = 100;
const GRAVITY_ACC: int = 4;
var motion: Vector2 = Vector2();
var ref_ui;
signal increment_score()
var score;
const ROTATION_MAX = 1.5;
const ROTATION_MIN = -1.5;


func swim_up():
	motion+=UP_VECTOR*FLAP

# Called when the node enters the scene tree for the first time.
func _ready():
	ref_ui = get_parent().get_parent().get_node('UI')	
	score = 0;


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	pass

func _physics_process(delta):
	print(get_rotation())
	motion.y += GRAVITY_ACC
	if motion.y > MAX_FALL_SPEED:
		motion.y = MAX_FALL_SPEED
	
	if Input.is_action_just_pressed("Flap"):
		swim_up()
	
#	velocity is the variable attached to the CharacterBody2D. 
#	It represents... well, its velocity
	velocity = motion
	
	if motion.y > 0 && get_rotation() < ROTATION_MAX:
		rotate(0.02)
	elif motion.y < 0 && get_rotation() > ROTATION_MIN:
		rotate(-0.02)
	
#	move_and_slide apply the current velocity to the CharacterBody2D to show its new position
#	if the CB2D collides with anything or whatnot, its velocity will be dynamically changed
	move_and_slide()
	
#	we then apply the new velocity to our motion value 
	motion = velocity



func _on_detect_area_entered(area):
	if area.name == "CheckpointArea2D":
		score+=1
		ref_ui.change_score(score)


func _on_detect_body_entered(body):
	if body.name == "Jellyfish":
		ref_ui.game_over(score)
		


func _on_detect_area_exited(area):
	if area.name == "CameraBox":
		ref_ui.game_over(score)
