import 'package:flutter/material.dart';
import '../../models/equipment.dart';

class EquipmentDetailPage extends StatelessWidget {
  final Equipment equipment;

  const EquipmentDetailPage({super.key, required this.equipment});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text(equipment.name)),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            _infoRow("Marka", equipment.brand),
            _infoRow("Model", equipment.model),
            _infoRow("Seri No", equipment.serialNumber),
            _infoRow("Kategori", equipment.category),
            _infoRow(
              "Muayene Tarihi",
              equipment.inspectionDate.toLocal().toString().split(' ')[0],
            ),
            _infoRow("Durum", equipment.inspectionStatusLabel),
            const SizedBox(height: 20),
            Center(
              child: Icon(
                equipment.inspectionStatusIcon,
                size: 48,
                color: equipment.inspectionStatusColor,
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _infoRow(String label, String value) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 4),
      child: Row(
        children: [
          Text("$label: ",
              style: const TextStyle(fontWeight: FontWeight.bold)),
          Expanded(child: Text(value)),
        ],
      ),
    );
  }
}
