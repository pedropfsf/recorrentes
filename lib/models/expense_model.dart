import 'package:uuid/uuid.dart';

const uuid = Uuid();

class ExpenseModel {
  ExpenseModel({
    required this.id,
    required this.title,
    this.description,
    required this.value,
    this.paymentDate,
  }) {
    createdAt = DateTime.now().toIso8601String();
  }

  String id = '';
  String title = '';
  String? description = '';
  double value = 0;
  String? paymentDate;
  String? createdAt;

  Map<String, dynamic> toMap() {
    return {
      'id': id,
      'title': title,
      'description': description,
      'value': value,
      'paymentDate': paymentDate,
      'createdAt': createdAt,
    };
  }

  static ExpenseModel fromMap(Map<String, dynamic> data) {
    return ExpenseModel(
      id: data['id'],
      title: data['title'],
      description: data['description'],
      value: data['value'],
      paymentDate: data['paymentDate'],
    );
  }
}
