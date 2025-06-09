extends Sprite2D
class_name Selector

# - Connecte le signal "Dialogue_ended" du SignalBus à la fonction de masquage du selector
func _ready() -> void:
	SignalBus.Dialogue_ended.connect(_on_maps_none_clicked)
	pass




# Fonction déclenchée à la fin d’un dialogue ou lorsqu’aucune tile n’est cliquée :
# - Cache le Selector
func _on_maps_none_clicked() -> void:
	hide()
	pass

# Positionne et affiche le Selector sur la tile sélectionnée :
# - Calcule la position dans le monde à partir de la position du TileMapLayer et des coordonnées de tile
func get_in_position(tile_pos : Vector2, concerned_layer: TileMapLayer)->void:
	show()
	var target_position = concerned_layer.position + tile_pos * 18 + Vector2(9,9)
	position = target_position
	pass
