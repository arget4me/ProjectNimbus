extends Node

enum MONSTER_TYPE { Fire, Nature, Water }

class MonsterData:
	var name : String
	var description : String
	var type : int
	var health : int
	var attack : int
	var defence : int
	var speed : int

func ParseAllMonstersJson(var filename) -> Array:
	var monsterList = []
	var file = File.new()
	file.open("res://Json/" +filename+ ".json", File.READ)
	var content = file.get_as_text()
	file.close()
	var json = JSON.parse(content)
	for i in range(3):
		print("Group:", i)
		for j in range(3):
			var monsterJson = json.result[str(i)][j]
			var m = MonsterDataSingelton.ParseMonsterData(monsterJson)
			monsterList.append(m)
	return monsterList

func ParseMonsterData(var monsterJson) -> MonsterData:
	var m = MonsterData.new()
	m.name = monsterJson.name
	m.description = monsterJson.description
	m.health = monsterJson.stats.health
	m.attack = monsterJson.stats.attack
	m.defence = monsterJson.stats.defence
	m.speed = monsterJson.stats.speed
	m.type = MONSTER_TYPE.Fire if monsterJson.type == "Fire" else ( MONSTER_TYPE.Water if monsterJson.type == "Water" else MONSTER_TYPE.Nature)
	return m
