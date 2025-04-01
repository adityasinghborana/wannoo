import 'package:flutter/material.dart';
import 'package:wannoo/constants.dart';

class CategoryCard extends StatelessWidget {
  final String imagePath;
  final String title;
  final VoidCallback onTap;

  const CategoryCard({
    super.key,
    required this.imagePath,
    required this.title,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return AspectRatio(
      aspectRatio: 1,
      child: Card(
        color: Theme.of(context).colorScheme.surface,
        elevation: 8,
        child: InkWell(
          borderRadius: BorderRadius.circular(8),
          onTap: onTap,
          child: Padding(
            padding: const EdgeInsets.all(8),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisAlignment: MainAxisAlignment.center,
              spacing: 4,
              children: [
                Image.network(
                  height: 48,
                  width: 48,
                  '$baseurl/$imagePath',
                  errorBuilder: (context, error, stackTrace) {
                    return Image.asset(
                      StaticImage.cat1,
                      fit: BoxFit.contain,
                    );
                  },
                ),
                Text(
                  title,
                  style: Theme.of(context).textTheme.labelMedium,
                  textAlign: TextAlign.center,
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
