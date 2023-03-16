import 'package:doctor_app/constants/app_colors.dart';
import 'package:doctor_app/core/extensions.dart';
import 'package:doctor_app/modules/home/view/home_tab/widgets/category_card_widget.dart';
import 'package:doctor_app/modules/home/view/home_tab/widgets/today_appointment_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

class HomeTab extends StatelessWidget {
  const HomeTab({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Row(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            const CircleAvatar(
              backgroundImage: AssetImage('assets/images/placeholder.png'),
            ),
            SizedBox(width: 2.w),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: const [
                Text(
                  'Hello',
                  style: TextStyle(fontWeight: FontWeight.w500),
                ),
                Text(
                  'Hassan Th. 👋',
                  style: TextStyle(fontWeight: FontWeight.bold, fontSize: 20),
                ),
              ],
            ),
          ],
        ),
        actions: [
          InkWell(
            onTap: () {
              Navigator.pushNamed(context, '/notifications_screen');
            },
            child: SvgPicture.asset(
              'assets/svg/bell.svg',
              width: 20,
              height: 20,
            ),
          ),
          InkWell(
            onTap: () {
              Navigator.pushNamed(context, '/favorites_screen');
            },
            child: Padding(
              padding: EdgeInsets.symmetric(horizontal: 5.w),
              child: SvgPicture.asset(
                'assets/svg/heart.svg',
                width: 20,
                height: 20,
              ),
            ),
          ),
        ],
      ),
      body: GestureDetector(
        onTap: () => FocusScope.of(context).unfocus(),
        child: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20),
            child: Column(
              children: [
                const SizedBox(height: 20),

                ///    Search
                ///
                Container(
                  width: double.infinity,
                  decoration: BoxDecoration(
                    color: Colors.grey[200],
                    borderRadius: BorderRadius.circular(5),
                  ),
                  padding:
                      const EdgeInsets.symmetric(vertical: 5, horizontal: 10),
                  child: Row(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: const [
                       Padding(
                        padding: EdgeInsets.only(top: 3),
                        child: Icon(
                          Icons.search,
                          color: appMainColor,
                        ),
                      ),
                       SizedBox(
                        width: 15,
                      ),
                       Expanded(
                        child: TextField(
                          decoration: InputDecoration(
                            border: InputBorder.none,
                            hintText: 'Search a doctor or health issue',
                            hintStyle: TextStyle(
                                fontSize: 13,
                                color: Colors.black54,
                                fontWeight: FontWeight.w700),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
                const SizedBox(height: 20),

                /// Appointment Today
                ///
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    const Text(
                      'Appointment Today',
                      style: TextStyle(fontSize: 16, color: Colors.black87),
                    ),
                    TextButton(
                      child: const Text(
                        'See All',
                        style: TextStyle(
                          color: appMainColor,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      onPressed: () {
                        //
                      },
                    )
                  ],
                ),
                const TodayAppointmentWidget(),



                /// Categories
                ///
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    const Text(
                      'Doctor Speciality',
                      style: TextStyle(fontSize: 16, color: Colors.black87),
                    ),
                    TextButton(
                      child: const Text(
                        'See All',
                        style: TextStyle(
                          color: appMainColor,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      onPressed: () {
                        //
                      },
                    )
                  ],
                ),
                SizedBox(
                  // height: 20.h,
                  width: 100.w,
                  child: GridView.builder(
                      shrinkWrap: true,
                      physics: const NeverScrollableScrollPhysics(),
                      gridDelegate:
                          const SliverGridDelegateWithFixedCrossAxisCount(
                        crossAxisCount: 4,
                      ),
                      itemCount: 8,
                      itemBuilder: (BuildContext ctx, index) {
                        return const CategoryCardWidget();
                      }),
                ),



              ],
            ),
          ),
        ),
      ),
    );
  }
}
