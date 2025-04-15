class_name PlayerMovement extends CharacterBody2D

enum MOVING_STATE {IDLE, MOVING}

@export var move_direction:Vector2
@export var move_speed:float
@export var moving_state:MOVING_STATE

const cell_size:float = 16
var next_pos:Vector2
var prev_pos:Vector2
var lerpValue:float

func _update_input():

    if moving_state == MOVING_STATE.MOVING: return

    move_direction = Vector2i.ZERO

    if Input.is_action_pressed("move_down"):
        move_direction.y = 1
    elif Input.is_action_pressed("move_up"):
        move_direction.y = -1
    elif Input.is_action_pressed("move_left"):
        move_direction.x = -1
    elif Input.is_action_pressed("move_right"):
        move_direction.x = 1

    if move_direction.length() > 0:
        moving_state = MOVING_STATE.MOVING
        next_pos = position + move_direction * cell_size
        prev_pos = position

func _update_movment(delta:float):

    if moving_state == MOVING_STATE.IDLE: return

    if lerpValue <1:
        position = lerp(prev_pos,next_pos,lerpValue)
        lerpValue += move_speed * delta
    else:
        move_direction = Vector2.ZERO
        moving_state = MOVING_STATE.IDLE
        lerpValue = 0

func _process(delta: float) -> void:
    _update_input()
    _update_movment(delta)
    
