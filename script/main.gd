extends Node2D

signal game_waited
signal game_started

var score: int = 0
var bot_score: int = 0

@onready var score_label: RichTextLabel = $HUD/ScoreLabel
@onready var countdown_label: RichTextLabel = $HUD/CountdownLabel
@onready var ball: CharacterBody2D = $Ball


func _ready() -> void:
	game_waited.emit()
	update_score()
	countdown_label.text = "[rainbow]3"
	await get_tree().create_timer(1).timeout
	countdown_label.text = "[rainbow]2"
	await get_tree().create_timer(1).timeout
	countdown_label.text = "[rainbow]1"
	await get_tree().create_timer(1).timeout
	countdown_label.text = "[rainbow]VAI"
	await get_tree().create_timer(0.4).timeout
	countdown_label.hide()


func _on_goal_left_body_entered(body: Node2D) -> void:
	body.reset()
	bot_score += 1
	update_score()
	
	
func _on_goal_right_body_entered(body: Node2D) -> void:
	body.reset()
	score += 1
	update_score()


func update_score() -> void:
	score_label.text = str(" [wave] " ,score, "/" , bot_score)
	
