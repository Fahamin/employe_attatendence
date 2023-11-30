
class UserModel{

  String? id;
  String? email;
  String? name;
  String? employeeID;
  String? deparment;


  UserModel(
      {
        this.id,
        this.email,
        this.name,
        this.employeeID,
        this.deparment});

  UserModel.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    email = json['email'];
    name = json['name'];
    employeeID = json['employeeID'];
    deparment = json['deparment'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['email'] = this.email;
    data['name'] = this.name;
    data['employeeID'] = this.employeeID;
    data['deparment'] = this.deparment;

    return data;
  }
}