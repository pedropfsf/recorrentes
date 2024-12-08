class ExpenseModel {
  ExpenseModel({
    required this.title,
    this.description,
    required this.value,
    this.paymentDate,
  }) {
    createdAt = DateTime.now().toIso8601String();
  }

  String title = '';
  String? description = '';
  int value = 0;
  String? paymentDate;
  String? createdAt;
}
