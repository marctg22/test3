class_name Enemigo
extends PanelContainer

@onready var moral_pb: ProgressBar = %MoralPB
@onready var mana_pb: ProgressBar = %ManaPB
@onready var ataque_valor: Label = %AtaqueValor
@onready var defensa_valor: Label = %DefensaValor
@onready var hechizo_valor: Label = %HechizoValor

@onready var timer_player: Timer = $TimerPlayer
@onready var ataque_valor_recibido_al_enemigo: Label = %AtaqueValorRecibidoAlEnemigo

var enemigoVivo =  true

var data : Data = Game.ref.data

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	
	moral_pb.max_value = data.enemigo.moral
	moral_pb.value = data.enemigo.moral
	
	ataque_valor.text = "%s"%data.enemigo.ataque
	defensa_valor.text = "%s"%data.enemigo.defensa
	
	timer_player.wait_time = data.player.velocidad*5
	

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	pass


func _on_timer_player_timeout() -> void:
	print("time")
	if enemigoVivo:
		ataque_del_player()


func ataque_del_player()->void:
	calculo_ataque_defensa_del_player()
	

func calculo_ataque_defensa_del_player()->void:
	print("***** ataque al enemigo ***********")
	print("ataque player : %s"%data.player.ataquePlayer)
	print("defensa enemigo : %s"%data.enemigo.defensa)
	
	var resultadoAtaque
	
	if data.enemigo.defensa > data.player.ataquePlayer:
		mostrar_ataque_recivido("0")
		print("bloqueo")
		return
		
	resultadoAtaque = data.player.ataquePlayer-data.enemigo.defensa
	print("resultado ataque : %s"%resultadoAtaque)
	if resultadoAtaque <= 0:
		resultadoAtaque = 0
#	resta moral enemigo
	moral_pb.value -= resultadoAtaque 
#	valor
	mostrar_ataque_recivido(resultadoAtaque)
	

func mostrar_ataque_recivido(resultadoAtaque)->void:
	
	if moral_pb.value > 0: 
		ataque_valor_recibido_al_enemigo.text = "%s"%resultadoAtaque
		await get_tree().create_timer(1).timeout
		ataque_valor_recibido_al_enemigo.text = ""
	else:
		estado_enemigo()
		timer_player.stop()
		
func estado_enemigo()->void:
	if moral_pb.value == 0:
		enemigoVivo = false
		ataque_valor_recibido_al_enemigo.text = "muerto"
