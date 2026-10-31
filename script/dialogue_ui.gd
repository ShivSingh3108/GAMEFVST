extends CanvasLayer

var dia_timer = 0.0
var is_dia = false
var lines =["So Malware and iris has gone out ",
"and i was given the responsiblity to take care of trojan",
"Trojan is Malware's pet",
"But he went rogue and logged me out of system ",
 "Lets collect the passkey and enter the system",
"and calm our guy down", 
"Whhattt!!! Pishingg,Vishing,Smishing ",
 "broke out of their cage , What a unlucky day",
"Dodge them"]
var index =0
func start_talking():
	index = 0
	show_line()
	
func show_line():
	$Panel/diatext.text = lines[index]
	$Panel/diatext.show()
	$Timer2.start(3.0)
	
func _on_timer_2_timeout():
	index +=1
	if index >=lines.size():
		$Panel.hide()
		
		return
	show_line()	
func _ready():
	start_talking()
