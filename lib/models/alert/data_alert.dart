class DataAlert {
  String message;
  String title;
  TypeAlert type;
  Map<String, dynamic> payload;

  DataAlert(this.message, this.title, this.type, {this.payload});
}

enum TypeAlert { success, error, warning, other }
