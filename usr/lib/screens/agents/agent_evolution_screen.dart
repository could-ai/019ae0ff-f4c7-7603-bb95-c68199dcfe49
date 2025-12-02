import 'package:flutter/material.dart';

class AgentEvolutionScreen extends StatelessWidget {
  const AgentEvolutionScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("ZARZĄDZANIE AGENTAMI"),
      ),
      body: ListView(
        padding: const EdgeInsets.all(16),
        children: [
          _buildCreateAgentCard(context),
          const SizedBox(height: 20),
          const Text("AKTYWNE SUB-AGENTY", style: TextStyle(color: Colors.grey, letterSpacing: 1.5)),
          const SizedBox(height: 10),
          _buildAgentTile(context, "Alpha-1", "Optymalizacja Systemu", 0.95, Colors.greenAccent),
          _buildAgentTile(context, "Beta-Coder", "Refaktoryzacja", 0.78, Colors.blueAccent),
          _buildAgentTile(context, "Gamma-Analyst", "Przetwarzanie Danych", 0.45, Colors.orangeAccent),
        ],
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {},
        backgroundColor: Theme.of(context).primaryColor,
        child: const Icon(Icons.add, color: Colors.black),
      ),
    );
  }

  Widget _buildCreateAgentCard(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(20),
      decoration: BoxDecoration(
        gradient: LinearGradient(
          colors: [
            Theme.of(context).primaryColor.withOpacity(0.2),
            Theme.of(context).secondaryColor.withOpacity(0.2),
          ],
        ),
        borderRadius: BorderRadius.circular(16),
        border: Border.all(color: Theme.of(context).primaryColor),
      ),
      child: const Column(
        children: [
          Icon(Icons.psychology, size: 48, color: Colors.white),
          SizedBox(height: 10),
          Text("Stwórz Nowego Agenta", style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold)),
          Text("Zdefiniuj cel i przydziel zasoby NPU", style: TextStyle(color: Colors.grey)),
        ],
      ),
    );
  }

  Widget _buildAgentTile(BuildContext context, String name, String task, double progress, Color color) {
    return Card(
      margin: const EdgeInsets.only(bottom: 12),
      child: ListTile(
        leading: CircleAvatar(
          backgroundColor: color.withOpacity(0.2),
          child: Icon(Icons.smart_toy_outlined, color: color),
        ),
        title: Text(name, style: const TextStyle(fontWeight: FontWeight.bold)),
        subtitle: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(task),
            const SizedBox(height: 5),
            LinearProgressIndicator(
              value: progress,
              backgroundColor: Colors.grey[800],
              valueColor: AlwaysStoppedAnimation(color),
              minHeight: 2,
            ),
          ],
        ),
        trailing: Text("${(progress * 100).toInt()}%"),
      ),
    );
  }
}
