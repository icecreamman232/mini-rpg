class_name PlayerMovement extends CharacterBody2D

@export var move_direction:Vector2
@export var move_speed:float
@export var anim:AnimatedSprite2D
@export var is_face_left:bool

const idle_anim = "idle"
const run_anim = "run"

func _update_input():
    move_direction = Vector2i.ZERO

    if Input.is_action_pressed("move_down"):
        move_direction.y = 1
    if Input.is_action_pressed("move_up"):
        move_direction.y = -1
    if Input.is_action_pressed("move_left"):
        move_direction.x = -1
    if Input.is_action_pressed("move_right"):
        move_direction.x = 1


func _update_movement(delta:float):
    position += move_direction * delta * move_speed

func _update_anim():
    if move_direction.length() > 0:
        anim.play(run_anim)
    else:
        anim.play(idle_anim)
    
    if move_direction.length() > 0:
        anim.flip_h = move_direction.x > 0
        is_face_left = move_direction.x <= 0

func _process(delta: float) -> void:
    _update_input()
    _update_movement(delta)
    _update_anim()
    
