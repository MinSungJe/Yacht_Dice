extends CharacterBody2D

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
	set_side(current_side)
	high_height = randf_range(MIN_HEIGHT, MAX_HEIGHT)
	

func roll():
	dice_roll_timer.start()
	moveDice()
	change_side()
	emit_dice_stopped()
	
	
func set_side(side: int):
	dice_image.set_frame(side)


func change_side():
	var new_side = randi_range(1,6)
	set_side(new_side)
	

func moveDice():
	pass

	
func emit_dice_stopped():
	dice_stopped.emit(current_side)
