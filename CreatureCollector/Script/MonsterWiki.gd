extends CanvasLayer

onready var monsterName = $MarginContainer/Panel/Name
onready var monsterDescription = $MarginContainer/Panel/Description
onready var monsterHealth = $MarginContainer/Panel/Health
onready var monsterAttack = $MarginContainer/Panel/Attack
onready var monsterDefence = $MarginContainer/Panel/Defence
onready var monsterSpeed = $MarginContainer/Panel/Speed
var monsterList
var monsterCounter

func _ready():
	monsterCounter = 0
	monsterList = MonsterDataSingelton.ParseAllMonstersJson("monsterdex")
	setMonster(monsterList[monsterCounter])

func setMonster(var monster):
	monsterName.text = monster.name
	monsterDescription.text = monster.description
	monsterHealth.text = "Health:" + str(monster.health)
	monsterAttack.text = "Attack:" + str(monster.attack)
	monsterDefence.text = "Defence:" + str(monster.defence)
	monsterSpeed.text = "Speed:" + str(monster.speed)

func _on_Previous_pressed():
	monsterCounter -= 1
	monsterCounter %= monsterList.size()
	setMonster(monsterList[monsterCounter])


func _on_Next_pressed():
	monsterCounter += 1
	monsterCounter %= monsterList.size()
	setMonster(monsterList[monsterCounter])
