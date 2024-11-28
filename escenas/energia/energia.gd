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
	progress_bar.max_value = data.energia.energiaValorMax
	#label_energia_utilitzada.text = "%s"% valorEnergiaUtilitzada
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	updateLabel()
	pass


func _on_timer_timeout() -> void:
		
	if progress_bar.value < data.energia.energiaValorMax:
		progress_bar.value += 0.05
		data.energia.energiaActual = progress_bar.value
		label.text = "energia: %s"% round(progress_bar.value)
	elif progress_bar.value >= data.energia.energiaValorMax:
		timer.stop()	

	data.energia.energiaLliure = data.energia.energiaActual - data.energia.energiaUtilitzada
	

	pass # Replace with function body.

func updateLabel()->void:
	
	if data.energia.energiaUtilitzada < 0:
		data.energia.energiaUtilitzada = 0
	label_energia_utilitzada.text = "%s"% round( data.energia.energiaUtilitzada)
	pass
