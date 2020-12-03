extends Node2D

var Allier_selected=false
var Allier=preload("res://Scenes/Allier1_icone_formation.tscn")
var allier=Allier.instance()
var locX=0
var locY=0
func _ready():	
	add_child(allier)
	location()
func _on_Exit_pressed():
	get_tree().change_scene("res://Scenes/Map.tscn")
func location():
	if Allier_selected==true:
		locX=-20
		locY=40
		allier.position.x=locX
		allier.position.y=locY		
	else:
		locX=-90
		locY=250
		allier.position.x=locX
		allier.position.y=locY	
func _on_Area2D_area_entered(area):	
	Allier_selected=true
	location()

	
	
