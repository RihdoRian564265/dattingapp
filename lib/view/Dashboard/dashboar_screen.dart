import 'package:flutter/material.dart';

class DashboarScreen extends StatefulWidget {
  const DashboarScreen({super.key});

  @override
  State<DashboarScreen> createState() => _DashboarScreenState();
}

class _DashboarScreenState extends State<DashboarScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Welcome') ,
      ),
    );
  }
}