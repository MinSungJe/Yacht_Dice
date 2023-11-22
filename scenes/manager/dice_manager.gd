extends Node
class_name diceManager

func _ready():
	$Dice1.dice_stopped.connect(on_dice_stopped.bind(1))
	$Dice2.dice_stopped.connect(on_dice_stopped.bind(2))
	$Dice3.dice_stopped.connect(on_dice_stopped.bind(3))
	$Dice4.dice_stopped.connect(on_dice_stopped.bind(4))
	$Dice5.dice_stopped.connect(on_dice_stopped.bind(5))
	
	
func roll_all_dices():
	var dices = get_children()
	if not dices: return
	for dice in dices: dice.roll()


func on_dice_stopped(value: int, dice: int):
	print(value, dice)
