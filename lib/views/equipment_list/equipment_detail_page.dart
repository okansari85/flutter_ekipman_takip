import 'package:flutter/material.dart';
import '../../models/equipment.dart';
import '../../models/equipment_history.dart';

class EquipmentDetailPage extends StatelessWidget {
  final Equipment equipment;

  const EquipmentDetailPage({super.key, required this.equipment});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(equipment.name),
        leading: IconButton(
          icon: const Icon(Icons.arrow_back),
          onPressed: () => Navigator.pop(context),
        ),
      ),
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // Resim varsa göster
            if (equipment.imageUrl.isNotEmpty)
              ClipRRect(
                borderRadius: BorderRadius.circular(12),
                child: Image.network(
                  equipment.imageUrl,
                  height: 200,
                  width: double.infinity,
                  fit: BoxFit.cover,
                  errorBuilder: (context, error, stackTrace) =>
                      const Padding(
                        padding: EdgeInsets.all(16.0),
                        child: Text('❌ Resim yüklenemedi'),
                      ),
                ),
              ),

            const SizedBox(height: 16),

            // Temel Bilgiler
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    equipment.name,
                    style: const TextStyle(
                      fontSize: 20,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  const SizedBox(height: 8),
                  Text('Marka: ${equipment.brand}'),
                  Text('Model: ${equipment.model}'),
                  Text('Seri No: ${equipment.serialNumber}'),
                  Text(
                    'Muayene Tarihi: ${equipment.inspectionDate.toLocal().toString().split(' ')[0]}',
                  ),
                  const SizedBox(height: 8),
                  Chip(
                    label: Text(equipment.inspectionStatusLabel),
                    backgroundColor: equipment.inspectionStatusColor.withOpacity(0.2),
                    avatar: Icon(
                      equipment.inspectionStatusIcon,
                      color: equipment.inspectionStatusColor,
                    ),
                  ),
                ],
              ),
            ),

            const SizedBox(height: 24),

            // Geçmiş Kayıtlar
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const Text(
                    'Geçmiş Kayıtlar',
                    style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
                  ),
                  const SizedBox(height: 8),
                  if (equipment.history.isEmpty)
                    const Text('Hiç geçmiş kayıt yok'),
                  ...equipment.history.map(
                    (record) => ListTile(
                      leading: const Icon(Icons.history),
                      title: Text(record.description),
                      subtitle: Text(record.date.toLocal().toString().split(' ')[0]),
                    ),
                  ),
                ],
              ),
            ),
            const SizedBox(height: 24),
          ],
        ),
      ),
    );
  }
}
