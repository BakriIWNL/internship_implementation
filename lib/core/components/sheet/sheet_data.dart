class SheetData {

  SheetData({this.title = "Add new wallet",this.header = "Balance"});

  final String title;
  final String header;

  Map<String,SheetData> getSheetData(){ 
    return {
      'Expense':SheetData(title: 'Expense',header: 'How much?'),
      'Income':SheetData(title: 'Income',header: 'How much?'),
      'Balance':SheetData(title: 'Add new wallet',header: 'Balance'),
    };
  }
}