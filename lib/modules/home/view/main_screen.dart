import 'package:doctor_app/constants/app_colors.dart';
import 'package:doctor_app/core/extensions.dart';
import 'package:doctor_app/modules/home/bloc/main_cubit.dart';
import 'package:doctor_app/modules/home/bloc/main_states.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/svg.dart';


class MainScreen extends StatelessWidget {
  const MainScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        bottomNavigationBar:
        BlocBuilder<MainCubit, MainStates>(builder: (context, state) {
          return BottomNavigationBar(
            currentIndex: BlocProvider.of<MainCubit>(context).currentIndex,
            unselectedItemColor: unselectedLabelColor,
            selectedItemColor: selectedLabelColor,
            showUnselectedLabels: true,
            type: BottomNavigationBarType.fixed,
            backgroundColor: appMainColor,
            elevation: 0,
            items: [
              BottomNavigationBarItem(
                label: 'Home',
                icon: SvgPicture.asset(
                  'assets/svg/home.svg',
                  colorFilter: (BlocProvider.of<MainCubit>(context).currentIndex == 0)
                      ?  const ColorFilter.mode(selectedIconColor , BlendMode.srcATop)
                      :  const ColorFilter.mode(unselectedIconColor , BlendMode.srcATop),
                  width: 5.w,
                ),
              ),
              BottomNavigationBarItem(
                label: 'Appointment',
                icon: SvgPicture.asset(
                  'assets/svg/appointment.svg',
                  colorFilter: (BlocProvider.of<MainCubit>(context).currentIndex == 1)
                      ?  const ColorFilter.mode(selectedIconColor , BlendMode.srcATop)
                      :  const ColorFilter.mode(unselectedIconColor , BlendMode.srcATop),
                  width: 5.w,
                ),
              ),
              BottomNavigationBarItem(
                label: 'History',
                icon: SvgPicture.asset(
                  'assets/svg/history.svg',
                  colorFilter: (BlocProvider.of<MainCubit>(context).currentIndex == 2)
                      ?  const ColorFilter.mode(selectedIconColor , BlendMode.srcATop)
                      :  const ColorFilter.mode(unselectedIconColor , BlendMode.srcATop),
                  width: 5.w,
                ),
              ),
              BottomNavigationBarItem(
                label: 'Article',
                icon: SvgPicture.asset(
                  'assets/svg/article.svg',
                  colorFilter: (BlocProvider.of<MainCubit>(context).currentIndex == 3)
                      ?  const ColorFilter.mode(selectedIconColor , BlendMode.srcATop)
                      :  const ColorFilter.mode(unselectedIconColor , BlendMode.srcATop),
                  width: 5.w,
                ),
              ),
              BottomNavigationBarItem(
                label: 'Profile',
                icon: SvgPicture.asset(
                  'assets/svg/user.svg',
                  colorFilter: (BlocProvider.of<MainCubit>(context).currentIndex == 4)
                      ?  const ColorFilter.mode(selectedIconColor , BlendMode.srcATop)
                      :  const ColorFilter.mode(unselectedIconColor , BlendMode.srcATop),
                  width: 5.w,
                ),
              ),
            ],
            onTap: (index) {
              BlocProvider.of<MainCubit>(context).changeNavBarIndex(index);
            },
          );
        }),
        body: BlocBuilder<MainCubit, MainStates>(builder: (context, state) {
          return BlocProvider.of<MainCubit>(context).pagesList[BlocProvider.of<MainCubit>(context).currentIndex];
        }));
  }
}
