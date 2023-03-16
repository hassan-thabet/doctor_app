import 'package:doctor_app/constants/app_colors.dart';
import 'package:doctor_app/core/extensions.dart';
import 'package:doctor_app/modules/authentication/widgets/authentication_button_widget.dart';
import 'package:flutter/material.dart';

class AppointmentCardWidget extends StatelessWidget {
  final bool isCompleted;
  const AppointmentCardWidget(
      {Key? key,
      required this.isCompleted})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 1,
      shadowColor: Colors.grey,
      child: Column(
        children: [
          Row(
            children: [
              Container(
                height: 28.w,
                width: 30.w,
                decoration: const BoxDecoration(
                    image: DecorationImage(
                        image: AssetImage('assets/images/doctor_1.png'))),
              ),
              Column(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    'Dr. Mohammed Ali',
                    style: Theme.of(context).textTheme.labelLarge,
                  ),
                  Padding(
                    padding: const EdgeInsets.symmetric(vertical: 8.0),
                    child: Row(
                      children: [
                        Text(
                          'Voice Call - ',
                          style: Theme.of(context).textTheme.labelMedium,
                        ),
                        Container(
                            decoration: BoxDecoration(
                              color: Colors.transparent,
                              border: Border.all(color:  (isCompleted) ? Colors.green : Colors.red,),
                              borderRadius: BorderRadius.circular(4),
                            ),
                            child: Padding(
                              padding: const EdgeInsets.symmetric(
                                  vertical: 4, horizontal: 10),
                              child: Text(
                                (isCompleted) ? 'Completed' : 'Cancelled',
                                style: TextStyle(color: (isCompleted) ? Colors.green : Colors.red,),
                              ),
                            ))
                      ],
                    ),
                  ),
                  Text(
                    '16 Mar 2023 | 10:00 PM',
                    style: Theme.of(context).textTheme.labelMedium,
                  ),
                ],
              ),
              const Spacer(),
              Padding(
                padding: EdgeInsets.only( right: 2.h),
                child: Column(
                  children: [
                    Container(
                      decoration: BoxDecoration(
                        color: appMainColor.withAlpha(30),
                        borderRadius: BorderRadius.circular(12),
                      ),
                      child: IconButton(
                        onPressed: () {},
                        icon: const Icon(Icons.phone, color: appMainColor),
                      ),
                    )
                  ],
                ),
              ),
            ],
          ),
          (isCompleted)
              ? const Divider()
              : const SizedBox.shrink(),
          (isCompleted)
              ? Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Expanded(
                      child: Padding(
                        padding: const EdgeInsets.all(4),
                        child: AuthenticationButtonWidget(
                          title: 'Book again',
                          backgroundColor: Colors.white,
                          titleColor: appMainColor,
                          onClick: () {
                            //
                          },
                        ),
                      ),
                    ),
                    Expanded(
                        child: Padding(
                          padding: const EdgeInsets.all(4),
                          child: AuthenticationButtonWidget(
                      title: 'Leave review',
                      backgroundColor: appMainColor,
                      titleColor: Colors.white,
                      onClick: () {
                          //
                      },
                    ),
                        ))
                  ],
                )
              : const SizedBox.shrink(),
        ],
      ),
    );
  }
}
