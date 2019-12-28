extends RigidBody2D

func noGrav():
	gravity_scale=0

func Grav():
	gravity_scale=3

func no_mass():
	gravity_scale=0

func _ready():
	pass

func bounce_x():
	linear_velocity.x*=-0.7

func bounce_y():
	linear_velocity.y*=-0.7


func add_forc(off,f):
	apply_impulse(off,f)
	
func set_pos(pos):
	position=pos
	
func apply_drag():
	mass=mass*1.0001

func getAbsVelocity():
	return sqrt(linear_velocity.x*linear_velocity.x+linear_velocity.y*linear_velocity.y)

func get_pos():
	return position
# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	apply_drag()
	if position.x>100 and getAbsVelocity()<5:
		linear_velocity=Vector2.ZERO
	if linear_velocity.y!=0:
		rotation=-atan2(-linear_velocity.x,-linear_velocity.y)
	#set_velocity(delta)
#func _physics_process(delta):
	