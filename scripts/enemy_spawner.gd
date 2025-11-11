extends Node2D

var player_node
var enemy_spawn_node

@export var enemy_scene: PackedScene

# max enemies
@export var max_enemies = 200
 
# starting interval
@export var spawn_interval = 2.0

# interval acceleration
@export var interval_acceleration = 0.98

# enemy scale
@export var enemy_scale = 1.0
# scale growth
@export var scale_acceleration = 1.01

# cooldown
@export var cooldown = 0.0

func spawn_enemy() -> void:
	var enemy = enemy_scene.instantiate()
	enemy.position = player_node.position + Vector2(100,0)
	enemy_spawn_node.add_child(enemy)

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	enemy_spawn_node = get_node('../../Enemies')
	player_node = get_node('../../Player')
	# spawn enemies at the start
	spawn_enemy()

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	cooldown += delta
	if (cooldown > spawn_interval):
		cooldown = cooldown - spawn_interval
		spawn_interval = spawn_interval * interval_acceleration
		# spawn some enemies
		spawn_enemy()
		
		# update the scalar
		enemy_scale = enemy_scale * scale_acceleration
