import 'package:flutter/material.dart';

class MainSearchPage extends StatefulWidget {
  const MainSearchPage({super.key});

  @override
  State<MainSearchPage> createState() => _MainSearchPageState();
}

class _MainSearchPageState extends State<MainSearchPage> {
  @override
  Widget build(BuildContext context) {
    return const Center(
      child: Text('Search'),
    );
  }
}
