class DataAlert {
  String message;
  String title;
  TypeAlert type;
  bool isShow;
  Map<String, dynamic> payload;

  DataAlert(this.message, this.title, this.type, this.isShow, {this.payload});

  setShow(show) {
    this.isShow = show;
  }
}

enum TypeAlert { success, error, warning, other }
