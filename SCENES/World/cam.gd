extends Camera2D
class_name PanningCamera2D
@onready var map: Maps = %MAPS


@export var CameraLimit : CollisionShape2D

@export var MIN_ZOOM: float = 1
@export var MAX_ZOOM: float = 3
@export var ZOOM_RATE: float = 4.0
@export var ZOOM_INCREMENT: float = 0.5

@export var _target_zoom: float = 2

var _tween: Tween = create_tween()
var is_dragging := false
var last_mouse_position := Vector2.ZERO


# Fonction de mise à jour physique de la caméra :
# - Applique un zoom progressif vers la valeur cible (_target_zoom) avec interpolation (lerp)
# - Active ou désactive le _physics_process selon si le zoom est déjà atteint ou non
func _physics_process(delta: float) -> void:
	zoom = lerp(zoom, _target_zoom * Vector2.ONE, ZOOM_RATE * delta)
	set_physics_process(not is_equal_approx(zoom.x, _target_zoom))
	pass



# Gère les événements de souris non capturés :
# - Molette haut/bas → zoom in/out
# - Clic molette maintenu → drag de la caméra (pan)
func _unhandled_input(event: InputEvent) -> void:
	if event is InputEventMouseButton:
		if event.is_pressed():
			if event.button_index == MOUSE_BUTTON_WHEEL_UP:
				zoom_in()
			if event.button_index == MOUSE_BUTTON_WHEEL_DOWN:
				zoom_out()
		if event.button_index == MOUSE_BUTTON_MIDDLE:
			if event.is_pressed():
				is_dragging = true
				last_mouse_position = event.position
			else:
				is_dragging = false
	if event is InputEventMouseMotion:
		if is_dragging:
			# Déplacement de la caméra, ajusté au zoom
			var new_pos = position - event.relative / zoom
			position = get_limited_position(new_pos)


# Calcule une position limitée de la caméra selon les bornes du CollisionShape CameraLimit
func get_limited_position(new_pos: Vector2) -> Vector2:
	var limit_area = CameraLimit.shape.size
	var limit_min_x = CameraLimit.global_position.x-limit_area.x/2
	var limit_max_x = CameraLimit.global_position.x+limit_area.x/2
	var limit_min_y = CameraLimit.global_position.y-limit_area.y/2 
	var limit_max_y = CameraLimit.global_position.y+limit_area.y/2
	var x  = clamp(new_pos.x, limit_min_x,limit_max_x)
	var y  = clamp(new_pos.y, limit_min_y,limit_max_y)
	return Vector2(x, y)



# Diminue le niveau de zoom (rapproche la caméra), dans la limite minimale autorisée
func zoom_in() -> void:
	_target_zoom = max(_target_zoom - ZOOM_INCREMENT, MIN_ZOOM)
	set_physics_process(true)

# Augmente le niveau de zoom (éloigne la caméra), dans la limite maximale autorisée
func zoom_out() -> void:
	_target_zoom = min(_target_zoom + ZOOM_INCREMENT, MAX_ZOOM)
	set_physics_process(true)

# Centre la caméra sur une position cible avec un effet de transition douce (tween de 0.2s)
func focus_position(target_position: Vector2) -> void:
	_tween.tween_property(self, "position", target_position, 0.2)
