import 'package:flutter/material.dart';

class Equipment {
  final String name;
  final String brand;
  final String model;
  final String serialNumber;
  final DateTime inspectionDate;
  final String category;
  final int inspectionPeriodInDays;

  Equipment({
    required this.name,
    required this.brand,
    required this.model,
    required this.serialNumber,
    required this.inspectionDate,
    required this.category,
    this.inspectionPeriodInDays = 365, // Varsayılan 1 yıl
  });

  /// Periyot son tarihi
  DateTime get inspectionDueDate =>
      inspectionDate.add(Duration(days: inspectionPeriodInDays));

  /// Kaç gün kaldı?
  int get daysLeft =>
      inspectionDueDate.difference(DateTime.now()).inDays;

  Color get inspectionStatusColor {
    if (daysLeft > 60) {
      return Colors.green;
    } else if (daysLeft >= 0) {
      return Colors.orange;
    } else {
      return Colors.red;
    }
  }

  IconData get inspectionStatusIcon {
    if (daysLeft > 60) {
      return Icons.check_circle;
    } else if (daysLeft >= 0) {
      return Icons.warning_amber;
    } else {
      return Icons.cancel;
    }
  }

  String get inspectionStatusLabel {
    if (daysLeft > 60) {
      return 'Geçerli';
    } else if (daysLeft >= 0) {
      return 'Yaklaşıyor';
    } else {
      return 'Geçmiş';
    }
  }
}
