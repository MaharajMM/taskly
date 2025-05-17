import 'package:flutter/material.dart';
import 'package:taskly/const/resource.dart';

class EmptyTasksView extends StatelessWidget {
  final String categoryName;
  const EmptyTasksView({super.key, required this.categoryName});

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Image.asset(R.ASSETS_IMAGES_EMPTY_TASK_PNG,
              // If you don't have the exact image, the placeholder below will work
              errorBuilder: (context, error, stackTrace) {
            return _buildEmptyStateIllustration();
          }),
          const SizedBox(height: 20),
          const Text(
            'Hooray!!',
            style: TextStyle(
              fontSize: 24,
              fontWeight: FontWeight.bold,
              color: Color(0xFF4A5A83),
            ),
          ),
          const SizedBox(height: 8),
          Text(
            "You don't have any pending $categoryName today",
            style: TextStyle(
              fontSize: 14,
              color: Colors.grey,
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildEmptyStateIllustration() {
    return Container(
      width: 120,
      height: 120,
      decoration: BoxDecoration(
        color: Colors.grey[200],
        borderRadius: BorderRadius.circular(60),
      ),
      child: Icon(
        Icons.check_circle_outline,
        size: 60,
        color: Colors.grey[400],
      ),
    );
  }
}
