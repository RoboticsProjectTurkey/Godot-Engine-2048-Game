extends Node2D

onready var panels = [[get_node("Panel/GridContainer/1"),get_node("Panel/GridContainer/2"),get_node("Panel/GridContainer/3"),get_node("Panel/GridContainer/4")]
 ,[get_node("Panel/GridContainer/5"),get_node("Panel/GridContainer/6"),get_node("Panel/GridContainer/7"),get_node("Panel/GridContainer/8")]
 ,[get_node("Panel/GridContainer/9"),get_node("Panel/GridContainer/10"),get_node("Panel/GridContainer/11"),get_node("Panel/GridContainer/12")]
 ,[get_node("Panel/GridContainer/13"),get_node("Panel/GridContainer/14"),get_node("Panel/GridContainer/15"),get_node("Panel/GridContainer/16")]]

var rng = RandomNumberGenerator.new()

func _ready():
	rng.randomize()
	add_random_number()
	add_random_number()
	print(list_panel_number_x())
	print(list_panel_number_y())

func add_random_number():
	var columns = rng.randi_range(0, 3)
	var rows = rng.randi_range(0, 3)
	while panels[rows][columns].get_node("Label").text != str(0):
		add_random_number()
		break
	panels[rows][columns].get_node("Label").text = str(2)

func _physics_process(delta):
	if Input.is_action_just_pressed("ui_right"):
		move_panel(0)
	elif Input.is_action_just_pressed("ui_left"):
		move_panel(1)
	elif Input.is_action_just_pressed("ui_up"):
		move_panel(2)
	elif Input.is_action_just_pressed("ui_down"):
		move_panel(3)

func move_panel(var directionn):
	var x = list_panel_number_x()
	var y = list_panel_number_y()
	if directionn == 0:
		print(x)

func list_panel_number_x():
	var a = []
	var aa = []
	
	var i = 0
	while i<4:
		aa=[]
		var ii = 0
		while ii<4:
			aa.append(get_node("Panel/GridContainer/"+str((i*4)+ii+1)).get_node("Label").text)
			ii+=1
		a.append(aa)
		i+=1
	return a

func list_panel_number_y():
	var a = []
	var aa = []
	var i = 0
	while i<4:
		aa=[]
		var ii = 0
		while ii<4:
			aa.append(get_node("Panel/GridContainer/"+str(i+1+4*ii)).get_node("Label").text)
			ii+=1
		a.append(aa)
		i+=1
	return a
