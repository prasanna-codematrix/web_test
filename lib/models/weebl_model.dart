class WeeblModel {
  String? id;
  String? question;
  String? ansOne;
  String? ansTwo;
  String? owner;
  bool? isPublic;
  bool? isSelected;

  WeeblModel(
      {this.id,
      this.question,
      this.owner,
      this.ansOne,
      this.ansTwo,
      this.isSelected = false,
      this.isPublic});
}
