extends Node

# Declare member variables here. Examples:
# var a = 2
# var b = "text"

# Called when the node enters the scene tree for the first time.
func _ready():
	get_node("Music").playing=true
	pass # Replace with function body.

# Called every frame. 'delta' is the elapsed time since the previous frame.
#func _process(delta):
#	pass

func saveMusicDat():
	var sav=File.new()
	sav.open("user://fsa.save",File.WRITE)
	sav.store_float(get_node("Music").get_playback_position())
	sav.close()

func _on_Button_pressed():
	saveMusicDat()
	get_tree().change_scene("res://1.tscn")
	pass # Replace with function body.


func _on_credits_pressed():
	get_node("Creditbox").show()
	get_node("Creditbox").position=get_viewport().size/2
	get_node("Creditbox").scale=Vector2(0.5,0.5)
	pass # Replace with function body.


func _on_exit_pressed():
	get_tree().quit()
	pass # Replace with function body.


func _on_tutorial_pressed():
	get_node("Creditbox2").show()
	get_node("Creditbox2").position=get_viewport().size/2
	get_node("Creditbox2").scale=Vector2(0.7,0.5)
	pass # Replace with function body.
