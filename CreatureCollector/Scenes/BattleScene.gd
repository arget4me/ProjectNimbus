extends Node2D

func _ready():
	var monsterList = MonsterDataSingelton.ParseAllMonstersJson("monsterdex")
	for m in monsterList:
		print(m.name)
		print(m.description)
		print(m.health)
		print(m.attack)
		print(m.defence)
		print(m.speed)
		print("\n")
