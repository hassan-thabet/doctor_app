import 'package:flutter/material.dart';
class ProfileTab extends StatelessWidget {
  const ProfileTab({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Profile tab'),
      ),
      body: const Center(
        child: Text('Profile Tab' , style: TextStyle(fontSize: 22),),
      ),
    );
  }
}
