extends Node
class_name diceManager

func roll_all_dices():
	var dices = get_children()
	if not dices: return
	
	for dice in dices:
		dice.roll()
