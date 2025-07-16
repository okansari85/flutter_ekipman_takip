import 'package:flutter/material.dart';
import '../../models/equipment.dart';

class EquipmentAddPage extends StatefulWidget {
  const EquipmentAddPage({super.key});

  @override
  State<EquipmentAddPage> createState() => _EquipmentAddPageState();
}

class _EquipmentAddPageState extends State<EquipmentAddPage> {
  final _formKey = GlobalKey<FormState>();

  final nameController = TextEditingController();
  final brandController = TextEditingController();
  final modelController = TextEditingController();
  final serialController = TextEditingController();
  final periodController = TextEditingController(text: '365');
  DateTime? inspectionDate;
  String selectedCategory = 'Kaldırma ve İletme';

  final List<String> categories = [
    'Kaldırma ve İletme',
    'Basınçlı Kaplar',
    'Makine ve Tezgahlar',
    'Elektrikli El Aletleri',
    'Diğer',
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text("Yeni Ekipman Ekle")),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Form(
          key: _formKey,
          child: ListView(
            children: [
              TextFormField(
                controller: nameController,
                decoration: const InputDecoration(labelText: 'Ekipman Adı'),
                validator: (val) => val == null || val.isEmpty ? 'Zorunlu' : null,
              ),
              TextFormField(
                controller: brandController,
                decoration: const InputDecoration(labelText: 'Marka'),
              ),
              TextFormField(
                controller: modelController,
                decoration: const InputDecoration(labelText: 'Model'),
              ),
              TextFormField(
                controller: serialController,
                decoration: const InputDecoration(labelText: 'Seri Numarası'),
              ),
              DropdownButtonFormField<String>(
                value: selectedCategory,
                items: categories
                    .map((e) => DropdownMenuItem(value: e, child: Text(e)))
                    .toList(),
                onChanged: (val) {
                  if (val != null) setState(() => selectedCategory = val);
                },
                decoration: const InputDecoration(labelText: 'Kategori'),
              ),
              TextFormField(
                controller: periodController,
                keyboardType: TextInputType.number,
                decoration: const InputDecoration(labelText: 'Periyot (gün)'),
              ),
              const SizedBox(height: 12),
              ListTile(
                title: Text(inspectionDate == null
                    ? 'Muayene Tarihi Seçilmedi'
                    : 'Muayene Tarihi: ${inspectionDate!.toLocal().toString().split(' ')[0]}'),
                trailing: const Icon(Icons.calendar_today),
                onTap: () async {
                  final picked = await showDatePicker(
                    context: context,
                    initialDate: DateTime.now(),
                    firstDate: DateTime(2000),
                    lastDate: DateTime(2100),
                  );
                  if (picked != null) {
                    setState(() {
                      inspectionDate = picked;
                    });
                  }
                },
              ),
              const SizedBox(height: 20),
              ElevatedButton(
                onPressed: () {
                  if (_formKey.currentState!.validate() && inspectionDate != null) {
                    final newEquipment = Equipment(
                    name: nameController.text,
                    brand: brandController.text,
                    model: modelController.text,
                    serialNumber: serialController.text,
                    category: selectedCategory,
                    inspectionDate: inspectionDate!,
                    inspectionPeriodInDays: int.tryParse(periodController.text) ?? 365,
                    history: [], // ✅ bu satırı ekle
                  );

                    Navigator.pop(context, newEquipment);
                  } else {
                    ScaffoldMessenger.of(context).showSnackBar(
                      const SnackBar(content: Text('Tüm alanları doldurun')),
                    );
                  }
                },
                child: const Text('Ekle'),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
