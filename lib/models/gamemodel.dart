

class GameModel{
  String? name;
  String? boardType;
  int? slotonecapacity;
  int? slottwocapacity;
  int? entryFee;
  int? winingPrize;
  List<String> slotoneusers = [];
  List<String> slottwousers = [];
  int? winner;
  DateTime addedTime=DateTime.now();
  DateTime? start;
  DateTime? end;

  GameModel({this.name, this.boardType, this.slotonecapacity, this.slottwocapacity, this.entryFee, this.winingPrize, this.winner, this.start, this.end});

  Map<String, dynamic> toJson()=>{
    "name":name,
    "boardType":boardType,
    "slotonecapacity":slotonecapacity,
    "slottwocapacity":slottwocapacity,
    "entryFee":entryFee,
    "winingPrize":winingPrize,
    "slotoneusers":slotoneusers,
    "slottwousers":slottwousers,
    "winner":winner,
    "addedTime":addedTime,
    "start":start,
    "end":end
  };

  GameModel.fromJson(Map<String, dynamic> json){
    try{
      name = json["name"];
    }catch(e){

    }
    try{
      boardType = json["boardType"];
    }catch(e){

    }
    try{
      slotonecapacity = json["slotonecapacity"];
    }catch(e){

    }
    try{
      slottwocapacity = json["slottwocapacity"];
    }catch(e){

    }
    try{
      entryFee = json["entryFee"];
    }catch(e){

    }
    try{
      winingPrize = json["winingPrize"];
    }catch(e){

    }
    try{
      if(json["slotoneusers"]!=null){
        slotoneusers = [];
        json["slotoneusers"].forEach((e){
          slotoneusers.add(e);
        });
      }else{
        slotoneusers = [];
      }
    }catch(e){

    }
    try{
      if(json["slottwousers"]!=null){
        slottwousers = [];
        json["slottwousers"].forEach((e){
          slottwousers.add(e);
        });
      }else{
        slottwousers = [];
      }
    }catch(e){

    }
    try{
      winner = json["winner"];
    }catch(e){

    }
    try{
      //print(json["lastWithdraw"]);
      addedTime = DateTime.fromMillisecondsSinceEpoch(json["addedTime"].seconds*1000);

    }catch(e){
      print("getting problem");
    }
    try{
      //print(json["lastWithdraw"]);
      start = DateTime.fromMillisecondsSinceEpoch(json["start"].seconds*1000);

    }catch(e){
      print("getting problem");
    }
    try{
      //print(json["lastWithdraw"]);
      end = DateTime.fromMillisecondsSinceEpoch(json["end"].seconds*1000);

    }catch(e){
      print("getting problem");
    }
  }

}