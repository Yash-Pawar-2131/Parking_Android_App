extends MenuButton


func _ready():
	get_popup().add_item("Hatchback")
	get_popup().add_item("Sedan")
	get_popup().add_item("SUV")
	get_popup().add_item("MUV")
	get_popup().add_item("Coupe")
	get_popup().add_item("Convertible")
	get_popup().add_item("Pickup Truck")
