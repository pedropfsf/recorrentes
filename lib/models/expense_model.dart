class ExpenseModel {
  ExpenseModel({this.title, this.description}) {
    createdAt = DateTime.now().toIso8601String();
  }

  String? title = '';
  String? description = '';
  String? createdAt;
}
