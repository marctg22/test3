class_name Game
extends Control

#**********************************
#Singleton reference
static var ref : Game

func _init()->void:
	if not ref:
		ref = self
		#print("ref")
	else:
		queue_free()
		#print("quit")
#**********************************


var data :Data = Data.new()
