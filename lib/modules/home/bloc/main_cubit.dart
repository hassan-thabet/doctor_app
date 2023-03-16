import 'package:doctor_app/modules/home/bloc/main_states.dart';
import 'package:doctor_app/modules/home/view/appointment_tab/screens/appointment_tab.dart';
import 'package:doctor_app/modules/home/view/article_tab/article_tab.dart';
import 'package:doctor_app/modules/home/view/history_tab/history_tab.dart';
import 'package:doctor_app/modules/home/view/home_tab/screens/home_tab.dart';
import 'package:doctor_app/modules/home/view/profile_tab/profile_tab.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_bloc/flutter_bloc.dart';


class MainCubit extends Cubit<MainStates> {
  MainCubit() : super(InitialState());

  int currentIndex = 0;
  List<Widget> pagesList = const [
    HomeTab(),
    AppointmentTab(),
    HistoryTab(),
    ArticleTab(),
    ProfileTab(),
  ];

  changeNavBarIndex(index) {
    currentIndex = index;
    emit(ChangeNavBarCurrentIndex());
  }
}
