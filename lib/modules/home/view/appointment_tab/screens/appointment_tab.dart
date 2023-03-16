import 'package:doctor_app/constants/app_colors.dart';
import 'package:doctor_app/core/extensions.dart';
import 'package:doctor_app/modules/home/view/appointment_tab/screens/cancelled_tab_view.dart';
import 'package:doctor_app/modules/home/view/appointment_tab/screens/completed_tab_view.dart';
import 'package:doctor_app/modules/home/view/appointment_tab/screens/upcoming_tab_view.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

class AppointmentTab extends StatelessWidget {
  const AppointmentTab({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 3,
      child: Scaffold(
        appBar: AppBar(
          title: const Text(
            'Appointment' ,
          ),
          backgroundColor: Colors.white,
          elevation: 4,
          actions: [
            SvgPicture.asset('assets/svg/search.svg', width: 20 , height: 20,),
            Padding(
              padding: EdgeInsets.symmetric(horizontal: 5.w),
              child: SvgPicture.asset('assets/svg/menu-dots-vertical.svg', width: 20 , height: 20,),
            ),
          ],
          bottom: const TabBar(
              labelColor: appMainColor,
              unselectedLabelColor: Colors.black54,

              tabs: [
                Tab(
                  text: "Upcoming",
                ),
                Tab(
                  text: "Completed",
                ),
                Tab(
                  text: "Cancelled",
                ),
              ]
          ),

        ),
        body: const TabBarView(
            children: [
              UpcomingTabView(),
              CompletedTabView(),
              CancelledTabView(),
            ]
        ),
      ),
    );
  }
}