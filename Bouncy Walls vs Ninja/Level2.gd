extends Node

var dragging
var drag_start=Vector2()
var dir=Vector2.ZERO
var kunai
var ninja
var goal

func _input(event):
	if event.is_action_pressed("click") and not dragging:
		dragging = true
		drag_start = get_viewport().get_mouse_position()
	if event.is_action_released("click") and dragging:
		dragging=false
		var drag_end=get_viewport().get_mouse_position()
		dir = drag_start - drag_end
		ninja.startAnim()
func _ready():
	kunai=get_node("Kunai")
	ninja=get_node("Ninja")
	goal=get_node("Goal")
	kunai.hide()
	kunai.set_pos(ninja.get_pos())

func nextLevel():
	_ready()

func get_distance(p):
	return sqrt(p.x*p.x+p.y*p.y)

func _process(delta):
	if ninja.getFrame()==5:
		kunai.show()
		kunai.add_forc(Vector2(),dir*2)
	if get_distance(kunai.get_pos()-goal.get_pos())<100:
		nextLevel()
