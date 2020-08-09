
class WorkModel
{

  int work_id;
  String work_name;
  String work_icon;

  WorkModel(this.work_id, this.work_name, this.work_icon);

  factory WorkModel.fromJson(Map<String, dynamic> json) => WorkModel(
        json['id'],
        json['work_name'],
        json['work_icon'],
      );
}
