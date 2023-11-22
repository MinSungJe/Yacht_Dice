extends CharacterBody2D
class_name Dice

signal dice_stopped(value: int)

@export_range(1,6) var current_side: int

@onready var animation_player: AnimationPlayer = $AnimationPlayer
@onready var dice_image: AnimatedSprite2D = $DiceSprite
@onready var dice_roll_timer: Timer = $DiceRollTimer
@onready var dice_roll_gap_timer: Timer = $DiceRollGapTimer

const MAX_HEIGHT = 200
const MIN_HEIGHT = 100
var high_height = 0
var movement = Vector2.UP


func _ready():
	$DiceRollGapTimer.timeout.connect(on_dice_gap_timeout)
	$DiceRollTimer.timeout.connect(on_dice_roll_timeout)
	set_side(current_side)
	high_height = randf_range(MIN_HEIGHT, MAX_HEIGHT)
	

func roll():
	dice_roll_timer.start()
	dice_roll_gap_timer.start()
	
	
func set_side(side: int):
	dice_image.set_frame(side)


func change_side():
	var new_side = randi_range(1,6)
	set_side(new_side)
	current_side = new_side

	
func emit_dice_stopped():
	dice_stopped.emit(current_side)
	

func on_dice_gap_timeout():
	if not dice_roll_timer.is_stopped():
		change_side()
		animation_player.play("roll")
		dice_roll_gap_timer.start()
		

func on_dice_roll_timeout():
	change_side()
	animation_player.play("stop")
	emit_dice_stopped()
