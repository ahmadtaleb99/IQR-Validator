import 'package:flutter/material.dart';

void ShowAlertWidget(BuildContext context) {
  showDialog(barrierDismissible: true,
      context: context,
      builder: (context)
  {
    return Dialog(
      child: Column(
        children: [
          const CircularProgressIndicator(),
          const SizedBox(height: 10,)


        ],
      ),
    );
  });
      // });
}