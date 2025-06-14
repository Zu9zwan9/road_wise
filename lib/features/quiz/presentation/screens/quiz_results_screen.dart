import 'package:confetti/confetti.dart';
import 'package:flutter/material.dart';

class QuizResultsScreen extends StatefulWidget {
  final int totalQuestions;
  final int correctAnswers;
  final String quizId;
  final VoidCallback onRetakeQuiz;
  final VoidCallback onGoHome;

  const QuizResultsScreen({
    super.key,
    required this.totalQuestions,
    required this.correctAnswers,
    required this.quizId,
    required this.onRetakeQuiz,
    required this.onGoHome,
  });

  @override
  State<QuizResultsScreen> createState() => _QuizResultsScreenState();
}

class _QuizResultsScreenState extends State<QuizResultsScreen> {
  late ConfettiController _confettiController;

  @override
  void initState() {
    super.initState();
    _confettiController = ConfettiController(
      duration: const Duration(seconds: 2),
    );
    if (widget.correctAnswers / widget.totalQuestions > 0.7) {
      // Play confetti if score is good
      _confettiController.play();
    }
  }

  @override
  void dispose() {
    _confettiController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final double percentage =
        (widget.correctAnswers / widget.totalQuestions) * 100;

    return Scaffold(
      appBar: AppBar(
        title: const Text('Quiz Results'),
        automaticallyImplyLeading: false,
      ),
      body: Stack(
        alignment: Alignment.topCenter,
        children: [
          Padding(
            padding: const EdgeInsets.all(24.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                Text(
                  widget.correctAnswers / widget.totalQuestions > 0.7
                      ? 'Congratulations!'
                      : 'Almost There!',
                  style: TextStyle(
                    fontSize: 28,
                    fontWeight: FontWeight.bold,
                    color: widget.correctAnswers / widget.totalQuestions > 0.7
                        ? Colors.green
                        : Colors.orange,
                  ),
                  textAlign: TextAlign.center,
                ),
                const SizedBox(height: 16),
                Text(
                  widget.correctAnswers / widget.totalQuestions > 0.7
                      ? 'You passed the quiz with a great score!'
                      : 'You can do better. Keep practicing!',
                  style: const TextStyle(fontSize: 18, color: Colors.grey),
                  textAlign: TextAlign.center,
                ),
                const SizedBox(height: 32),
                Container(
                  padding: const EdgeInsets.all(24),
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(16),
                    boxShadow: [
                      BoxShadow(
                        color: Colors.grey.withOpacity(0.1),
                        spreadRadius: 1,
                        blurRadius: 8,
                        offset: const Offset(0, 2),
                      ),
                    ],
                  ),
                  child: Column(
                    children: [
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          const Text(
                            'Your Score',
                            style: TextStyle(
                              fontSize: 18,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                          Text(
                            '${widget.correctAnswers}/${widget.totalQuestions}',
                            style: const TextStyle(
                              fontSize: 18,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                        ],
                      ),
                      const SizedBox(height: 16),
                      LinearProgressIndicator(
                        value: widget.correctAnswers / widget.totalQuestions,
                        backgroundColor: Colors.grey[300],
                        valueColor: AlwaysStoppedAnimation<Color>(
                          widget.correctAnswers / widget.totalQuestions > 0.7
                              ? Colors.green
                              : Colors.orange,
                        ),
                        minHeight: 8,
                        borderRadius: BorderRadius.circular(4),
                      ),
                      const SizedBox(height: 8),
                      Align(
                        alignment: Alignment.centerRight,
                        child: Text(
                          '${percentage.toStringAsFixed(1)}%',
                          style: TextStyle(
                            fontSize: 16,
                            fontWeight: FontWeight.bold,
                            color:
                                widget.correctAnswers / widget.totalQuestions >
                                    0.7
                                ? Colors.green
                                : Colors.orange,
                          ),
                        ),
                      ),
                      const SizedBox(height: 24),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          _buildScoreDetail(
                            Icons.check_circle,
                            Colors.green,
                            'Correct',
                            widget.correctAnswers.toString(),
                          ),
                          const SizedBox(width: 24),
                          _buildScoreDetail(
                            Icons.cancel,
                            Colors.red,
                            'Incorrect',
                            (widget.totalQuestions - widget.correctAnswers)
                                .toString(),
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
                const SizedBox(height: 24),
                if (widget.correctAnswers / widget.totalQuestions > 0.7) ...[
                  Container(
                    padding: const EdgeInsets.all(16),
                    decoration: BoxDecoration(
                      color: Colors.green.withOpacity(0.1),
                      borderRadius: BorderRadius.circular(8),
                      border: Border.all(color: Colors.green.withOpacity(0.3)),
                    ),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        const Row(
                          children: [
                            Icon(Icons.emoji_events, color: Colors.amber),
                            SizedBox(width: 8),
                            Text(
                              'Rewards Earned',
                              style: TextStyle(
                                fontSize: 16,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                          ],
                        ),
                        const SizedBox(height: 8),
                        const Text('• +20 XP Points'),
                        const Text('• Road Signs Badge'),
                        const Text('• Quiz Master Achievement'),
                      ],
                    ),
                  ),
                  const SizedBox(height: 24),
                ],
                const Spacer(),
                ElevatedButton(
                  onPressed: () {
                    Navigator.of(context).pushReplacementNamed('/dashboard');
                  },
                  style: ElevatedButton.styleFrom(
                    padding: const EdgeInsets.symmetric(vertical: 16),
                  ),
                  child: const Text(
                    'Back to Dashboard',
                    style: TextStyle(fontSize: 16),
                  ),
                ),
                const SizedBox(height: 16),
                OutlinedButton(
                  onPressed: () {
                    Navigator.of(context).pushReplacementNamed(
                      '/quiz',
                      arguments: {'quizId': widget.quizId},
                    );
                  },
                  style: OutlinedButton.styleFrom(
                    padding: const EdgeInsets.symmetric(vertical: 16),
                  ),
                  child: const Text(
                    'Try Again',
                    style: TextStyle(fontSize: 16),
                  ),
                ),
              ],
            ),
          ),
          Align(
            alignment: Alignment.topCenter,
            child: ConfettiWidget(
              confettiController: _confettiController,
              blastDirectionality: BlastDirectionality.explosive,
              particleDrag: 0.05,
              emissionFrequency: 0.05,
              numberOfParticles: 20,
              gravity: 0.2,
              colors: const [
                Colors.green,
                Colors.blue,
                Colors.pink,
                Colors.orange,
                Colors.purple,
                Colors.amber,
              ],
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildScoreDetail(
    IconData icon,
    Color color,
    String label,
    String value,
  ) {
    return Column(
      children: [
        Icon(icon, color: color, size: 28),
        const SizedBox(height: 8),
        Text(label, style: const TextStyle(fontSize: 14, color: Colors.grey)),
        Text(
          value,
          style: TextStyle(
            fontSize: 24,
            fontWeight: FontWeight.bold,
            color: color,
          ),
        ),
      ],
    );
  }
}
