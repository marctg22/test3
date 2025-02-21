extends PanelContainer

@onready var timer: Timer = $Timer
@onready var check_button: CheckButton = $MarginContainer/VBoxContainer/HBoxContainer/CheckButton
@onready var label_lvl: Label = %Label_LVL
@onready var progress_bar: ProgressBar = %ProgressBar
@onready var label_energia_invertida: Label = %Label_Energia_invertida
@onready var label_descarga: Label = %Label_Descarga

var data : Data = Game.ref.data

var maxValorprogresBar = 10000
var puntsProgressBar = 0
var valorPuntsPB = 1
var lvlBarra = 0
var energiaDescarga = 0.05
var energiaUtilitzadaperBarra = 0

func _ready() -> void:
	print("barra")
	progress_bar.max_value = maxValorprogresBar
	pass # Replace with function body.


func _process(delta: float) -> void:
	pass


func _on_button_mes_pressed() -> void:
	
	if data.energia.energiaActual <= puntsProgressBar:
		return
		
	puntsProgressBar += valorPuntsPB
	label_energia_invertida.text = "%s"%round(puntsProgressBar)
	data.energia.energiaUtilitzada += valorPuntsPB
	
	pass


func _on_button_menys_pressed() -> void:

	if puntsProgressBar <= 0:
		return
	
	puntsProgressBar -= valorPuntsPB
	
	if puntsProgressBar < 0:
		puntsProgressBar = 0
	
	label_energia_invertida.text = "%s"%round(puntsProgressBar)
	data.energia.energiaUtilitzada -= valorPuntsPB

func _on_button_max_pressed() -> void:
	
	var energiaLliure = data.energia.energiaActual - data.energia.energiaUtilitzada
	suma_energia_utilitzada(energiaLliure)
	puntsProgressBar += energiaLliure
	label_energia_invertida.text = "%s"% round(puntsProgressBar)
	
	
func _on_button_zero_pressed() -> void:
	data.energia.energiaUtilitzada = 0
	var energiaLliure = 0
	suma_energia_utilitzada(energiaLliure)
	puntsProgressBar = energiaLliure
	label_energia_invertida.text = "%s"% round(puntsProgressBar)
	pass # Replace with function body.

func suma_energia_utilitzada(energiaLliure):
	data.energia.energiaUtilitzada += energiaLliure


#	activa/desactiva la barra
func _on_check_button_pressed() -> void:
#	activa
	if check_button.button_pressed:
		timer.start()
	else:
		timer.stop()
	pass # Replace with function body.


func _on_timer_timeout() -> void:
	var calculPunts = puntsProgressBar*timer.wait_time
	progress_bar.value +=  calculPunts
	print("calcul : %s"%calculPunts)
	print("progress_bar : %s" % progress_bar.value)
	
	if progress_bar.value == progress_bar.max_value:
		lvl_up()
		
	pass # Replace with function body.

func lvl_up()->void:
	progress_bar.value = 0
	lvlBarra +=1
	label_lvl.text = "%s"%lvlBarra
