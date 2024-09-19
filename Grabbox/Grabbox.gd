extends Area2D

var parent = get_parent()
@export var width = 300
@export var height = 400
@export var damage = 50
@export var duration = 1500
@export var type  = 'normal'
@onready var grabbox = get_node("Grabbox_Shape")
var framezz  = 0.0
var player_list = []
var points = []
var point

func set_parameters(w,h,d,dur,p,parent=get_parent()):
	self.position = Vector2(0,0)
	player_list.append(parent)
	player_list.append(self)
	width = w
	height = h
	damage = d
	duration = dur
	self.position = p
	point = p
	update_extents()
	self.body_entered.connect(Grabbox_Collide)
	set_physics_process(true)


# For Grabbing, there should be a number of how long the hitstun is
func Grabbox_Collide(body):
	#body = body.get_parent()
	if !(body in player_list):
		body.percentage += damage
		var charstate
		charstate = body.get_node("StateMachine")
		body._frame()
		charstate.grabbed(get_parent().name,get_parent().get_node('StateMachine').state)
		charstate.state = charstate.states.GRABBED
		body.global_position = grabbox.global_position
		body.velocity.x = 0
		body.velocity.y = 0
		player_list.append(body)
		get_parent().grabbing = true

func _ready():
	grabbox.shape = RectangleShape2D.new()
	set_physics_process(false)
	pass

	
func update_extents():
	grabbox.shape.extents = Vector2(width,height)

func _physics_process(delta):
	if framezz<duration:
		framezz += floor(delta *60)
	elif framezz >= duration:
		#print ()
		get_parent().grabbing = false
		#print('frame is: ' + str(framezz))
		queue_free()
		return
