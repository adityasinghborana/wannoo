import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:wannoo/constants.dart';

import '../utilities/dialog.dart';

class ExperiencesCard extends StatelessWidget {
  final String imagePath;
  final String title;
  final String location;
  final bool isfav;
  final bool isAddIcon;
  final int selectedTourId;
  final bool isPriceVisible;
  final double? price;
  final VoidCallback? onTap;

  const ExperiencesCard({
    super.key,
    required this.imagePath,
    required this.title,
    this.isAddIcon = true,
    required this.selectedTourId,
    required this.location,
    this.price,
    this.isPriceVisible = true,
    required this.isfav,
    this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: 160,
      child: Card.outlined(
        clipBehavior: Clip.antiAlias,
        child: InkWell(
          borderRadius: BorderRadius.circular(8),
          onTap: onTap,
          child: Column(
            children: [
              AspectRatio(
                aspectRatio: 1,
                child: Stack(
                  children: [
                    Container(
                      clipBehavior: Clip.antiAlias,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(12),
                      ),
                      height: 160,
                      width: 160,
                      child: Image.network(
                        imagePath,
                        fit: BoxFit.cover,
                      ),
                    ),
                    if (isAddIcon)
                      Positioned(
                        top: 0,
                        right: 0,
                        child: SizedBox(
                          height: 40,
                          width: 40,
                          child: IconButton(
                            icon: const Icon(
                              Icons.add,
                              color: ThemeColor.colorBgSecondory,
                            ),
                            padding: EdgeInsets.zero,
                            onPressed: () {
                              showMyModalBottomSheet(context, selectedTourId);
                            },
                          ),
                        ),
                      ),
                  ],
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(8),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      title,
                      style: Theme.of(context).textTheme.labelLarge,
                    ),
                    Row(
                      spacing: 4,
                      children: [
                        Icon(
                          FontAwesomeIcons.locationDot,
                          size:
                              Theme.of(context).textTheme.labelMedium?.fontSize,
                        ),
                        Text(
                          location,
                          style: Theme.of(context).textTheme.labelMedium,
                        ),
                        const Spacer(),
                        Text(
                          "$price",
                          style: Theme.of(context).textTheme.labelMedium,
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
