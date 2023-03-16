import 'package:doctor_app/constants/app_colors.dart';
import 'package:doctor_app/core/extensions.dart';
import 'package:flutter/material.dart';
class FavoritesCardWidget extends StatelessWidget {
  const FavoritesCardWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 1,
      shadowColor: Colors.grey,
      child: Row(
        children: [
          Container(
            height: 28.w,
            width: 30.w,
            decoration: const BoxDecoration(
                image: DecorationImage(
                    image: AssetImage('assets/images/doctor_2.png'))),
          ),
          Expanded(
            child: Column(
              // mainAxisAlignment: MainAxisAlignment.spaceBetween,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      'Dr. Aisha Ali',
                      style: Theme.of(context).textTheme.labelLarge?.copyWith(fontSize: 18),
                    ),
                    IconButton(
                      onPressed: () {},
                      icon: const Icon(Icons.favorite, color: appMainColor),
                    ),
                  ],
                ),
                const Divider(),
                Text(
                  'Cardio Specialist - Paris Hospital',
                  style: Theme.of(context).textTheme.labelLarge,
                ),
                Row(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    const Icon(Icons.star_half , color:  appMainColor, ),
                    Text(
                      '4.9 ( 345 Review )',
                      style: Theme.of(context).textTheme.labelLarge,
                    ),
                  ],
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
