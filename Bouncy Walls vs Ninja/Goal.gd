extends Sprite

func getSize():
	return scale.x*texture.get_size().x/2

var flag=0

func end():
	flag=1

func retCircleScale():
	return get_node("circle-512").scale.x

func get_pos():
	return position
# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	rotate(0.01)
	if flag==0:
		if get_node("circle-512").scale.x>0.2:
			get_node("circle-512").scale-=Vector2(0.2,0.2)
		elif get_node("circle-512").visible==true:
			get_node("circle-512").hide()
	else:
		get_node("circle-512").show()
		get_node("circle-512").scale+=Vector2(0.2,0.2)
#	pass
