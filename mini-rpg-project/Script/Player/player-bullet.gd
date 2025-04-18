class_name PlayerBullet extends Node2D

@export var speed:float
@export var direction:Vector2
@export var sprite:Sprite2D

func spawn_bullet(spawnPos:Vector2, spawnRotation:float, spawnDirection:Vector2):
    print("SpawnPos"+ str(spawnPos))
    position = spawnPos
    direction = spawnDirection
    sprite.rotation = spawnRotation

func _process(delta: float) -> void:
    position += speed * direction * delta

func _on_visible_on_screen_notifier_2d_screen_exited() -> void:
    queue_free()
