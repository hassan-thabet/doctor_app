import 'package:flutter/material.dart';
class HistoryTab extends StatelessWidget {
  const HistoryTab({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('History tab'),
      ),
      body: const Center(
        child: Text('History Tab' , style: TextStyle(fontSize: 22),),
      ),
    );
  }
}
