import 'package:flutter/material.dart';

class contor extends StatelessWidget {
  int all;
  int hsab;
  contor({required this.all,required this.hsab});
  @override
  Widget build(BuildContext context) {
    return Container(
      width: 200,
      decoration: BoxDecoration(
        color: Colors.black,
        borderRadius: BorderRadius.circular(20)
      ),
      margin: EdgeInsets.fromLTRB(0, 10, 0, 10),
      child: Center(
        child: Text(
          "${hsab}/${all}",
          style: TextStyle(
            fontFamily: 'erox',
            fontSize: 80, color:                                 
          hsab == all && all != 0? Colors.green : Colors.white
            ),
        ),
      ),
    );
  }
}
