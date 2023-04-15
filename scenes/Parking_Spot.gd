extends Node2D

export var occupied = false
export var form_filled = false
var colors = [Color.blue, Color.red, Color.green]
var color

# type of vehical, time period of parking, date of parking, vahical number
var veh_type : String
var veh_number : String

func _ready():
	pass # Replace with function body.


func _process(delta):
	if occupied == false:
		color = colors[0]
	else:
		if form_filled == false:
			color = colors[2]
		else:
			color = colors[1]
	
	$ColorRect.color = color
	
	pass


func _on_Parking_Area_input_event(viewport, event, shape_idx):
	if event.is_action_pressed("tap"):
		if occupied == false:
			occupied = true
			$Form.visible = true
		elif form_filled and occupied:
			$Form.visible = true
	pass


func _on_Button_pressed():
	veh_type = $Form/TypeLineEdit.text
	veh_number = $Form/NumberLineEdit.text
	$Form.visible = false
	form_filled = true
	pass
