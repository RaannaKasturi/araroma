import 'package:araroma/presentation/widgets/bottom_navigation.dart';
import 'package:flutter/material.dart';

class NotificationScreen extends StatelessWidget {
  const NotificationScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Theme.of(context).colorScheme.secondaryContainer,
        leading: IconButton.filled(
          style: IconButton.styleFrom(
            backgroundColor: Theme.of(context).colorScheme.surfaceContainer,
          ),
          onPressed: () {
            Navigator.pop(context);
          },
          icon: const Icon(Icons.arrow_back_ios_new),
        ),
        title: const Text('N O T I F I C A T I O N S'),
      ),
      bottomNavigationBar: BottomNavigation(
        context: context,
        selectedIndex: 4,
      ),
      body: Center(
        child: Text(
          'Notification Screen',
          style: Theme.of(context).textTheme.displaySmall,
        ),
      ),
    );
  }
}
