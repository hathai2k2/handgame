import 'package:flutter/material.dart';

class CustomDialog extends StatelessWidget {
  final String message;

  const CustomDialog({super.key, required this.message});

  @override
  Widget build(BuildContext context) {
    return Dialog(
      child: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: <Widget>[
            Text(
              message,
              style: const TextStyle(
                fontSize: 20,
                letterSpacing: 2,
                color: Colors.red,
              ),
            ),
            const SizedBox(height: 16),
            ElevatedButton(
              onPressed: () {
                Navigator.of(context).pop(); 
              },
              child: const Text("Close"),
            ),
          ],
        ),
      ),
    );
  }
}
