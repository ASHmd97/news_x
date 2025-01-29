import 'package:flutter/material.dart';
import 'package:news_x/shared/app_theme.dart';

class HomeDrawer extends StatelessWidget {
  const HomeDrawer(this.onSelectedItem, {super.key});
  final void Function(DrawerItem) onSelectedItem;

  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
            padding: const EdgeInsets.only(top: 50),
            decoration: const BoxDecoration(color: AppTheme.primary),
            height: MediaQuery.sizeOf(context).height * 0.2,
            width: double.infinity,
            alignment: Alignment.center,
            child: Text(
              'News App!',
              style: Theme.of(context).textTheme.titleLarge,
            ),
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 12.0, vertical: 16),
            child: Column(
              children: [
                InkWell(
                  onTap: () {
                    onSelectedItem(DrawerItem.categories);
                  },
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.start,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      const Icon(
                        Icons.menu,
                        size: 40,
                      ),
                      const SizedBox(
                        width: 16,
                      ),
                      Text(
                        'Categories',
                        style: Theme.of(context)
                            .textTheme
                            .titleLarge
                            ?.copyWith(color: AppTheme.black),
                      )
                    ],
                  ),
                ),
                const SizedBox(height: 12),
                InkWell(
                  onTap: () {
                    onSelectedItem(DrawerItem.settings);
                  },
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.start,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      const Icon(
                        Icons.settings,
                        size: 40,
                      ),
                      const SizedBox(
                        width: 16,
                      ),
                      Text(
                        'Settings',
                        style: Theme.of(context)
                            .textTheme
                            .titleLarge
                            ?.copyWith(color: AppTheme.black),
                      )
                    ],
                  ),
                )
              ],
            ),
          ),
        ],
      ),
    );
  }
}

enum DrawerItem {
  categories,
  settings,
}
