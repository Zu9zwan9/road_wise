import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';

class CoursesPage extends StatelessWidget {
  const CoursesPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        decoration: BoxDecoration(
          gradient: LinearGradient(
            colors: [Colors.blue[200]!, Colors.green[300]!],
            begin: Alignment.topLeft,
            end: Alignment.bottomRight,
          ),
        ),
        child: BlocBuilder<CourseBloc, CourseState>(
          builder: (context, state) {
            if (state is CourseLoading) {
              return const Center(child: CircularProgressIndicator());
            }
            if (state is CourseLoaded) {
              return ListView.builder(
                padding: const EdgeInsets.all(10),
                itemCount: state.courses.length,
                itemBuilder: (context, index) {
                  final course = state.courses[index];
                  return Card(
                    color: Colors.white.withOpacity(0.2),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(15),
                    ),
                    elevation: 5,
                    margin: const EdgeInsets.symmetric(vertical: 10),
                    child: ListTile(
                      leading: const Icon(
                        Icons.directions_car,
                        color: Colors.yellow,
                      ),
                      title: Text(
                        course.title ?? 'Unknown Course',
                        style: const TextStyle(color: Colors.white),
                      ),
                      subtitle: Text(
                        course.imageSrc ?? '',
                        style: const TextStyle(color: Colors.white70),
                      ),
                      onTap: () => context.push('/learn/${course.id}'),
                    ),
                  );
                },
              );
            }
            return const Center(
              child: Text(
                'Error loading courses',
                style: TextStyle(color: Colors.white),
              ),
            );
          },
        ),
      ),
    );
  }
}
