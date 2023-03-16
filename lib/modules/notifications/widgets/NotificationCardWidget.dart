import 'package:doctor_app/constants/app_colors.dart';
import 'package:doctor_app/core/extensions.dart';
import 'package:flutter/material.dart';

class NotificationCardWidget extends StatelessWidget {
  final bool isNew;
  const NotificationCardWidget(
      {Key? key,
        required this.isNew})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Row(
          children: [
            SizedBox(
              height: 18.w,
              width: 25.w,
              child: Padding(
                padding: EdgeInsets.only( right: 2.h),
                child: Padding(
                  padding: const EdgeInsets.symmetric(vertical: 4, horizontal: 10),
                  child: Container(
                    decoration: BoxDecoration(
                      color: Colors.green.withAlpha(30),
                      borderRadius: BorderRadius.circular(50),
                    ),
                    child: IconButton(
                      onPressed: () {},
                      icon: const Icon(Icons.calendar_month, color: Colors.green),
                    ),
                  ),
                ),
              ),
            ),
            Column(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  'Appointment Success',
                  style: Theme.of(context).textTheme.labelLarge?.copyWith(fontWeight: FontWeight.bold),
                ),
                const SizedBox(height: 2,),
                Text(
                  'Today | 06:28 Pm ',
                  style: Theme.of(context).textTheme.labelMedium,
                ),
              ],
            ),
            const Spacer(),
            (isNew)
            ? Container(
                decoration: BoxDecoration(
                  color: appMainColor,
                  // border: Border.all(color:  (isCompleted) ? Colors.green : Colors.red,),
                  borderRadius: BorderRadius.circular(4),
                ),
                child: const Padding(
                  padding: EdgeInsets.symmetric(vertical: 4, horizontal: 10),
                  child: Text(
                    'New' ,
                    style: TextStyle(color: Colors.white),
                  ),
                )
            )
            : const SizedBox.shrink(),
          ],
        ),
        const SizedBox(height: 10,),
        Padding(
          padding: const EdgeInsets.symmetric(vertical: 4, horizontal: 20),
          child: Column(
            children: [
              Text(
                'Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam,  ',
                style: Theme.of(context).textTheme.labelLarge,
              ),
              const SizedBox(height: 10,),
              const Divider(),
            ],
          ),
        ),

      ],
    );
  }
}
