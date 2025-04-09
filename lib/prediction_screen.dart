import 'package:flutter/material.dart';

class PredictionScreen extends StatelessWidget {
  final double yieldValue;

  const PredictionScreen({super.key, required this.yieldValue});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Prediction Result"),
        backgroundColor: const Color(0xFF2E7D32),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const Text(
              "Predicted Maize Yield:",
              style: TextStyle(fontSize: 22, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 10),
            Text(
              "$yieldValue bags per acre",
              style: const TextStyle(fontSize: 26, fontWeight: FontWeight.bold, color: Colors.green),
            ),
            const SizedBox(height: 20),
            ElevatedButton(
              onPressed: () {
                Navigator.pop(context); // Go back to Dashboard
              },
              child: const Text("Go Back"),
            ),
          ],
        ),
      ),
    );
  }
}
