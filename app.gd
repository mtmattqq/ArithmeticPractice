extends Control


var rng = RandomNumberGenerator.new()
# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	pass

var answer = 0
# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	var question = self.get_node('./VBoxContainer/Question')
	if question.text == '':
		var x = rng.randi_range(-1000, 1000)
		var y = rng.randi_range(0, 1000)
		var op = rng.randi_range(0, 4)
		if op == 0:
			question.text = '%d + %d = _____' % [x, y]
			answer = x + y
		elif op == 1:
			question.text = '%d - %d = _____' % [x, y]
			answer = x - y
		elif op == 2:
			question.text = '%d • %d = _____' % [x, y]
			answer = x * y
		elif op == 3:
			question.text = '%d ÷ %d = _____' % [x, y]
			answer = x / y
