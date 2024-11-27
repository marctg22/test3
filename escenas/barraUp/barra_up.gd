extends PanelContainer



@onready var timer: Timer = $Timer
@onready var label_lvl: Label = %Label_LVL
@onready var progress_bar: ProgressBar = %ProgressBar
@onready var label_energia_invertida: Label = %Label_Energia_invertida
@onready var label_descarga: Label = %Label_Descarga

var data : Data = Game.ref.data


var puntsProgressBar = 0
var valorPuntsPB = 1
var energiaDescarga = 0.05

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	print("barra")
	#print(get_node("%Energia").name)
	#label_descarga.text = "%s"%energiaDescarga
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	pass


func _on_button_mes_pressed() -> void:
	
	var energiaActual = data.barres.energiaActual
	var energiaUtilitzada = data.barres.energiaUtilitzada
	
	if energiaActual <= puntsProgressBar:
		return
		
	puntsProgressBar += valorPuntsPB
	label_energia_invertida.text = "%s"%puntsProgressBar
	energiaUtilitzada += valorPuntsPB
	
	pass


func _on_button_menys_pressed() -> void:

	var energiaUtilitzada = data.barres.energiaUtilitzada

	if puntsProgressBar == 0:
		return
	
	puntsProgressBar -= valorPuntsPB
	label_energia_invertida.text = "%s"%puntsProgressBar
	energiaUtilitzada -= valorPuntsPB
	pass
	

func _on_button_max_pressed() -> void:
	
	pass # Replace with function body.
