class_name Player
extends PanelContainer

@onready var speed_progress_bar: ProgressBar = %SpeedProgressBar
@onready var moral_pb: ProgressBar = %MoralPB
@onready var magia_pb: ProgressBar = %MagiaPB
@onready var atac_valor: Label = %AtacValor
@onready var defensa_valor: Label = %DefensaValor
@onready var hechizo_valor: Label = %HechizoValor

@onready var timer_enemigo: Timer = $TimerEnemigo
@onready var ataque_valor_recibido_al_player: Label = %AtaqueValorRecibidoAlPlayer


var player_vivo = true

var data : Data = Game.ref.data



# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	
	moral_pb.max_value = data.player.moralPlayer
	moral_pb.value = data.player.moralPlayer
	
	magia_pb.max_value = data.player.magiaPlayer
	magia_pb.value = data.player.magiaPlayer
	
	atac_valor.text = "%s"%data.player.fuerzaPlayer
	defensa_valor.text = "%s"%data.player.destrezaPlayer
	timer_enemigo.wait_time = data.enemigo.velocidad*5

	#print("player")
	
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	pass


func _on_timer_enemigo_timeout() -> void:
	#print("time")
	if player_vivo:
		ataque_del_enemigo()


func ataque_del_enemigo()->void:
	calculo_ataque_defensa_del_enemigo()
	

func calculo_ataque_defensa_del_enemigo()->void:
	print("***** ataque al player ***********")
	print("ataque enemigo : %s"%data.enemigo.ataque)
	print("defensa player : %s"%data.player.defensaPlayer)
	
	var resultadoAtaque
	
	if data.player.defensaPlayer > data.enemigo.ataque:
		mostrar_ataque_recivido("0")
		print("bloqueo")
		return
		
	resultadoAtaque = data.enemigo.ataque-data.player.defensaPlayer
	print("resultado ataque : %s"%resultadoAtaque)
	if resultadoAtaque <= 0:
		resultadoAtaque = 0
#	resta moral enemigo
	moral_pb.value -= resultadoAtaque 
#	valor
	mostrar_ataque_recivido(resultadoAtaque)
	

func mostrar_ataque_recivido(resultadoAtaque)->void:
	
	if moral_pb.value > 0: 
		ataque_valor_recibido_al_player.text = "%s"%resultadoAtaque
		await get_tree().create_timer(1).timeout
		ataque_valor_recibido_al_player.text = ""
	else:
		estado_player()
		timer_enemigo.stop()
		
func estado_player()->void:
	if moral_pb.value == 0:
		player_vivo = false
		ataque_valor_recibido_al_player.text = "muerto"
