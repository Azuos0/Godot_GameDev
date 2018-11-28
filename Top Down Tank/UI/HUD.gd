extends CanvasLayer

var bar_red = preload("res://Assets/UI/barHorizontal_red_mid 200.png")
var bar_green = preload("res://Assets/UI/barHorizontal_green_mid 200.png")
var bar_yellow = preload("res://Assets/UI/barHorizontal_yellow_mid 200.png")
var bar_texture

func update_ammo(value):
	$Margin/Container/AmmoGauge.value = value

func update_healthbar(value):
	bar_texture = bar_green
	if value < 60:
		bar_texture = bar_yellow
	if value < 25:
		bar_texture = bar_red
	$Margin/Container/HealthBar.texture_progress = bar_texture
	$Margin/Container/HealthBar/Tween.interpolate_property($Margin/Container/HealthBar, "value", 
		$Margin/Container/HealthBar.value, value, 0.2, Tween.TRANS_LINEAR, Tween.EASE_IN_OUT)
	$Margin/Container/HealthBar/Tween.start()
	$Anim.play("healthbar_flash")

func _on_Anim_animation_finished(anim_name):
	if anim_name == 'healthbar_flash':
		$Margin/Container/HealthBar.texture_progress = bar_texture
