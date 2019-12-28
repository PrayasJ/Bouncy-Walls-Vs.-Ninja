extends Node

var _playPos = null

func changeScene(next_scene,playPos=null):
	_playPos=playPos
	get_tree().change_scene(next_scene)

func getVal(name):
	if _playPos!=null:
		return _playPos[name]
	return null