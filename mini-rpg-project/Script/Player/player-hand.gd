class_name PlayerHands extends Node2D

@export var left_hand:Sprite2D
@export var right_hand:Sprite2D


#Connect with signal PLAYER_FLIP in player_movement
func update_hand(is_face_right:bool)->void:
	if is_face_right:
		left_hand.flip_h = true
		right_hand.flip_h = true
	else:
		left_hand.flip_h = false
		right_hand.flip_h = false
