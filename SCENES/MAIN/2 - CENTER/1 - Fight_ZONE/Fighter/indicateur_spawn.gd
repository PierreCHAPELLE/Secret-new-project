extends Marker2D
class_name Indicator_Spawner

@export var CurrentFighter : Fighter


func generate_hp_indicateur(dmg)->Hp_Indicateur:
	var hp_ind = GlobalsVar.HP_INDICATEUR.instantiate() as Hp_Indicateur
	%Indicateur_Spawn.add_child(hp_ind)
	hp_ind.init(dmg)
	return hp_ind

func generate_cant_attack()->Hp_Indicateur:
	var hp_ind = GlobalsVar.HP_INDICATEUR.instantiate() as Hp_Indicateur
	%Indicateur_Spawn.add_child(hp_ind)
	hp_ind.init_cant_attack()
	return hp_ind
