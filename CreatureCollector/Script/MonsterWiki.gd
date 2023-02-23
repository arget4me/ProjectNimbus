extends CanvasLayer

onready var monsterName = $MarginContainer/Panel/Name
onready var monsterDescription = $MarginContainer/Panel/Description
onready var monsterHealth = $MarginContainer/Panel/Health
onready var monsterAttack = $MarginContainer/Panel/Attack
onready var monsterDefence = $MarginContainer/Panel/Defence
onready var monsterSpeed = $MarginContainer/Panel/Speed
onready var monsterImage = $MarginContainer/Panel/MonsterImage
var monsterList
var monsterCounter

func _ready():
	monsterCounter = 0
	monsterList = MonsterDataSingelton.ParseAllMonstersJson("monsterdex")
	setMonster(monsterList[monsterCounter])

func findMonsterImage(var monsterName) -> String:
	var imageDirectory = Directory.new()
	if imageDirectory.open("res://Images/monsters") == OK:
		imageDirectory.list_dir_begin()
		var file_name = imageDirectory.get_next()
		while file_name != "":
			if file_name == (monsterName.to_lower() + ".png"):
				return "res://Images/monsters/" + monsterName.to_lower() + ".png"
			else:
				file_name = imageDirectory.get_next()
	
	return "res://Images/monsters/unkownmonster.png"

func setMonster(var monster):
	monsterName.text = monster.name
	monsterDescription.text = monster.description
	monsterHealth.text = "Health:" + str(monster.health)
	monsterAttack.text = "Attack:" + str(monster.attack)
	monsterDefence.text = "Defence:" + str(monster.defence)
	monsterSpeed.text = "Speed:" + str(monster.speed)
	monsterImage.texture = load(findMonsterImage(monster.name))
	if(monsterImage.texture):
		monsterImage.scale = (Vector2(300,300))/(monsterImage.texture.get_size())

func _on_Previous_pressed():
	monsterCounter -= 1
	monsterCounter %= monsterList.size()
	setMonster(monsterList[monsterCounter])


func _on_Next_pressed():
	monsterCounter += 1
	monsterCounter %= monsterList.size()
	setMonster(monsterList[monsterCounter])
