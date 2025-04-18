class_name PlayerMovement extends CharacterBody2D

@export var move_direction:Vector2
@export var move_speed:float
@export var anim:AnimatedSprite2D
@export var is_face_right:bool

const idle_anim = "idle"
const run_anim = "run"

signal PLAYER_FLIP

func _update_input():
	move_direction = Input.get_vector("move_left","move_right","move_up","move_down")
	move_direction.normalized()

func _update_movement(delta:float):
	position += move_direction * delta * move_speed

func _update_anim():
	if move_direction.length() > 0:
		anim.play(run_anim)
	else:
		anim.play(idle_anim)
	

func _flip_player():
	var mousePos = get_global_mouse_position()
	var angle = rad_to_deg(position.angle_to_point(mousePos))
	
	is_face_right = (angle < 90 && angle > -90)

	anim.flip_h = is_face_right
	
	PLAYER_FLIP.emit(is_face_right)

func _process(delta: float) -> void:
	_update_input()
	_update_movement(delta)
	_flip_player()
	_update_anim()
	
