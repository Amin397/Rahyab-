class ProviderModel {

  int id;
  int code;
  String fname;
  String lname;
  String mobile;
  String tel;
  String desc;
  String lng;
  String lat;
  String name;

  ProviderModel({
    this.id,
    this.code,
    this.fname,
    this.lname,
    this.mobile,
    this.tel,
    this.desc,
    this.lng,
    this.lat,
    this.name,
  });

  factory ProviderModel.fromJson(Map<String, dynamic> json) => ProviderModel(
    id: json["id"],
    code: json["code"],
    fname: json["fname"],
    lname: json["lname"],
    mobile: json["mobile"],
    tel: json["tel"],
    desc: json["desc"],
    lng: json["lng"],
    lat: json["lat"],
    name: json["name"],
  );
}