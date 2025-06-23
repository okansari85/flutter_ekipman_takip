import 'package:flutter/material.dart';
import '../../data/dummy_data.dart';
import '../../models/equipment.dart';
import '../../widgets/dropdown_category_filter.dart';
import 'equipment_card.dart';

class EquipmentListPage extends StatefulWidget {
  const EquipmentListPage({super.key});

  @override
  State<EquipmentListPage> createState() => _EquipmentListPageState();
}

class _EquipmentListPageState extends State<EquipmentListPage> {
  String selectedCategory = 'Tümü';
  
late List<String> categories;

@override
void initState() {
  super.initState();
  categories = ['Tümü', ...{
    for (var item in dummyEquipments) item.category
  }];
}

 List<Equipment> get filteredList {
  if (selectedCategory == 'Tümü') return dummyEquipments;
  return dummyEquipments
      .where((e) => e.category == selectedCategory)
      .toList();
}

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text("Makine & Ekipmanlar")),
      body: Column(
        children: [
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: DropdownCategoryFilter(
              categories: categories,
              selectedCategory: selectedCategory,
              onChanged: (val) {
                setState(() {
                  selectedCategory = val;
                });
              },
            ),
          ),
          Expanded(
            child: ListView.builder(
              itemCount: filteredList.length,
              itemBuilder: (context, index) {
                return EquipmentCard(equipment: filteredList[index]);
              },
            ),
          )
        ],
      ),
    );
  }
}
