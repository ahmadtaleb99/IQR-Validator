import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

void ShowAlertWidget(BuildContext context,String title,String discreption,Color color) {
  showDialog(
      context: context,
      builder: (context)
  {
    return CupertinoAlertDialog(
      title: Text(title),
      content: Text(discreption),
      actions: <Widget>[
        TextButton(
            onPressed: () {

            },
            child: Text('Close')),
        TextButton(
          onPressed: () {
            print('HelloWorld!');
          },
          child: Text('HelloWorld!'),
        )
      ],
    );
  });
      // });
}