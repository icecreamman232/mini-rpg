class_name PlayerGun extends Node2D



@export var gun_sprite:Sprite2D
const left_pos = Vector2(-5,-6)
const right_pos = Vector2(5,-6)
var is_player_face_right:bool
var mousePos:Vector2

func _process(delta: float) -> void:
    if is_player_face_right:
        mousePos = get_global_mouse_position()
        gun_sprite.look_at(mousePos)
    else:
        mousePos = get_global_mouse_position()
        gun_sprite.look_at(mousePos.rotated(deg_to_rad(180)))
    
    

    queue_redraw()

func flip_gun(is_face_right:bool):
    gun_sprite.flip_h = is_face_right
    is_player_face_right = is_face_right

    #Ternary logic syntax
    position = right_pos if is_face_right else left_pos

    #Here are the full version of above ternary logic syntax
    #if is_face_right:
        #position = right_pos
    #else:
        #position = left_pos

func _draw() -> void:
    draw_line(gun_sprite.position,mousePos,Color.RED, 2)     

