import 'package:flutter/material.dart';
import 'views/equipment_list/equipment_list_page.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});
  
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Makine & Ekipman Listesi',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: const EquipmentListPage(),
    );
  }
}
