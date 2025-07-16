import '../models/equipment.dart';
import '../models/equipment_history.dart';


final List<Equipment> dummyEquipments = [
  Equipment(
    name: 'Matkap',
    brand: 'Bosch',
    model: 'X123',
    serialNumber: 'SN001',
    inspectionDate: DateTime(2025, 12, 31),
    category: 'Makine ve Tezgahlar',
     history: [
      EquipmentHistory(date: DateTime(2023, 5, 10), description: 'Yıllık muayene tamamlandı'),
      EquipmentHistory(date: DateTime(2022, 5, 12), description: 'Arıza giderildi'),
    ],
 
  ),
  Equipment(
    name: 'Forklift',
    brand: 'Toyota',
    model: '7FB',
    serialNumber: 'SN002',
    inspectionDate: DateTime(2023, 9, 30),
    category: 'Kaldırma ve İletme Ekipmanları',
    imageUrl: 'https://dhl-freight-connections.com/wp-content/uploads/2024/04/forklift-1-1.png',
   history: [
      EquipmentHistory(date: DateTime(2023, 5, 10), description: 'Yıllık muayene tamamlandı'),
      EquipmentHistory(date: DateTime(2022, 5, 12), description: 'Arıza giderildi'),
    ],
    ),
  Equipment(
    name: 'Kompresör',
    brand: 'Atlas Copco',
    model: 'XAHS',
    serialNumber: 'SN003',
    inspectionDate: DateTime(2026, 5, 10),
    category: 'Basınçlı Kaplar',
        imageUrl: 'https://cdn.pixabay.com/photo/2012/04/14/16/26/compressor-34234_960_720.png',
   history: [
      EquipmentHistory(date: DateTime(2023, 5, 10), description: 'Yıllık muayene tamamlandı'),
      EquipmentHistory(date: DateTime(2022, 5, 12), description: 'Arıza giderildi'),
    ],
  ),
];
