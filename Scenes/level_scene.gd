extends Node2D
@onready var wing_container: HBoxContainer = $WingCoontainer
@onready var wing: TextureRect = $WingContainer/Wing
@onready var wing_2: TextureRect = $wingcontainer/Wing2
@onready var wing_3: TextureRect = $wingcontainer/Wing3
@onready var wing_4: TextureRect = $wingcontainer/Wing4
@onready var wing_5: TextureRect = $wingcontainer/Wing5
@onready var level: RichTextLabel = $Level
@onready var timer: RichTextLabel = $Timer

var time

func _ready() -> void:
	await Timer(5.0)  
	if Global.minigames_done < 3:
		Global.minigames_done = Global.minigames_done +1
		get_tree().change_scene_to_file("res://scenes/minigame_" + str(Global.minigames_done) + ".tscn")
	else:
		get_tree().change_scene_to_file("res://scenes/title_screen.tscn")

func _process(delta: float) -> void:
	match Global.lives:
		4:
			wing.hide()
		3:
			wing.hide()
			wing_2.hide()
		2:
			wing.hide()
			wing_2.hide()
			wing_3.hide()
		1:
			wing.hide()
			wing_2.hide()
			wing_3.hide()
			wing_4.hide()
		0:
			wing_container.hide()
	timer.text = str(time)
	level.text = "Level" + str(Global.minigames_done)
func Timer(start_time: float):
	time = start_time
	while time > 0.0: 
		await wait(0.1)
		time -= 0.1
		return
func wait(seconds: float) -> void:
	await get_tree().create_timer(seconds).timeout
