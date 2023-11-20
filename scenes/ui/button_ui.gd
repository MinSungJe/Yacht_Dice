extends CanvasLayer


func _ready():
	%RollButton.pressed.connect(on_roll_button_pressed)
	

func on_roll_button_pressed():
	var dice_manager = get_tree().get_first_node_in_group("diceManager") as diceManager
	if not dice_manager: return
	
	dice_manager.roll_all_dices()
