import 'package:araroma/presentation/screen/categories/categories_screen.dart';
import 'package:araroma/presentation/screen/favourites/favourites_screen.dart';
import 'package:araroma/presentation/screen/home/home_screen.dart';
import 'package:araroma/presentation/screen/profile/profile_screen.dart';
import 'package:araroma/presentation/screen/random/random_screen.dart';
import 'package:flutter/material.dart';

class BottomNavigation extends StatelessWidget {
  final int selectedIndex;
  final BuildContext context;
  const BottomNavigation({
    super.key,
    required this.context,
    required this.selectedIndex,
  });

  void _onItemTapped(int index) {
    const List routes = [
      HomeScreen(),
      FavouritesScreen(),
      RandomScreen(),
      CategoriesScreen(),
      ProfileScreen(),
    ];
    if (index < routes.length && index != selectedIndex) {
      if (index == 0) {
        Navigator.pushReplacement(
          context,
          MaterialPageRoute(
            builder: (context) => routes[index],
          ),
        );
      } else {
        Navigator.pushAndRemoveUntil(
          context,
          MaterialPageRoute(
            builder: (context) => routes[index],
          ),
          (route) => route.isFirst,
        );
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: Theme.of(context).colorScheme.secondaryContainer,
        borderRadius: const BorderRadius.only(
          topLeft: Radius.circular(20),
          topRight: Radius.circular(20),
        ),
      ),
      child: BottomNavigationBar(
        currentIndex: selectedIndex,
        elevation: 0,
        backgroundColor: Colors.transparent,
        selectedItemColor: Theme.of(context).colorScheme.onSurface,
        unselectedItemColor: Theme.of(context)
            .colorScheme
            .onSecondaryContainer
            .withAlpha((0.8 * 255).toInt()),
        showUnselectedLabels: false,
        type: BottomNavigationBarType.fixed,
        items: [
          BottomNavigationBarItem(
            icon: Padding(
              padding: EdgeInsets.only(top: 8.0),
              child: Icon(
                Icons.home,
                size: 32,
              ),
            ),
            label: 'Home',
          ),
          BottomNavigationBarItem(
            icon: Padding(
              padding: EdgeInsets.only(top: 8.0),
              child: Icon(
                Icons.favorite,
                size: 32,
              ),
            ),
            label: 'Favourites',
          ),
          BottomNavigationBarItem(
            icon: Container(
              width: 42,
              height: 42,
              decoration: BoxDecoration(
                color: Theme.of(context).colorScheme.primary,
                shape: BoxShape.circle,
              ),
              child: Icon(
                Icons.shuffle,
                size: 32,
                color: Theme.of(context).colorScheme.onPrimary,
              ),
            ),
            label: 'Random',
          ),
          BottomNavigationBarItem(
            icon: Padding(
              padding: EdgeInsets.only(top: 8.0),
              child: Icon(
                Icons.category,
                size: 32,
              ),
            ),
            label: 'Categories',
          ),
          BottomNavigationBarItem(
            icon: Padding(
              padding: EdgeInsets.only(top: 8.0),
              child: Icon(
                Icons.person,
                size: 32,
              ),
            ),
            label: 'Profile',
          ),
        ],
        onTap: (index) {
          _onItemTapped(index);
        },
      ),
    );
  }
}
