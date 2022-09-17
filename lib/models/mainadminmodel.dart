class MainAdminModel{
  String? bkashnumber;
  String? binaryaccount;
  MainAdminModel({this.bkashnumber, this.binaryaccount});

  Map<String, dynamic> toJson()=>{
    "bkashnumber":bkashnumber,
    "binaryaccount":binaryaccount
  };

  MainAdminModel.fromJson(Map<String, dynamic> json){
    try{
      bkashnumber = json["bkashnumber"];
    }catch(e){

    }

    try{
      binaryaccount = json["binaryaccount"];
    }catch(e){

    }
  }
}