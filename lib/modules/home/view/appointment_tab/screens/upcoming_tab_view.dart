import 'package:doctor_app/core/extensions.dart';
import 'package:doctor_app/modules/home/view/appointment_tab/widgets/appointment_card_widget.dart';
import 'package:flutter/material.dart';
class UpcomingTabView extends StatelessWidget {
  const UpcomingTabView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Column(
        children: [
          const SizedBox(height: 20),
          SizedBox(
            width: 90.w,
            child: ListView.builder(
              scrollDirection: Axis.vertical,
              shrinkWrap: true,
              physics: const NeverScrollableScrollPhysics(),
              itemCount: 6,
              itemBuilder: (BuildContext context, int index) {
                return const Padding(
                  padding: EdgeInsets.symmetric(vertical: 8),
                  child: AppointmentCardWidget(
                    isCompleted: true,
                  ),
                );
              },
            ),
          ),
        ],
      ),
    );
  }
}
