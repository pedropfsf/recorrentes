import 'package:uuid/uuid.dart';

const uuid = Uuid();

class ExpenseModel {
  ExpenseModel({
    required this.id,
    required this.title,
    this.description,
    required this.value,
    this.isPaid,
    this.paymentDate,
  }) {
    isPaid = false;
    createdAt = DateTime.now().toIso8601String();
  }

  String id = '';
  String title = '';
  String? description = '';
  double value = 0;
  String? paymentDate;
  bool? isPaid;
  String? createdAt;

  Map<String, dynamic> toMap() {
    return {
      'id': id,
      'title': title,
      'description': description,
      'value': value,
      'paymentDate': paymentDate,
      'isPaid': isPaid,
      'createdAt': createdAt,
    };
  }

  static ExpenseModel fromMap(Map<String, dynamic> data) {
    return ExpenseModel(
      id: data['id'],
      title: data['title'],
      description: data['description'],
      value: data['value'],
      isPaid: data['isPaid'],
      paymentDate: data['paymentDate'],
    );
  }
}
