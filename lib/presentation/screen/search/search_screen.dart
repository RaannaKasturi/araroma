import 'package:araroma/presentation/screen/notifications/notification_screen.dart';
import 'package:araroma/presentation/widgets/bottom_navigation.dart';
import 'package:flutter/material.dart';

class SearchScreen extends StatelessWidget {
  const SearchScreen({super.key});

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
        title: const Text('S E A R C H  M E A L S'),
        actions: [
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
        selectedIndex: 4,
      ),
      body: Center(
        child: Text(
          'Search Screen',
          style: Theme.of(context).textTheme.displaySmall,
        ),
      ),
    );
  }
}
