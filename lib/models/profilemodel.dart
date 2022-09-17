class ProfileModel{
  String? uid;
  String? mail;
  int? totalBalance;

  ProfileModel({this.uid, this.mail, this.totalBalance});
  Map<String, dynamic>toJson()=>{
    "uid":uid,
    "mail":mail,
    "totalBalance":totalBalance
  };

  ProfileModel.fromJson(Map<String,dynamic> json){
    try{
      uid = json["uid"];
    }catch(e){

    }

    try{
      mail = json["mail"];
    }catch(e){

    }

    try{
      totalBalance = json["totalBalance"];
    }catch(e){

    }
  }
}