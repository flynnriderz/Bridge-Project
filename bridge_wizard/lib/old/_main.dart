// import 'package:flutter/material.dart';
// import 'package:flutter/rendering.dart';



// void main() => runApp(MyApp());

// class MyApp extends StatelessWidget {
//   @override
//   Widget build(BuildContext context) {
//     return MaterialApp(
//       title: 'Bridge Wizard beta',
//       theme: ThemeData(
//         primarySwatch: Colors.green,
//         accentColor: Colors.deepOrangeAccent,
//         errorColor: Colors.grey,
//         fontFamily: 'Quicksand',
//         textTheme: ThemeData.light().textTheme.copyWith(
//               title: TextStyle(
//                 fontFamily: 'OpenSans',
//                 fontSize: 18,
//                 fontWeight: FontWeight.bold,
//               ),
//               button: TextStyle(
//                 color: Colors.white,
//                 fontWeight: FontWeight.bold,
//               ),
//             ),
//         appBarTheme: AppBarTheme(
//           textTheme: ThemeData.light().textTheme.copyWith(
//                 title: TextStyle(
//                   fontFamily: 'OpenSans',
//                   fontSize: 20,
//                   fontWeight: FontWeight.bold,
//                 ),
//               ),
//         ),
//       ),
//       home: MyHomePage(),
//     );
//   }
// }

// class MyHomePage extends StatefulWidget {

//   @override
//   _MyHomePageState createState() => _MyHomePageState();
// }

// class _MyHomePageState extends State<MyHomePage> {
//   final List<Transaction> _userTransactions = [
//     // Transaction(
//     //   id: 't1',
//     //   title: 'Some Shoes',
//     //   amount: 69.99,
//     //   date: DateTime.now(),
//     // ),
//     // Transaction(
//     //   id: 't2',
//     //   title: 'Another Groceries',
//     //   amount: 89.99,
//     //   date: DateTime.now(),
//     // ),
//   ];

//   List<Transaction> get _recentTransactions {
//     return _userTransactions.where((tx) {
//       return tx.date.isAfter(DateTime.now().subtract(
//         Duration(days: 7),
//       ));
//     }).toList();
//   }

//   void _addNewTransaction(String txTitle, double txAmount, DateTime chosenDate) {
//     final newTx = Transaction(
//       title: txTitle,
//       amount: txAmount,
//       date: chosenDate,
//       id: DateTime.now().toString(),
//     );

//     setState(() {
//       _userTransactions.add(newTx);
//     });
//   }

//   void _startAddNewTransaction(BuildContext ctx) {
//     showModalBottomSheet(
//       context: ctx,
//       builder: (_) {
//         return GestureDetector(
//           onTap: () {},
//           child: NewTransaction(_addNewTransaction),
//           behavior: HitTestBehavior.opaque,
//         );
//       },
//     );
//   }

//   void _deleteTransaction(String id){
//     setState(() {
//       _userTransactions.removeWhere((tx) => tx.id == id
//       );
//     });
//   }

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//         title: Text(
//           'Bridge Wizard (beta)',
//         ),
//         actions: <Widget>[
//           IconButton(
//             icon: Icon(Icons.add),
//             onPressed: () => _startAddNewTransaction(context),
//           )
//         ],
//       ),
//       body: SingleChildScrollView(
//         child: Column(
//           // mainAxisAlignment: MainAxisAlignment.start,
//           crossAxisAlignment: CrossAxisAlignment.center,
//           children: <Widget>[
//             Chart(_recentTransactions),
//             TransactionList(_userTransactions, _deleteTransaction),
//           ],
//         ),
//       ),
//       floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
//       floatingActionButton: FloatingActionButton(
//         child: Icon(Icons.add),
//         onPressed: () => _startAddNewTransaction(context),
//       ),
//     );
//   }
// }
