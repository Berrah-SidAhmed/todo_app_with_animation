import 'package:flutter/material.dart';

class cont extends StatelessWidget {
  String vartext;
  bool doneOrnote;
  Function changestatu;
  int iii;
  Function remove;
  cont(
      {required this.changestatu,
      required this.doneOrnote,
      required this.remove,
      required this.iii,
      required this.vartext});
  @override
  Widget build(BuildContext context) {
    return Center(
      child: GestureDetector(
        onTap: () {
          changestatu(iii);
        },
        child: FractionallySizedBox(
          widthFactor: .9,
          child: Center(
            child: Container(
              width: 500,
              margin: EdgeInsets.only(top: 18),
              padding: EdgeInsets.all(15),
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(15), color: Colors.black),
              child: Row(
                //crossAxisAlignment: CrossAxisAlignment.center,
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    vartext,
                    style: TextStyle(
                      fontFamily: 'erox',
                      fontSize: 30, color: Colors.white),
                  ),
                  Row(
                  
                    children: [
                      Icon(doneOrnote ? Icons.done : Icons.close,
                          color: doneOrnote ? Colors.green : Colors.red),
                      SizedBox(
                        width: 10,
                      ),
                      IconButton(
                        onPressed: () {
                          remove(iii);
                        },
                        icon: Icon(Icons.delete),
                        color: Colors.white,
                      )
                    ],
                  )
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
