
class WorkModel
{

  int id;
  String name;
  String icon;

  WorkModel(this.id, this.name, this.icon);

  factory WorkModel.fromJson(Map<String, dynamic> json) => WorkModel(
        json['id'],
        json['name'],
        json['icon'],
      );
}
