class_name Masmorras
extends PanelContainer

@onready var timerPlayer:Timer = %TimerPlayer
@onready var timerEnemigo:Timer = %TimerEnemigo

var data :Data = Game.ref.data

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	pass


func _on_timer_player_timeout() -> void:
	
	#print(data.player.fuerzaPlayer)
	#ataque_valor_recivido.text = "%s"%data.player.fuerzaPlayer
	#ataque_valor_recivido.text = str(6)
	#print(ataque_valor_recivido)
	
	pass # Replace with function body.


func _on_timer_enemigo_timeout() -> void:
	pass # Replace with function body.
