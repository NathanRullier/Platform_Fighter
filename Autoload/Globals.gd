extends Node

var hit:bool = false

func hitstun(mod,duration):
		Engine.time_scale = mod/100
		#print(str(mod))
		await get_tree().create_timer(duration*Engine.time_scale).timeout
		Engine.time_scale = 1

var css = {
	"char_1": "",
	"char_2": "",
	"stocks": 1,
	"time": 1,
	"Token_1_pos": Vector2(866.741,666.626),
	"Token_2_pos": Vector2(1073.43,666.626),
#	"stage": ""
	}

var player_1 = {
	"percentage" : 0,
	"stocks" : 3
}

var player_2 = {
	"percentage" : 0,
	"stocks" : 3
}


#func _process(delta):
#	if Input.is_action_just_pressed("ui_home"):
#		if Engine.time_scale < 1:
#			Engine.time_scale = 1
#		else:
#			Engine.time_scale = 0.1
