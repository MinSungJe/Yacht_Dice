extends Button

signal roll_button_pressed


func _ready():
	pressed.connect(on_roll_button_pressed)
	

func on_roll_button_pressed():
	roll_button_pressed.emit()
