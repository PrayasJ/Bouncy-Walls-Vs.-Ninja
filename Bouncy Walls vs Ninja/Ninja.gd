extends AnimatedSprite

# Declare member variables here. Examples:
# var a = 2
# var b = "text"
func getSize():
	return scale.x*frames.get_frame("NinjaThrow",0).get_height()
# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.
func get_pos():
	return position
func startAnim():
	playing=true
	speed_scale=3
	
func kill():
	animation="dead"
	startAnim()

func reborn():
	animation="NinjaThrow"
	stopAnim()

func stopAnim():
	playing=false
	frame=0

func getFrame():
	return frame
# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	if animation=="dead" and frame==9:
		reborn()
	if frame==9:
		stopAnim()
#	pass
