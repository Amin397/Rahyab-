
class QrModel {
  QrModel({
    this.target,
    this.ok,
    this.result,
  });

  String target;
  bool ok;
  Result result;

  factory QrModel.fromJson(Map<String, dynamic> json) => QrModel(
    target: json["target"],
    ok: json["ok"],
    result: Result.fromJson(json["result"]),
  );
}

class Result {
  Result({
    this.fname,
    this.lname,
    this.providerId,
    this.userIdentification,
    this.workgroupId,
    this.mobile,
    this.telephone,
    this.log,
    this.lat,
    this.senfUnitName,
    this.desc,
    this.address,
  });

  String fname;
  String lname;
  int providerId;
  int userIdentification;
  int workgroupId;
  String mobile;
  String telephone;
  String log;
  String lat;
  String senfUnitName;
  String desc;
  String address;

  factory Result.fromJson(Map<String, dynamic> json) => Result(
    fname: json["fname"],
    lname: json["lname"],
    providerId: json["providerId"],
    userIdentification: json["userIdentification"],
    workgroupId: json["workgroupId"],
    mobile: json["mobile"],
    telephone: json["telephone"],
    log: json["log"],
    lat: json["lat"],
    senfUnitName: json["senfUnitName"],
    desc: json["desc"],
    address: json["address"],
  );
}
