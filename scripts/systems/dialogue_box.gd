extends CanvasLayer
class_name DialogueBox

@onready var name_label: Label = $Panel/NameLabel
@onready var text_label: Label = $Panel/TextLabel

func set_speaker(speaker: String) -> void:
	if name_label:
		name_label.text = speaker

func set_text(text: String) -> void:
	if text_label:
		text_label.text = text
