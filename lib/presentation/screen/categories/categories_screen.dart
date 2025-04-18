import 'package:araroma/data/data_sources/categories.dart';
import 'package:araroma/model/category.dart';
import 'package:araroma/presentation/screen/notifications/notification_screen.dart';
import 'package:araroma/presentation/screen/search/search_screen.dart';
import 'package:araroma/presentation/widgets/bottom_navigation.dart';
import 'package:araroma/presentation/widgets/shimmer_category_card.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class CategoriesScreen extends ConsumerWidget {
  const CategoriesScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final AsyncValue<List<Category>> categories =
        ref.watch(getcategoriesDataProvider);

    Future<void> refresh() async {
      ref.invalidate(getcategoriesDataProvider);
    }

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
        title: const Text('C A T E G O R I E S'),
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
        selectedIndex: 3,
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(
          horizontal: 10,
        ),
        child: categories.when(
          data: (data) {
            return RefreshIndicator(
              onRefresh: refresh,
              child: GridView.builder(
                padding: const EdgeInsets.symmetric(
                  vertical: 10,
                ),
                physics: const AlwaysScrollableScrollPhysics(),
                gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                  mainAxisSpacing: 10,
                  crossAxisSpacing: 10,
                  crossAxisCount: 2,
                ),
                itemCount: data.length,
                itemBuilder: (BuildContext context, int index) {
                  final category = data[index];
                  return Card(
                    color: Theme.of(context).colorScheme.tertiaryContainer,
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        CircleAvatar(
                          backgroundColor:
                              Theme.of(context).colorScheme.primary,
                          radius: 50,
                          child: Image.network(
                            category.image,
                            fit: BoxFit.contain,
                            width: 100,
                            height: 100,
                          ),
                        ),
                        const SizedBox(height: 10),
                        Text(
                          category.category,
                          style: Theme.of(context).textTheme.titleLarge,
                        ),
                      ],
                    ),
                  );
                },
              ),
            );
          },
          error: (error, stackTrace) => Center(
            child: Text('Error: $error'),
          ),
          loading: () => GridView.builder(
            itemCount: 10,
            gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
              crossAxisCount: 2,
              crossAxisSpacing: 10,
              mainAxisSpacing: 10,
            ),
            itemBuilder: (context, index) => const ShimmerCategoryCard(),
          ),
        ),
      ),
    );
  }
}
