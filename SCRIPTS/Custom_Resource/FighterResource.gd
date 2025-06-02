extends Resource
class_name FighterResource

enum  ATTACK_TYPE{CLOSE, RANGE, HEAL, MAGIC}
enum  BONUS{ARMOR, VENOM, LIFE_STEAL, ZEUB}


@export var visual : Texture2D
@export var name : String

@export var HP : int

@export var ATK : int

@export var attack_type : ATTACK_TYPE


@export var bonus_type : Array[BONUS]
