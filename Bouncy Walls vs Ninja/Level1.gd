extends Node
var dragging
var drag_start=Vector2()
var dir=Vector2.ZERO
var kunai=[]
var ninja
var goal
var arrow
var launch
var knivesCount
var kunai_icon
var knivesIcon=[]
var maxLevels=11

func saveMusicDat():
	var sav=File.new()
	sav.open("user://fsa.save",File.WRITE)
	sav.store_float(get_node("Music").get_playback_position())
	sav.close()
	
func loadMusicDat():
	var lod=File.new()
	lod.open("user://fsa.save",File.READ)
	get_node("Music").play(lod.get_float())
	lod.close()

func _input(event):
	if event.is_action_pressed("click") and not dragging:
		dragging = true
		drag_start = get_viewport().get_mouse_position()
		get_node("touchpoint").position=drag_start
	if dragging == true:
		arrow.show()
		get_node("touchpoint").show()
		get_node("touchpoint2").show()
		get_node("touchpoint2").position=get_viewport().get_mouse_position()
		var drag_end=get_viewport().get_mouse_position()
		dir = drag_start - drag_end
		arrow.set_rotation(dir)
		arrow.set_Length(get_distance(dir))
	if event.is_action_released("click") and dragging:
		dragging=false
		var drag_end=get_viewport().get_mouse_position()
		dir = drag_start - drag_end
		arrow.hide()
		get_node("touchpoint").hide()
		get_node("touchpoint2").hide()
		ninja.startAnim()

func initKnives():
	kunai_icon.hide()
	for i in range(knivesCount):	
		knivesIcon.push_back(get_node("Kunai2").duplicate())
		knivesIcon[i].show()
		knivesIcon[i].position.y = get_viewport().size.y*0.9
		knivesIcon[i].position.x = 20*(i+1)
		add_child(knivesIcon[i])
		
func _ready():
	get_node("touchpoint").hide()
	get_node("touchpoint2").hide()
	get_node("Music").playing=true
	loadMusicDat()
	launch=0
	knivesCount=10
	var screen=get_node(".")
	kunai_icon=get_node("Kunai2")
	ninja=get_node("Ninja")
	goal=get_node("Goal")
	arrow=get_node("Arrow")
	initKnives()
	arrow.hide()
	arrow.set_pos(ninja.get_pos())
	get_node("Kunai").noGrav()
	get_node("Kunai").hide()

func nextLevel():
	var currScene=get_tree().get_current_scene().get_name()
	print(currScene)
	saveMusicDat()
	get_tree().change_scene("res://"+str(int(currScene)+1)+".tscn")
	
func endgame():
	get_tree().change_scene("res://GameOver.tscn")

func get_distance(p):
	return sqrt(p.x*p.x+p.y*p.y)

func _process(delta):
	if knivesCount==0:
		for i in range(10-knivesCount):
				kunai[i].hide()
		goal.end()
	if ninja.getFrame()==3 and launch==0 and knivesCount>0:
		kunai.push_back(get_node("Kunai").duplicate())
		kunai[10-knivesCount].show()
		kunai[10-knivesCount].Grav()
		kunai[10-knivesCount].set_pos(ninja.get_pos())
		kunai[10-knivesCount].add_forc(Vector2(),dir*30)
		add_child(kunai[10-knivesCount])
		knivesIcon[knivesCount-1].hide()
		knivesCount-=1
		launch=1
		dir=Vector2.ZERO
	if knivesCount<10:
		for j in range(10-knivesCount):
			if get_distance(kunai[j].get_pos()-goal.get_pos())<goal.getSize():
				for i in range(10-knivesCount):
					kunai[i].hide()
				goal.end()
		if launch==1 and dragging==false and dir!=Vector2.ZERO:
			launch=0
		if goal.retCircleScale()>20:
			if knivesCount==0:
				endgame()
			else:
				if int(get_tree().get_current_scene().get_name()) == maxLevels:
					endgame()
				nextLevel()
	if ninja.frame==9 and ninja.animation=="dead":
		endgame()
