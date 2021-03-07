extends AnimatedSprite

var inbox = false
var opened = false

func _ready():
	$TextureButton.texture_normal = null
	$".".play('default')
	
func _process(delta):
	if inbox and not opened:
		if Input.is_action_just_pressed("ui_select"):
			print("opened")
			$".".play('opening')
			$Timer.start(1.5)
			$TextureButton.texture_normal = null
			opened = true

func _on_Area2D_body_entered(body):
	if not opened:
		var btn_texture = load("res://assets/box/button.png")
		$TextureButton.texture_normal = btn_texture
	inbox = true
	
func _on_Area2D_body_exited(body):
	$TextureButton.texture_normal = null
	inbox = false


func _on_Timer_timeout():
	$".".play('opened')
