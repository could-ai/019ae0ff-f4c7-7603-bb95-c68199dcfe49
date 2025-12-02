import 'package:flutter/material.dart';

class CodeCreatorScreen extends StatelessWidget {
  const CodeCreatorScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("KREATOR KODU"),
        actions: [
          IconButton(icon: const Icon(Icons.save_outlined), onPressed: () {}),
        ],
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [
            Container(
              padding: const EdgeInsets.all(16),
              decoration: BoxDecoration(
                color: Colors.black54,
                borderRadius: BorderRadius.circular(12),
                border: Border.all(color: Colors.cyanAccent.withOpacity(0.3)),
              ),
              child: const Row(
                children: [
                  Icon(Icons.auto_awesome, color: Colors.cyanAccent),
                  SizedBox(width: 10),
                  Expanded(child: Text("Tryb autonomiczny aktywny. Generowanie rozwiązań w czasie rzeczywistym...")),
                ],
              ),
            ),
            const SizedBox(height: 20),
            Expanded(
              child: Container(
                width: double.infinity,
                padding: const EdgeInsets.all(16),
                decoration: BoxDecoration(
                  color: const Color(0xFF1E1E1E),
                  borderRadius: BorderRadius.circular(12),
                ),
                child: const Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text("// Czekam na instrukcje...", style: TextStyle(color: Colors.greenAccent, fontFamily: 'Courier')),
                    SizedBox(height: 10),
                    Text("void initiateSequence() {", style: TextStyle(color: Colors.blueAccent, fontFamily: 'Courier')),
                    Text("  // Galaxy S24 NPU engaged", style: TextStyle(color: Colors.grey, fontFamily: 'Courier')),
                    Text("}", style: TextStyle(color: Colors.blueAccent, fontFamily: 'Courier')),
                  ],
                ),
              ),
            ),
            const SizedBox(height: 20),
            TextField(
              decoration: InputDecoration(
                hintText: "Opisz problem do rozwiązania...",
                filled: true,
                fillColor: Theme.of(context).cardColor,
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(30),
                  borderSide: BorderSide.none,
                ),
                suffixIcon: const Icon(Icons.send, color: Colors.cyanAccent),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
