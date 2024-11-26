extends PanelContainer

@onready var label: Label = %Label
@onready var progress_bar: ProgressBar = %ProgressBar
@onready var timer: Timer = $Timer

var maxValueProgresBar = 1000

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	progress_bar.max_value = maxValueProgresBar
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	pass


func _on_timer_timeout() -> void:
	
	if progress_bar.value < maxValueProgresBar:
		progress_bar.value += 0.05
		label.text = "energia: %s"% round(progress_bar.value)
	elif progress_bar.value >= maxValueProgresBar:
		timer.stop()	
	pass # Replace with function body.
