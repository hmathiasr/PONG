extends CharacterBody2D

var speed = 400
var direction = Vector2(-1, -1).normalized()


func _physics_process(delta: float) -> void:
	velocity = speed * direction
	move_and_slide()
	
	if get_last_slide_collision() != null:
		var normal = get_last_slide_collision(). get_normal()
		direction = direction.bounce(normal)

func reset() -> void:
	global_position = Vector2(588, 300)
	speed = 0
	await get_tree().create_timer(0.6).timeout


func _on_main_game_started() -> void:
	speed = 400
	 # Replace with function body.


func _on_main_game_waited() -> void:
	speed = 0 # Replace with function body.
