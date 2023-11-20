extends CharacterBody2D

signal dice_stopped(value: int)

@export_range(1,6) var value: int

@onready var animation_player: AnimationPlayer = $AnimationPlayer
@onready var dice_image: AnimatedSprite2D = $DiceSprite

const MAX_HEIGHT = 200
const MIN_HEIGHT = 100
var high_height = 0
var movement = Vector2.UP


func _ready():
	dice_image.set_frame(value)
	high_height = randf_range(MIN_HEIGHT, MAX_HEIGHT)
	

func roll():
	move_and_slide()
	
	
	
func emit_dice_stopped():
	dice_stopped.emit(value)
