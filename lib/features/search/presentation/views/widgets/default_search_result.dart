import 'package:bookly_app/core/utils/styles.dart';
import 'package:flutter/material.dart';

class DefaultSearchResult extends StatelessWidget {
  const DefaultSearchResult({super.key});

  @override
  Widget build(BuildContext context) {
    return const Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Icon(Icons.search, size: 60, color: Colors.grey),
          SizedBox(height: 16),
          Text(
            'Please enter a topic to start your search',
            style: Styles.textStyle20,
            textAlign: TextAlign.center,
          ),
        ],
      ),
    );
  }
}
