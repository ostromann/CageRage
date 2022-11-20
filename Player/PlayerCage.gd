extends Spatial


var has_ground_contact : bool = false
onready var AreaTL = $Diagonal/AreaTopLeft
onready var AreaBL = $Diagonal/AreaBottomLeft
onready var AreaTR = $Diagonal/AreaTopRight
onready var AreaBR = $Diagonal/AreaBottomRight


func _physics_process(delta):
	
	var AreaCorList=[
		AreaTL.global_translation.y,
		AreaBL.global_translation.y,
		AreaTR.global_translation.y,
		AreaBR.global_translation.y
		]
		
	var AreaList=[
		AreaTL,
		AreaBL,
		AreaTR,
		AreaBR
		]
		
	var LowestArea = AreaList[AreaCorList.find(AreaCorList.min())]

	var overlapping_bodies = LowestArea.get_overlapping_bodies()
	
	if overlapping_bodies:
		
		for overlapping_body in overlapping_bodies:
			has_ground_contact = true
	else:
		has_ground_contact = false
