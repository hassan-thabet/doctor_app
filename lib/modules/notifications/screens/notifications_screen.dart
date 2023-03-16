import 'package:doctor_app/core/extensions.dart';
import 'package:doctor_app/modules/notifications/widgets/NotificationCardWidget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
class NotificationsScreen extends StatelessWidget {
  const NotificationsScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          'Notifications' ,
        ),
        elevation: 4,
        actions: [
          Padding(
            padding: EdgeInsets.symmetric(horizontal: 5.w),
            child: SvgPicture.asset('assets/svg/menu-dots-vertical.svg', width: 20 , height: 20,),
          ),
        ],

      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            const SizedBox(height: 20),
            SizedBox(
              width: 90.w,
              child: ListView.builder(
                scrollDirection: Axis.vertical,
                shrinkWrap: true,
                physics: const NeverScrollableScrollPhysics(),
                itemCount: 2,
                itemBuilder: (BuildContext context, int index) {
                  return const Padding(
                      padding: EdgeInsets.symmetric(vertical: 8),
                      child: NotificationCardWidget(isNew: true)
                  );
                },
              ),
            ),
            SizedBox(
              width: 90.w,
              child: ListView.builder(
                scrollDirection: Axis.vertical,
                shrinkWrap: true,
                physics: const NeverScrollableScrollPhysics(),
                itemCount: 4,
                itemBuilder: (BuildContext context, int index) {
                  return const Padding(
                      padding: EdgeInsets.symmetric(vertical: 8),
                      child: NotificationCardWidget(isNew: false)
                  );
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}
