class WithdrawModel{
  String? uid;
  double? amount;
  String? number;
  bool granted = false;

  WithdrawModel({this.uid, this.amount, this.number});

  Map<String, dynamic> toJson()=>{
    "uid":uid,
    "amount":amount,
    "number":number,
    "granted":granted
  };

  WithdrawModel.fromJson(Map<String, dynamic> json){
    try{
      uid = json["uid"];
    }catch(e){

    }
    try{
      amount = json["amount"];
    }catch(c){

    }
    try{
      number = json["number"];
    }catch(e){

    }
    try{
      granted = json["granted"];
    }catch(e){

    }
  }


}