class TransactionModel{
  final int? id;
  final String income;
  final String amount;
  final String note;
  final String date;

  TransactionModel({this.id, required this.income, required this.amount, required this.note, required this.date,});

  factory TransactionModel.fromMap(Map<String,dynamic> map){
    return TransactionModel(
        id: map["id"],
        income:map["income"].toString(),
        amount: map["amount"].toString(),
        note: map["note"],
        date: map["date"]);
  }

  Map<String,dynamic> toMap(){
    return{
      'id':id,
      "income":income,
      "amount":amount,
      "note":note,
      "date":date
    };
  }

}