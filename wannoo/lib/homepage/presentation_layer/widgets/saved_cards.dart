import 'package:flutter/material.dart';
import 'package:flutter_widget_from_html/flutter_widget_from_html.dart';
import 'package:intl/intl.dart';
import 'package:wannoo/constants.dart';

class SavedCards extends StatelessWidget {
  final String title;
  final String imagePath;
  final String date;
  final String body;
  final VoidCallback onTap;

  const SavedCards({
    super.key,
    required this.title,
    required this.imagePath,
    required this.date,
    required this.body,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 16),
      height: MediaQuery.of(context).textScaler.scale(140),
      child: InkWell(
        borderRadius: BorderRadius.circular(12),
        onTap: onTap,
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          spacing: 16,
          children: [
            Container(
              clipBehavior: Clip.antiAlias,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(12),
              ),
              height: 140,
              width: 140,
              child: Image.network(
                '$baseurl/$imagePath',
                fit: BoxFit.cover,
                loadingBuilder: (context, child, loadingProgress) => Container(
                  color: Theme.of(context).colorScheme.surfaceContainerHighest,
                ),
                errorBuilder: (context, child, loadingProgress) => Container(
                  color: Theme.of(context).colorScheme.surfaceContainerHighest,
                ),
              ),
            ),
            Expanded(
              child: Padding(
                padding: const EdgeInsets.symmetric(vertical: 8),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      title,
                      style: Theme.of(context).textTheme.titleMedium,
                    ),
                    HtmlWidget(
                      textStyle: Theme.of(context).textTheme.bodyMedium,
                      body.substring(0, 50),
                    ),
                    const Spacer(),
                    Text(
                      DateFormat.yMMMd().format(DateTime.parse(date)),
                      style: Theme.of(context).textTheme.labelMedium?.copyWith(
                            color:
                                Theme.of(context).colorScheme.onSurfaceVariant,
                          ),
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
