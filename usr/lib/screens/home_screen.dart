import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> with SingleTickerProviderStateMixin {
  late AnimationController _controller;

  @override
  void initState() {
    super.initState();
    _controller = AnimationController(
      duration: const Duration(seconds: 4),
      vsync: this,
    )..repeat();
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(20.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              _buildHeader(),
              const SizedBox(height: 30),
              _buildCoreStatus(),
              const SizedBox(height: 30),
              Text("ACTIVE PROTOCOLS", style: Theme.of(context).textTheme.titleMedium?.copyWith(color: Colors.grey)),
              const SizedBox(height: 15),
              Expanded(
                child: GridView.count(
                  crossAxisCount: 2,
                  crossAxisSpacing: 15,
                  mainAxisSpacing: 15,
                  childAspectRatio: 1.1,
                  children: [
                    _buildModeCard(
                      context,
                      "Kreator Kodu",
                      Icons.code,
                      Colors.cyanAccent,
                      () => Navigator.pushNamed(context, '/mode/code'),
                    ),
                    _buildModeCard(
                      context,
                      "Analityk Danych",
                      Icons.analytics_outlined,
                      Colors.purpleAccent,
                      () {}, // Placeholder
                    ),
                    _buildModeCard(
                      context,
                      "Ewolucja Agentów",
                      Icons.hub_outlined,
                      Colors.pinkAccent,
                      () => Navigator.pushNamed(context, '/agents'),
                    ),
                    _buildModeCard(
                      context,
                      "S-Pen Neural",
                      Icons.edit_outlined,
                      Colors.amberAccent,
                      () {}, // Placeholder for S-Pen integration
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildHeader() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text("SYSTEM ONLINE", style: TextStyle(color: Theme.of(context).primaryColor, letterSpacing: 2, fontSize: 12)),
            const Text("GALAXY CORE", style: TextStyle(fontSize: 28, fontWeight: FontWeight.bold)),
          ],
        ),
        IconButton(
          icon: const Icon(Icons.settings_outlined),
          onPressed: () {},
        )
      ],
    );
  }

  Widget _buildCoreStatus() {
    return Container(
      padding: const EdgeInsets.all(20),
      decoration: BoxDecoration(
        color: Theme.of(context).cardColor,
        borderRadius: BorderRadius.circular(20),
        border: Border.all(color: Theme.of(context).primaryColor.withOpacity(0.3)),
        boxShadow: [
          BoxShadow(
            color: Theme.of(context).primaryColor.withOpacity(0.1),
            blurRadius: 20,
            spreadRadius: 0,
          )
        ],
      ),
      child: Row(
        children: [
          RotationTransition(
            turns: _controller,
            child: Container(
              width: 60,
              height: 60,
              decoration: BoxDecoration(
                shape: BoxShape.circle,
                gradient: SweepGradient(
                  colors: [
                    Theme.of(context).primaryColor,
                    Colors.transparent,
                  ],
                ),
              ),
            ),
          ),
          const SizedBox(width: 20),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const Text("NPU OPTIMIZATION", style: TextStyle(fontWeight: FontWeight.bold)),
              const SizedBox(height: 5),
              Text("98% Efficiency", style: TextStyle(color: Theme.of(context).primaryColor)),
              const SizedBox(height: 5),
              SizedBox(
                width: 150,
                child: LinearProgressIndicator(
                  value: 0.98,
                  backgroundColor: Colors.grey[800],
                  valueColor: AlwaysStoppedAnimation<Color>(Theme.of(context).primaryColor),
                ),
              )
            ],
          )
        ],
      ),
    );
  }

  Widget _buildModeCard(BuildContext context, String title, IconData icon, Color color, VoidCallback onTap) {
    return InkWell(
      onTap: onTap,
      borderRadius: BorderRadius.circular(16),
      child: Container(
        decoration: BoxDecoration(
          color: Theme.of(context).cardTheme.color,
          borderRadius: BorderRadius.circular(16),
          border: Border.all(color: color.withOpacity(0.3)),
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Icon(icon, size: 40, color: color),
            const SizedBox(height: 10),
            Text(title, style: const TextStyle(fontWeight: FontWeight.bold)),
          ],
        ),
      ),
    );
  }
}
