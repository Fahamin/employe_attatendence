
class AttendanceModel{

  String? id;
  String? date;
  String? checkIn;
  String? checkOut;
  String? createAt;


  AttendanceModel(
      {
        this.id,
        this.date,
        this.checkIn,
        this.checkOut,
        this.createAt});

  AttendanceModel.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    date = json['date'];
    checkIn = json['checkIn'];
    checkOut = json['checkOut'];
    createAt = json['createAt'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['date'] = this.date;
    data['checkIn'] = this.checkIn;
    data['checkOut'] = this.checkOut;
    data['createAt'] = this.createAt;

    return data;
  }
}