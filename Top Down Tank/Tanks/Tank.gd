extends KinematicBody2D

signal shoot
signal health_changed
signal ammo_changed
signal dead

export (PackedScene) var Bullet
export (int) var max_speed
export (float) var rotation_speed
export (float) var gun_cooldown
export (int) var max_health


export (int) var max_ammo = 20
export (int) var ammo = -1 setget set_ammo

export (int) var gun_shots = 1
export (float, 0, 1.5) var gun_spread = 0.2

var velocity = Vector2()
var can_shoot = true
var alive = true
var health

func _ready():
	$GunTimer.wait_time = gun_cooldown
	health = max_health
	emit_signal("health_changed", health * 100/max_health)
	emit_signal("ammo_changed", ammo * 100/max_ammo)

func control(delta):
	pass

func shoot(num, spread, target = null):
	if can_shoot && ammo!= 0:
		self.ammo -= 1
		can_shoot = false
		$GunTimer.start()
		var dir = Vector2(1,0).rotated($Turret.global_rotation)
		if num > 1:
			for i in range(num):
				var angulo = -spread + i * (2*spread)/(num-1)
				emit_signal("shoot", Bullet, $Turret/Muzzle.global_position, dir.rotated(angulo), target)
		else:
			emit_signal("shoot", Bullet, $Turret/Muzzle.global_position, dir, target)
		$Anim.play('muzzle_flash')

func _physics_process(delta):
	if not alive:
		return
	control(delta)
	move_and_slide(velocity)

func take_damage(amount):
	health -= amount
	emit_signal("health_changed", health * 100/max_health)
	if health <= 0:
		emit_signal('dead')
		explode()

func explode():
	$CollisionShape2D.disabled = true
	alive = false
	$Turret.hide()
	$Body.hide()
	$Explosion.show()
	$Explosion.play()

func heal(amount):
	health += amount
	health = clamp(health, 0, max_health)
	emit_signal("health_changed", health * 100/max_health)

func _on_GunTimer_timeout():
	can_shoot = true


func _on_Explosion_animation_finished():
	queue_free()

func set_ammo(value):
	if value > max_ammo:
		value = max_ammo
	ammo = value
	emit_signal("ammo_changed", ammo * 100/max_ammo)