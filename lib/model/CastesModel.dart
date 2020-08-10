
class CastesModel
{
  int id;
  String name;
  String icon;

  CastesModel({
    this.id,
    this.name,
    this.icon,
  });

  factory CastesModel.fromJson(Map<String, dynamic> json) => CastesModel(
    id: json["id"],
    name: json["name"],
    icon: json["icon"],
  );
}