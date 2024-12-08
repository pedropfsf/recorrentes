import 'package:uuid/uuid.dart';

const uuid = Uuid();

class ExpenseModel {
  ExpenseModel({
    required this.title,
    this.description,
    required this.value,
    this.paymentDate,
  }) {
    id = uuid.v4();
    createdAt = DateTime.now().toIso8601String();
  }

  String id = '';
  String title = '';
  String? description = '';
  int value = 0;
  String? paymentDate;
  String? createdAt;
}
