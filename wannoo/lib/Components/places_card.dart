import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:gap/gap.dart';
import 'package:get/get.dart';

import '../constants.dart';

class PlacesCard extends StatelessWidget {
  final String title;
  final String image;
  final String location;
  final double rating;
  final double price;
  final VoidCallback? onTap;

  const PlacesCard({
    super.key,
    required this.title,
    required this.image,
    required this.location,
    this.rating = 4.7,
    this.price = 250,
    this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 140,
      padding: const EdgeInsets.symmetric(horizontal: 16),
      child: InkWell(
        borderRadius: BorderRadius.circular(12),
        onTap: onTap,
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          spacing: 16,
          children: [
            AspectRatio(
              aspectRatio: 1,
              child: ClipRRect(
                borderRadius: BorderRadius.circular(12),
                child: Image.network(
                  image,
                  width: double.infinity,
                  fit: BoxFit.cover,
                ),
              ),
            ),
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                spacing: 8,
                children: [
                  Row(
                    children: [
                      Expanded(
                        child: Text(
                          title,
                          style: Theme.of(context).textTheme.titleMedium,
                        ),
                      ),
                      IconButton(
                        icon: const FaIcon(
                          FontAwesomeIcons.bookmark,
                          size: 20,
                        ),
                        color: Theme.of(context).colorScheme.onSurfaceVariant,
                        onPressed: () {},
                      ),
                    ],
                  ),
                  const Spacer(),
                  Row(
                    spacing: 8,
                    children: [
                      Icon(
                        FontAwesomeIcons.locationDot,
                        color: Theme.of(context).colorScheme.primary,
                        size: Theme.of(context).textTheme.titleSmall?.fontSize,
                      ),
                      Text(
                        location,
                        style: Theme.of(context).textTheme.titleSmall,
                      ),
                    ],
                  ),
                  Row(
                    spacing: 8,
                    children: [
                      Icon(
                        FontAwesomeIcons.star,
                        color: Theme.of(context).colorScheme.primary,
                        size: Theme.of(context).textTheme.labelLarge?.fontSize,
                      ),
                      Text(
                        "$rating",
                        style: Theme.of(context).textTheme.labelLarge,
                      ),
                      const Spacer(),
                      Text(
                        "\$$price",
                        style: Theme.of(context).textTheme.labelLarge,
                      ),
                      const SizedBox(width: 8),
                    ],
                  ),
                  const SizedBox(height: 4),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
