extends CanvasLayer
class_name Canvas_Layer



func _ready() -> void:
	SignalBus.Show_Item_Detail.connect(Show_Item)
	SignalBus.Hide_Item_Detail.connect(Hide_Item)
	pass


func Show_Item(item : ItemResource):
	%Item_Information.init(item)
	pass

func Hide_Item():
	%Item_Information.hide()
	pass
