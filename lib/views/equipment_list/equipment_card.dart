import 'package:flutter/material.dart';
import '../../models/equipment.dart';
import 'equipment_detail_page.dart'; // views klasöründen geldiği için

class EquipmentCard extends StatelessWidget {
  final Equipment equipment;

  const EquipmentCard({super.key, required this.equipment});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 4),
      child: IntrinsicHeight(
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            // Sol renk şeridi
            Container(
              width: 6,
              decoration: BoxDecoration(
                color: equipment.inspectionStatusColor,
                borderRadius: const BorderRadius.only(
                  topLeft: Radius.circular(8),
                  bottomLeft: Radius.circular(8),
                ),
              ),
            ),

            // Kart alanı
            Expanded(
             child: InkWell(
    onTap: () {
      Navigator.push(
        context,
        MaterialPageRoute(
          builder: (_) => EquipmentDetailPage(equipment: equipment),
        ),
      );
    },
    child: Card(
      elevation: 2,
      margin: EdgeInsets.zero,
      shape: const RoundedRectangleBorder(
        borderRadius: BorderRadius.only(
          topRight: Radius.circular(8),
          bottomRight: Radius.circular(8),
        ),
      ),
      child: Padding(
        padding: const EdgeInsets.fromLTRB(8, 8, 8, 8),
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // Yazı alanı
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    equipment.name,
                    style: const TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 16,
                    ),
                  ),
                  const SizedBox(height: 4),
                  Text(
                    '${equipment.brand} - ${equipment.model}',
                    style: const TextStyle(fontSize: 12),
                  ),
                  Text(
                    'Seri No: ${equipment.serialNumber}',
                    style: const TextStyle(fontSize: 12),
                  ),
                  Text(
                    'Muayene Tarihi: ${equipment.inspectionDate.toLocal().toString().split(' ')[0]}',
                    style: const TextStyle(fontSize: 12),
                  ),
                ],
              ),
            ),

            // Sağ ikon
            Center(
              child: Tooltip(
                message: equipment.inspectionStatusLabel,
                child: Icon(
                  equipment.inspectionStatusIcon,
                  color: equipment.inspectionStatusColor,
                  size: 24,
                ),
              ),
            ),
          ],
        ),
      ),
    ),
  ),
            ),
          ],
        ),
      ),
    );
  }
}
