// import 'package:flutter/material.dart';


// class ActionButtons extends StatelessWidget {
//   @override
//   Widget build(BuildContext context) {
//     final diceBloc = DiceProvider.of(context);

//     return Align(
//       alignment: Alignment.bottomCenter,
//       child: Row(
//         mainAxisAlignment: MainAxisAlignment.spaceEvenly,
//         children: <Widget>[
//           FloatingActionButton(
//             onPressed: () => diceBloc.decrementDice(),
//             tooltip: 'Decrement',
//             child: Icon(Icons.arrow_downward),
//           ),
//           FloatingActionButton(
//             shape: RoundedRectangleBorder(
//                 borderRadius: BorderRadius.all(Radius.circular(10.0))),
//             onPressed: () => diceBloc.rollDice(),
//             tooltip: 'Roll',
//             child: ThemedImage('rolling'),
//           ),
//           FloatingActionButton(
//             onPressed: () => diceBloc.incrementDice(),
//             tooltip: 'Increment',
//             child: Icon(Icons.arrow_upward),
//           ),
//         ],
//       ),
//     );
//   }
// }