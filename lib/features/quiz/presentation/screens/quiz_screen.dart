import 'package:flutter/material.dart';

class QuizScreen extends StatefulWidget {
  final String quizId;

  const QuizScreen({Key? key, required this.quizId}) : super(key: key);

  @override
  State<QuizScreen> createState() => _QuizScreenState();
}

class _QuizScreenState extends State<QuizScreen> {
  int _currentQuestionIndex = 0;
  List<String> _selectedAnswers = [];
  final List<Map<String, dynamic>> _mockQuestions = [
    {
      'id': 'q1',
      'question': 'What does a red octagonal sign indicate?',
      'options': [
        'Yield to traffic',
        'Stop completely',
        'Slow down',
        'No entry',
      ],
      'correctAnswer': 1,
      'explanation':
          'A red octagonal sign (STOP sign) requires drivers to come to a complete stop.',
      'imagePath': 'assets/images/questions/stop_sign.png',
    },
    {
      'id': 'q2',
      'question': 'What does a yellow diamond-shaped sign indicate?',
      'options': [
        'School zone ahead',
        'Construction zone',
        'Warning or caution',
        'Temporary detour',
      ],
      'correctAnswer': 2,
      'explanation':
          'Yellow diamond-shaped signs are warning signs that alert drivers to potential hazards or changing road conditions ahead.',
      'imagePath': 'assets/images/questions/warning_sign.png',
    },
    {
      'id': 'q3',
      'question':
          'What does a circular sign with a red border and a red diagonal line mean?',
      'options': [
        'No parking',
        'No entry for specific vehicles',
        'End of restriction',
        'Dangerous goods prohibited',
      ],
      'correctAnswer': 1,
      'explanation':
          'A circular sign with a red border and diagonal line indicates a prohibition, often specifying which vehicles or actions are not allowed.',
      'imagePath': 'assets/images/questions/prohibition_sign.png',
    },
    {
      'id': 'q4',
      'question': 'What color are guide signs on highways?',
      'options': ['Red', 'Yellow', 'Green', 'Blue'],
      'correctAnswer': 2,
      'explanation':
          'Guide signs on highways are typically green and provide directional information such as destinations, distances, and exit numbers.',
      'imagePath': 'assets/images/questions/guide_sign.png',
    },
    {
      'id': 'q5',
      'question': 'What shape is a railroad crossing sign?',
      'options': ['Round', 'Diamond', 'X-shaped', 'Rectangular'],
      'correctAnswer': 2,
      'explanation':
          'Railroad crossing signs are X-shaped (crossbuck) and are typically white with black lettering saying "RAILROAD CROSSING".',
      'imagePath': 'assets/images/questions/railroad_crossing.png',
    },
  ];

  void _selectAnswer(int answerIndex) {
    setState(() {
      _selectedAnswers.add(
        _mockQuestions[_currentQuestionIndex]['options'][answerIndex],
      );

      if (_currentQuestionIndex < _mockQuestions.length - 1) {
        _currentQuestionIndex++;
      } else {
        // Quiz completed, navigate to results
        Navigator.of(context).pushReplacementNamed(
          '/quiz-results',
          arguments: {
            'quizId': widget.quizId,
            'score': _calculateScore(),
            'totalQuestions': _mockQuestions.length,
            'answers': _selectedAnswers,
          },
        );
      }
    });
  }

  int _calculateScore() {
    int score = 0;
    for (int i = 0; i < _selectedAnswers.length; i++) {
      if (i < _mockQuestions.length) {
        int correctIndex = _mockQuestions[i]['correctAnswer'];
        String selectedAnswer = _selectedAnswers[i];
        String correctAnswer = _mockQuestions[i]['options'][correctIndex];
        if (selectedAnswer == correctAnswer) {
          score++;
        }
      }
    }
    return score;
  }

  @override
  Widget build(BuildContext context) {
    final currentQuestion = _mockQuestions[_currentQuestionIndex];

    return Scaffold(
      appBar: AppBar(
        title: Text('Quiz: Road Signs ${widget.quizId}'),
        actions: [
          Center(
            child: Padding(
              padding: const EdgeInsets.only(right: 16.0),
              child: Text(
                '${_currentQuestionIndex + 1}/${_mockQuestions.length}',
                style: const TextStyle(
                  fontSize: 16,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
          ),
        ],
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            LinearProgressIndicator(
              value: (_currentQuestionIndex) / _mockQuestions.length,
              backgroundColor: Colors.grey[300],
              valueColor: AlwaysStoppedAnimation<Color>(
                Theme.of(context).primaryColor,
              ),
            ),
            const SizedBox(height: 24),
            if (currentQuestion['imagePath'] != null) ...[
              Expanded(
                flex: 3,
                child: Container(
                  decoration: BoxDecoration(
                    border: Border.all(color: Colors.grey[300]!),
                    borderRadius: BorderRadius.circular(8),
                  ),
                  child: ClipRRect(
                    borderRadius: BorderRadius.circular(8),
                    child: Image.asset(
                      currentQuestion['imagePath'],
                      fit: BoxFit.contain,
                      errorBuilder: (context, error, stackTrace) {
                        return const Center(
                          child: Icon(
                            Icons.image_not_supported,
                            size: 80,
                            color: Colors.grey,
                          ),
                        );
                      },
                    ),
                  ),
                ),
              ),
              const SizedBox(height: 24),
            ],
            Text(
              currentQuestion['question'],
              style: const TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 24),
            Expanded(
              flex: 4,
              child: ListView.builder(
                itemCount: currentQuestion['options'].length,
                itemBuilder: (context, index) {
                  return Padding(
                    padding: const EdgeInsets.only(bottom: 12.0),
                    child: ElevatedButton(
                      onPressed: () => _selectAnswer(index),
                      style: ElevatedButton.styleFrom(
                        foregroundColor: Colors.black87,
                        backgroundColor: Colors.white,
                        padding: const EdgeInsets.symmetric(
                          vertical: 16,
                          horizontal: 16,
                        ),
                        textStyle: const TextStyle(fontSize: 16),
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(8),
                          side: BorderSide(color: Colors.grey[300]!),
                        ),
                        alignment: Alignment.centerLeft,
                      ),
                      child: Text(
                        '${String.fromCharCode(65 + index)}. ${currentQuestion['options'][index]}',
                      ),
                    ),
                  );
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}
