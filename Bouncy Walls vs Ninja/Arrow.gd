extends Node2D
var defaultscale=0.125

func set_rotation(pos):
	var ang=-atan2(-pos.y,pos.x)
	rotation=ang

func set_Length(leng):
	get_node("line").scale.x=leng*defaultscale/200
	get_node("arrowhead").position.x=get_node("line").scale.x*get_node("line").texture.get_width()
# Declare member variables here. Examples:
# var a = 2
# var b = "text"
func set_pos(pos):
	position=pos
# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.

# Called every frame. 'delta' is the elapsed time since the previous frame.
#func _process(delta):
#	pass
