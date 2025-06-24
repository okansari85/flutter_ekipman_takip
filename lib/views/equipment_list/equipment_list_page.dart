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
  List<Equipment> filtered = selectedCategory == 'Tümü'
      ? dummyEquipments
      : dummyEquipments
          .where((e) => e.category == selectedCategory)
          .toList();

  // 👇 Burada sıralama yapılıyor
  filtered.sort((a, b) {
    final aPast = a.daysLeft < 0;
    final bPast = b.daysLeft < 0;

    if (aPast && !bPast) return 1;  // geçmişi sona at
    if (!aPast && bPast) return -1;

    return a.daysLeft.compareTo(b.daysLeft); // kalan gün küçük olan yukarı
  });

  return filtered;
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
