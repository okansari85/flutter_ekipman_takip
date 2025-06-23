import '../models/equipment.dart';

final List<Equipment> dummyEquipments = [
  Equipment(
    name: 'Matkap',
    brand: 'Bosch',
    model: 'X123',
    serialNumber: 'SN001',
    inspectionDate: DateTime(2025, 12, 31),
    category: 'Makine ve Tezgahlar',
  ),
  Equipment(
    name: 'Forklift',
    brand: 'Toyota',
    model: '7FB',
    serialNumber: 'SN002',
    inspectionDate: DateTime(2023, 9, 30),
    category: 'Kaldırma ve İletme Ekipmanları',
  ),
  Equipment(
    name: 'Kompresör',
    brand: 'Atlas Copco',
    model: 'XAHS',
    serialNumber: 'SN003',
    inspectionDate: DateTime(2026, 5, 10),
    category: 'Basınçlı Kaplar',
  ),
];
