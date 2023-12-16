extends Node2D

var scoreText: RichTextLabel
var gameOverText: RichTextLabel
var gameOverScreen
var isGameOver = false

func change_score(score: int):
	scoreText.clear();
	scoreText.add_text(str(score))
	
func game_over(score):
	if isGameOver:
		return;
	isGameOver = true
	gameOverText.add_text(str(score))
	gameOverScreen.show()
	scoreText.hide()
	

# Called when the node enters the scene tree for the first time.
func _ready():
	scoreText = $Score
	gameOverScreen = $GameOverScreen
	gameOverText = $GameOverScreen/GameOverText

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	print(scoreText.get_parsed_text())


func _on_button_button_down():
	get_tree().reload_current_scene()
