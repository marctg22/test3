class_name Estadisticas
extends PanelContainer

@onready var fuerza_valor: Label = %FuerzaValor
@onready var destreza_valor: Label = %DestrezaValor
@onready var inteligencia_valor: Label = %InteligenciaValor
@onready var constitucion_valor: Label = %ConstitucionValor
@onready var suerte_valor: Label = %SuerteValor
@onready var moral_pb: ProgressBar = %MoralPB
@onready var moral_valor: Label = %MoralValor
@onready var magia_pb: ProgressBar = %MagiaPB
@onready var magia_valor: Label = %MagiaValor


var data : Data = Game.ref.data


# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	fuerza_valor.text = "%s"%data.player.fuerzaPlayer
	destreza_valor.text = "%s"%data.player.destrezaPlayer
	inteligencia_valor.text = "%s"%data.player.inteligenciaPlayer
	constitucion_valor.text = "%s"%data.player.contitucionPlayer
	suerte_valor.text = "%s"%data.player.suertePlayer
	
	moral_pb.max_value = data.player.moralPlayer
	moral_pb.value = data.player.moralPlayer
	moral_valor.text = "%s"%data.player.moralPlayer
	
	magia_pb.max_value = data.player.magiaPlayer
	magia_pb.value = data.player.magiaPlayer
	magia_valor.text = "%s"%data.player.magiaPlayer

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	pass
