import 'package:flutter/material.dart';

class ResultScreen extends StatelessWidget {
  final Map<String, dynamic> result;

  const ResultScreen({super.key, required this.result});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Prediction Result'),
        backgroundColor: const Color(0xFF2E7D32),
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              // 🏆 Predicted Yield
              buildCard(
                icon: Icons.agriculture,
                title: "Predicted Yield",
                value: "${result["predicted_yield"]} bags per acre",
              ),

              // 📊 Confidence Range
              buildCard(
                icon: Icons.trending_up,
                title: "Confidence Range",
                value: result["confidence_range"],
              ),

              // 🌾 Yield Category
              buildCard(
                icon: result["category"] == "High Yield"
                    ? Icons.emoji_events
                    : (result["category"] == "Moderate Yield"
                    ? Icons.insights
                    : Icons.warning),
                title: "Category",
                value: result["category"],
              ),

              // 🛠️ Recommendation
              buildCard(
                icon: Icons.lightbulb,
                title: "Recommendation",
                value: result["recommendation"],
              ),

              // 🔍 Input Summary
              const SizedBox(height: 20),
              const Text(
                "🔍 Input Data Summary:",
                style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
              ),
              const SizedBox(height: 10),
              buildInputSummary(result["input_summary"]),

              const SizedBox(height: 20),
              Center(
                child: ElevatedButton(
                  onPressed: () {
                    Navigator.pop(context);
                  },
                  child: const Text('🔙 Go Back'),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  // 🔹 Card Widget for Displaying Data
  Widget buildCard({required IconData icon, required String title, required String value}) {
    return Card(
      elevation: 3,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
      margin: const EdgeInsets.symmetric(vertical: 8.0),
      child: ListTile(
        leading: Icon(icon, color: Colors.green, size: 30),
        title: Text(title, style: const TextStyle(fontSize: 18, fontWeight: FontWeight.bold)),
        subtitle: Text(value, style: const TextStyle(fontSize: 16)),
      ),
    );
  }

  // 🔍 Function to Build Input Data Summary
  Widget buildInputSummary(Map<String, dynamic> summary) {
    return Card(
      elevation: 2,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
      child: Padding(
        padding: const EdgeInsets.all(12.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: summary.entries.map((entry) {
            return Padding(
              padding: const EdgeInsets.symmetric(vertical: 4.0),
              child: Text(
                "${entry.key}: ${entry.value}",
                style: const TextStyle(fontSize: 16),
              ),
            );
          }).toList(),
        ),
      ),
    );
  }
}
