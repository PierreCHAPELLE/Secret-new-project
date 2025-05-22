extends Camera2D
class_name PanningCamera2D
@onready var map: TileMapLayer = %Map



const MIN_ZOOM: float = 0.5
const MAX_ZOOM: float = 3
const ZOOM_RATE: float = 8.0
const ZOOM_INCREMENT: float = 0.1

var _target_zoom: float = 2

var _tween: Tween = Tween.new()


func _physics_process(delta: float) -> void:
	zoom = lerp(zoom, _target_zoom * Vector2.ONE, ZOOM_RATE * delta)
	set_physics_process(not is_equal_approx(zoom.x, _target_zoom))


func _unhandled_input(event: InputEvent) -> void:
	if event is InputEventMouseButton:
		if event.is_pressed():
			if event.button_index == MOUSE_BUTTON_WHEEL_UP:
				zoom_in()
			if event.button_index == MOUSE_BUTTON_WHEEL_DOWN:
				zoom_out()
	if event is InputEventMouseMotion:
		if event.button_mask == MOUSE_BUTTON_MASK_MIDDLE:
			position -= event.relative/zoom



func zoom_in() -> void:
	_target_zoom = max(_target_zoom - ZOOM_INCREMENT, MIN_ZOOM)
	set_physics_process(true)


func zoom_out() -> void:
	_target_zoom = min(_target_zoom + ZOOM_INCREMENT, MAX_ZOOM)
	set_physics_process(true)


func focus_position(target_position: Vector2) -> void:
	_tween.tween_property(self, "position", target_position, 0.2)
