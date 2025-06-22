@icon("uid://ey08shru7w0n")
extends Node2D
class_name Maps

@export var Testing : bool

enum ENUM_SELECTED_TILE {ATLAS_COOR,ALT_TILE_ID,TILEDATA,SOURCE_ID, COOR}
enum ENUM_CUSTOM_TILE_DATA {RESOURCE}

signal Tile_Clicked(Atlas_Coor : Array)
signal None_Clicked()


@onready var background: TileMapLayer = $BACKGROUND
@onready var background_offset: TileMapLayer = $"BACKGROUND OFFSET"
@onready var non_data_stuff: TileMapLayer = $"Non_Data stuff"
@onready var stuff: TileMapLayer = $Stuff

@onready var selector: Selector = $Selector


# Initialisation à la création du nœud :
# - Connecte les signaux de clic via Util
# - Référence le nœud Maps dans Util
# - Définit le tileset principal utilisé par le jeu
func _ready() -> void:
	Util.init_click_signal(self)
	Util.maps = self
	GlobalsVar.MAIN_Tileset = stuff.tile_set
	return




# Détecte et retourne les informations d’une tile cliquée dans un TileMapLayer donné.
# - Récupère la position de la cellule cliquée
# - Vérifie s’il y a une tile sous la souris
# - Extrait les coordonnées atlas, ID alternatif, tile_data, source_id et position
# - Émet un signal avec les infos si une tile est présente, sinon envoie un signal de "None"
func return_tile(mous_pos : Vector2, concerned_layer: TileMapLayer)->void:
	var tile_pos = concerned_layer.local_to_map(mous_pos)
	var source_id  = concerned_layer.get_cell_source_id(tile_pos)
	
	if source_id < 0 :
		None_Clicked.emit()
		return
	var atlas_co = concerned_layer.get_cell_atlas_coords(tile_pos)
	var alt_id  = concerned_layer.get_cell_alternative_tile(tile_pos)
	
	var Array_clicked_tile : Array = []
	#l'ordre des append est important c'est le m^me que l'enum
	Array_clicked_tile.append(atlas_co)
	Array_clicked_tile.append(alt_id)
	var tile_data = concerned_layer.tile_set.get_source(source_id).get_tile_data(Array_clicked_tile[0],Array_clicked_tile[1])
	Array_clicked_tile.append(tile_data)
	Array_clicked_tile.append(source_id)
	Array_clicked_tile.append(tile_pos)
	
	if tile_data:
		Tile_Clicked.emit(Array_clicked_tile)
		selector.get_in_position(tile_pos,concerned_layer)
		return
	else:
		None_Clicked.emit()
		return



# Intercepte l'entrée utilisateur :
# - Si l’utilisateur clique (et qu’aucun dialogue n’est en cours), tente de retourner la tile sous la souris dans le layer Stuff
func _input(_event: InputEvent) -> void:
	if Input.is_action_just_pressed("Click") and GlobalsVar.dialog_is_running == false:
		return_tile(get_global_mouse_position(), stuff)
	pass



# Supprime la cellule actuellement sélectionnée dans le TileMapLayer "Stuff"
# - Utilise les coordonnées sauvegardées dans GlobalsVar.current_selected_tile
func _delete_current_selected_tile():
	var current_tile : Array= GlobalsVar.current_selected_tile
	stuff.erase_cell(current_tile[ENUM_SELECTED_TILE.COOR])
