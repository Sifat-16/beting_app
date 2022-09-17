class RechargeModel{
  String? uid;
  String? amount;
  String? transactionId;
  RechargeModel({this.uid, this.amount, this.transactionId});

  Map<String, dynamic> toJson()=>{
    "uid":uid,
    "amount":amount,
    "transactionId":transactionId
  };
}