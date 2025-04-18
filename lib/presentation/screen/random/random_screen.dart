import 'package:araroma/presentation/screen/notifications/notification_screen.dart';
import 'package:araroma/presentation/screen/search/search_screen.dart';
import 'package:araroma/presentation/widgets/bottom_navigation.dart';
import 'package:flutter/material.dart';

class RandomScreen extends StatelessWidget {
  const RandomScreen({super.key});

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
        title: const Text('R A N D O M  M E A L'),
        actions: [
          IconButton(
            color: Theme.of(context).colorScheme.onSurface,
            icon: const Icon(
              Icons.search,
            ),
            onPressed: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => const SearchScreen(),
                ),
              );
            },
          ),
          IconButton(
            color: Theme.of(context).colorScheme.onSurface,
            icon: const Stack(
              children: [
                Icon(
                  Icons.notifications,
                ),
                Positioned(
                  right: 0,
                  child: CircleAvatar(
                    radius: 6,
                    backgroundColor: Colors.red,
                  ),
                ),
              ],
            ),
            onPressed: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => const NotificationScreen(),
                ),
              );
            },
          ),
        ],
      ),
      bottomNavigationBar: BottomNavigation(
        context: context,
        selectedIndex: 2,
      ),
      body: Center(
        child: Text(
          'Random Screen',
          style: Theme.of(context).textTheme.displaySmall,
        ),
      ),
    );
  }
}
