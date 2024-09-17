extends Control


var rng = RandomNumberGenerator.new()
# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	pass

var answer = 0
# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	var question = self.get_node('./VBoxContainer/Control2/Question')
	if question.text == '':
		createQuestion(question)
		generateAnswer()

func createQuestion(question):
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
		answer = x / (y + 0.0)

func generateAnswer():
	var answers = [answer]
	for i in range(3):
		var new_answer = answer + rng.randi_range(-10, 10)
		answers.append(new_answer)
	var button_pck = preload("res://answer_button.tscn")
	var vbox = get_node("Answers")
	for ans in answers:
		var button = button_pck.instantiate()
		vbox.add_child(button)
		var anss = get_node('./Answers')
		button = anss.get_child(anss.get_child_count() - 1)
		button.set_text(ans)
	answers = []
