
import 'package:doctor_app/constants/app_colors.dart';
import 'package:doctor_app/core/extensions.dart';
import 'package:doctor_app/modules/favorites/widgets/favorites_card_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
class FavoritesScreen extends StatelessWidget {
  const FavoritesScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          'Favorites Doctors' ,
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

      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            const SizedBox(height: 20),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20),
              child: SizedBox(
                // width: 90.w,
                child: ListView.builder(
                  scrollDirection: Axis.vertical,
                  shrinkWrap: true,
                  physics: const NeverScrollableScrollPhysics(),
                  itemCount: 6,
                  itemBuilder: (BuildContext context, int index) {
                    return const Padding(
                      padding: EdgeInsets.symmetric(vertical: 6),
                      child: FavoritesCardWidget(),
                    );
                  },
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
