import 'package:flutter/material.dart';
class ArticleTab extends StatelessWidget {
  const ArticleTab({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Article tab'),
      ),
      body: const Center(
        child: Text('Article Tab' , style: TextStyle(fontSize: 22),),
      ),
    );
  }
}
