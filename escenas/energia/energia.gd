class_name Energia
extends PanelContainer

@onready var label: Label = %Label
@onready var progress_bar: ProgressBar = %ProgressBar
@onready var timer: Timer = $Timer
@onready var label_energia_utilitzada: Label = %Label_EnergiaUtilitzada


var data : Data = Game.ref.data

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	print("energia")
	progress_bar.max_value = data.barres.energiaValorMax
	#label_energia_utilitzada.text = "%s"% valorEnergiaUtilitzada
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	updateLabel()
	pass


func _on_timer_timeout() -> void:
	
	var energiaValorMaxim = data.barres.energiaValorMax
	var energiaActual = data.barres.energiaActual
	var energiaLliure = data.barres.energiaLliure
	var energiaUtilitzada = data.barres.energiaUtilitzada
	
	if progress_bar.value < energiaValorMaxim:
		progress_bar.value += 0.05
		energiaActual = progress_bar.value
		label.text = "energia: %s"% round(progress_bar.value)
	elif progress_bar.value >= energiaValorMaxim:
		timer.stop()	

	energiaLliure = energiaActual - energiaUtilitzada
	

	pass # Replace with function body.

func updateLabel()->void:
	label_energia_utilitzada.text = "%s"% data.barres.valorProgresBarUtilitzat
	pass
