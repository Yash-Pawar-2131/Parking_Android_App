extends Node2D

var hovering = false
export var occupied = false
export var form_filled = false
var colors = [Color.blue, Color.red, Color.green]
var color

# type of vehical, time period of parking, date of parking, vahical number
var veh_type : String
var veh_number : String

func _ready():
	$Form.global_position = Vector2(160 * 1.5, 70 * 1.5)
	
	$Form/Node2D/CalendarButton.connect("date_selected", self, "update_date_selected")
	
	$Form/OptionButton.add_item("Hatchback")
	$Form/OptionButton.add_item("Sedan")
	$Form/OptionButton.add_item("SUV")
	$Form/OptionButton.add_item("MUV")
	$Form/OptionButton.add_item("Coupe")
	$Form/OptionButton.add_item("Convertible")
	$Form/OptionButton.add_item("Pickup Truck")
	pass


func _process(delta):
	if occupied == false:
		color = colors[0]
		color.a = 0
		if hovering:
			color.a = 0.1
	else:
		if form_filled == false:
			color = colors[2]
		else:
			color = colors[1]
		color.a = 0.1
	
	$Node2D/ColorRect.color = color
	
	pass


func _on_Parking_Area_input_event(viewport, event, shape_idx):
	if event is InputEventScreenTouch and event.is_pressed():
		if occupied == false:
			occupied = true
			$Form.visible = true
		elif form_filled and occupied:
			$Form.visible = true
	pass


func _on_Button_pressed():
	veh_type = $Form/OptionButton.get_item_text($Form/OptionButton.selected)
	veh_number = $Form/NumberLineEdit.text
	$Form.visible = false
	form_filled = true
	pass


func update_date_selected(date_obj):
	$Form/DateLabel.text = date_obj.date("DD-MM-YYYY")
	pass


func _on_Parking_Area_mouse_entered():
	hovering = true
	pass


func _on_Parking_Area_mouse_exited():
	hovering = false
	pass
