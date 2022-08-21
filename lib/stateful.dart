import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';

class MyWidget extends StatefulWidget {
  const MyWidget({
    Key? key,
  }) : super(key: key);

  @override
  State<MyWidget> createState() => _MyWidgetState();
}

// MediaQuery.of(context).size.height
class _MyWidgetState extends State<MyWidget> {
  int count = 0;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Row(
        children: [
          Container(
            color: Colors.yellow,
            child: Column(children: [Text("1"), Text("2")]),
          ),
          Container(
            color: Colors.green,
            child: Column(children: [Text("1"), Text("2")]),
          ),
          // MaterialButton(
          //   onPressed: () {
          //     print("Material button pressed");
          //   },
          //   child: Container(
          //     decoration: BoxDecoration(
          //       color: Colors.blue,
          //       borderRadius: BorderRadius.circular(12),
          //       border: Border.all(width: 2, color: Colors.black),
          //     ),
          //     // margin: EdgeInsets.symmetric(horizontal: 40, vertical: 12),
          //     padding: EdgeInsets.all(12),
          //     child: Text("Material"),
          //   ),
          // ),
          Text("Number: ${count}"),
          CupertinoButton(
              padding: EdgeInsets.zero,
              minSize: 8,
              color: Colors.orange,
              child: Container(
                decoration: BoxDecoration(
                  color: count % 2 == 0 ? Colors.purple : Colors.blue,
                  borderRadius: BorderRadius.circular(12),
                  border: Border.all(width: 2, color: Colors.black),
                ),
                // margin: EdgeInsets.symmetric(horizontal: 40, vertical: 12),
                padding: EdgeInsets.all(3),
                child: Text("Material"),
              ),
              onPressed: () {
                setState(() {
                  count += 1;
                });
                print(count);
              })
        ],
      ),
    );
  }
}
