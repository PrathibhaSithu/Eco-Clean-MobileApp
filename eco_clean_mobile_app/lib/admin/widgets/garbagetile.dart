/*import 'package:eco_clean_mobile_app/admin/models/gatbage.dart';
import 'package:flutter/material.dart';

class GarbageTile extends StatelessWidget {
  const GarbageTile({super.key, required this.garbage});

  final GarbageModel garbage;

  @override
  Widget build(BuildContext context) {
    return Card(
      color: const Color(0xFFC4E8C2),
      child: Padding(
        padding: const EdgeInsets.symmetric(
          vertical: 16,
          horizontal: 20,
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [Text(garbage.title,
            style:Theme.of(context).textTheme.titleLarge,
          ),

            const SizedBox(
              height: 4,
            ),

            Row(
              children: [
                Text(garbage.amount)
              ],
            ),

            const Spacer(),
            Row(
              children: [
                Icon(Icons.trending_down),
                const SizedBox(
                  width: 8,
                ),
                Text(garbage.date.toString())],
            )
          ],
        ),
      ),
    );
  }
}*/

/*import 'package:eco_clean_mobile_app/admin/models/gatbage.dart';
import 'package:flutter/material.dart';



class GarbageTile extends StatelessWidget {
  const GarbageTile({Key? key, required this.garbage}) : super(key: key);

  final GarbageModel garbage;

  @override
  Widget build(BuildContext context) {
    return Card(
      color: const Color(0xFFC4E8C2),
      child: Padding(
        padding: const EdgeInsets.symmetric(vertical: 12, horizontal: 15),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // Title
            Text(
              garbage.title,
              style: Theme.of(context).textTheme.titleMedium,
            ),
            const SizedBox(height: 5 ), // Vertical spacing

            // Row for amount, icon, and date
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                // Amount
                Text(
                  garbage.amount,
                  style: Theme.of(context).textTheme.bodyText2,
                ),

                // Icon
               Icon(
                  CategoryIcons[garbage.category] as IconData?,
                  size: 24, // Adjust size as needed
                  color: Colors.black, // Adjust color as needed
                ),

                // Date
                Text(
                  garbage.getFormatedDate,
                  style: Theme.of(context).textTheme.bodyText2,
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}*/

import 'dart:ui';

import 'package:flutter/material.dart';

import '../models/gatbage.dart';

class GarbageTile extends StatelessWidget {
  const GarbageTile({Key? key, required this.garbage}) : super(key: key);

  final GarbageModel garbage;

  @override
  Widget build(BuildContext context) {
    return Card(
      color: const Color(0xFFC4E8C2),
      child: Padding(
        padding: const EdgeInsets.all(12), // Padding for the entire card content
        child: Stack(
          children: [
            // Image in the top-left corner
            Positioned(
              left: 0,
              top: 0,
              child: Image.asset(
                CategoryIcons[garbage.category]!,
                width: 50,
                height: 50,
              ),
            ),

            // Main content in the card
            Column(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              //crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                // Title
                Text(
                  garbage.title,
                  style: Theme.of(context).textTheme.titleMedium,
                ),
                const SizedBox(height: 5), // Vertical spacing

                // Row for amount and date
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    // Centered Amount using Expanded widget
                    Expanded(
                      child: Center(
                        child: Text(
                          garbage.amount,
                          style: Theme.of(context).textTheme.bodyText2,
                        ),
                      ),
                    ),

                    // Date
                    Text(
                      garbage.getFormatedDate,
                      style: Theme.of(context).textTheme.bodyText2,
                    ),
                  ],
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
