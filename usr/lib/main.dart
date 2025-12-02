import 'package:flutter/material.dart';
import 'theme/ai_theme.dart';
import 'screens/home_screen.dart';
import 'screens/modes/code_creator_screen.dart';
import 'screens/agents/agent_evolution_screen.dart';

void main() {
  runApp(const UltraAiApp());
}

class UltraAiApp extends StatelessWidget {
  const UltraAiApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Ultra AI Core',
      debugShowCheckedModeBanner: false,
      theme: AiTheme.themeData,
      initialRoute: '/',
      routes: {
        '/': (context) => const HomeScreen(),
        '/mode/code': (context) => const CodeCreatorScreen(),
        '/agents': (context) => const AgentEvolutionScreen(),
      },
    );
  }
}
