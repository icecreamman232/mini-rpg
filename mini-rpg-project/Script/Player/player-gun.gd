class_name PlayerGun extends Node2D

@export var shoot_point:Node2D
@export var gun_sprite:Sprite2D
var bullet = preload("res://Scene/player_bullet.tscn")

const left_pos = Vector2(-5,-6)
const right_pos = Vector2(5,-6)

const left_shoot_pts_pos = Vector2(-7,-4)
const right_shoot_pts_pos = Vector2(7,-4)

var is_player_face_right:bool
var mousePos:Vector2

func _process(_delta: float) -> void:
	mousePos = get_global_mouse_position()
	gun_sprite.look_at(mousePos)
	if !is_player_face_right:
		gun_sprite.rotation_degrees += 180
	gun_sprite.rotation_degrees = wrap(gun_sprite.rotation_degrees,0,360)

	if Input.is_action_just_pressed("fire"):
		_shoot()

func flip_gun(is_face_right:bool):
	gun_sprite.flip_h = is_face_right
	is_player_face_right = is_face_right

	#Ternary logic syntax
	position = right_pos if is_face_right else left_pos
	shoot_point.position = right_shoot_pts_pos if is_face_right else left_shoot_pts_pos

	#Here are the full version of above ternary logic syntax
	#if is_face_right:
		#position = right_pos
	#else:
		#position = left_pos

func _shoot():
	var bullet_instance = bullet.instantiate()
	get_tree().root.add_child(bullet_instance)
	var player_bullet:PlayerBullet = bullet_instance as PlayerBullet
	var direction = (get_local_mouse_position() - position).normalized()
	player_bullet.spawn_bullet(shoot_point.global_position,direction.angle(),direction)
