import 'package:flutter/material.dart';
import 'dart:math' as math;
import '../../../../core/localization/l10n.dart';
import 'package:bmp/shared/widgets/custom_bottom_navbar.dart';

// No changes are needed for the main screen structure, AppBar, or Category Grid.
// They are included to provide a complete, runnable example.
class AppsScreenB extends StatefulWidget {
  const AppsScreenB({super.key});

  @override
  State<AppsScreenB> createState() => _AppsScreenState();
}

class _AppsScreenState extends State<AppsScreenB> {
  int selectedIndex = 0;

  void _onItemTapped(int index) {
    setState(() {
      selectedIndex = index;
    });
    // Handle navigation based on index
    switch (index) {
      case 0:
        // Navigate to chats
        break;
      case 1:
        // Navigate to calls
        break;
      case 2:
        // Handle FAB action (add/create)
        break;
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFF1F252D),
      body: const SafeArea(
        bottom: false,
        child: Column(
          children: [
            CustomAppBar(),
            Expanded(
              child: CategoryGrid(),
            ),
          ],
        ),
      ),
      bottomNavigationBar: CustomBottomNavBar(
        selectedIndex: selectedIndex,
        onItemTapped: _onItemTapped,
      ),
    );
  }
}

class CustomAppBar extends StatelessWidget {
  const CustomAppBar({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.fromLTRB(16, 8, 16, 16),
      decoration: const BoxDecoration(
        color: Color(0xFF202267),
        borderRadius: BorderRadius.only(
          bottomLeft: Radius.circular(18),
          bottomRight: Radius.circular(18),
        ),
      ),
      child: Column(
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Row(
                children: [
                  GestureDetector(
                    onTap: () => Navigator.pop(context),
                    child: CircleAvatar(
                      backgroundColor: Colors.grey[400],
                      radius: 22,
                      child: const Icon(Icons.arrow_back, color: Colors.white, size: 28),
                    ),
                  ),
                  const SizedBox(width: 16),
                  Image.asset(
                    'assets/logo.png',
                    width: 105,
                    height: 43,
                  ),
                ],
              ),
              Row(
                children: [
                  Container(
                    width: 54,
                    height: 61,
                    padding: const EdgeInsets.symmetric(horizontal: 4),
                    child: CircleAvatar(
                      backgroundColor: Colors.white,
                      radius: 22,
                      child: Image.asset(
                        'assets/icons/user.png',
                        width: 22,
                        height: 22,
                      ),
                    ),
                  ),
                  const SizedBox(width: 4),
                  Container(
                    width: 54,
                    height: 61,
                    padding: const EdgeInsets.symmetric(horizontal: 4),
                    child: CircleAvatar(
                      backgroundColor: Colors.white,
                      radius: 22,
                      child: Image.asset(
                        'assets/icons/notification.png',
                        width: 22,
                        height: 22,
                      ),
                    ),
                  ),
                  const SizedBox(width: 4),
                  Container(
                    width: 54,
                    height: 61,
                    padding: const EdgeInsets.symmetric(horizontal: 4),
                    child: CircleAvatar(
                      backgroundColor: Colors.white,
                      radius: 22,
                      child: Image.asset(
                        'assets/icons/menu.png',
                        width: 22,
                        height: 22,
                      ),
                    ),
                  ),
                ],
              ),
            ],
          ),
          const SizedBox(height: 16),
          TextField(
            decoration: InputDecoration(
              hintText: L10n.of(context).searchApps,
              hintStyle: TextStyle(color: Colors.white.withOpacity(0.64)),
              prefixIcon: Icon(Icons.search, color: Colors.white.withOpacity(0.64)),
              suffixIcon: Icon(Icons.filter_list, color: Colors.white.withOpacity(0.64)),
              filled: true,
              fillColor: Colors.white.withOpacity(0.2),
              border: OutlineInputBorder(
                borderRadius: BorderRadius.circular(100),
                borderSide: BorderSide.none,
              ),
              contentPadding: const EdgeInsets.symmetric(vertical: 0),
            ),
          ),
        ],
      ),
    );
  }
}

class CategoryGrid extends StatefulWidget {
  const CategoryGrid({super.key});

  @override
  State<CategoryGrid> createState() => _CategoryGridState();
}

class _CategoryGridState extends State<CategoryGrid> {
  List<Map<String, dynamic>> _getCategories(BuildContext context) => [
    {'name': L10n.of(context).education, 'icon': 'assets/Apps/Education.png', 'selected': false},
    {'name': L10n.of(context).game, 'icon': 'assets/Apps/Game.png', 'selected': false},
    {'name': L10n.of(context).sport, 'icon': 'assets/Apps/Sport.png', 'selected': false},
    {'name': L10n.of(context).animal, 'icon': 'assets/Apps/Animal.png', 'selected': false},
    {'name': L10n.of(context).love, 'icon': 'assets/Apps/Love.png', 'selected': false},
    {'name': L10n.of(context).traveling, 'icon': 'assets/Apps/Traveling.png', 'selected': false},
    {'name': L10n.of(context).music, 'icon': 'assets/Apps/Music.png', 'selected': false},
    {'name': L10n.of(context).automotive, 'icon': 'assets/Apps/Automotive.png', 'selected': false},
    {'name': L10n.of(context).popular, 'icon': 'assets/Apps/Popular.png', 'selected': false},
    {'name': L10n.of(context).food, 'icon': 'assets/Apps/Food.png', 'selected': false},
    {'name': L10n.of(context).health, 'icon': 'assets/Apps/Health.png', 'selected': false},
    {'name': L10n.of(context).shopping, 'icon': 'assets/Apps/Shopping.png', 'selected': false},
    {'name': L10n.of(context).art, 'icon': 'assets/Apps/Art.png', 'selected': false},
    {'name': L10n.of(context).spiritual, 'icon': 'assets/Apps/Spiritual.png', 'selected': false},
    {'name': L10n.of(context).maintenance, 'icon': 'assets/Apps/Maintenance.png', 'selected': false},
    {'name': L10n.of(context).lifestyle, 'icon': 'assets/Apps/Lifestyle.png', 'selected': false},
    {'name': L10n.of(context).construction, 'icon': 'assets/Apps/construction.png', 'selected': false},
    {'name': L10n.of(context).camera, 'icon': 'assets/Apps/Camera.png', 'selected': false},
  ];

  @override
  Widget build(BuildContext context) {
    final categories = _getCategories(context);
    return GridView.builder(
      padding: const EdgeInsets.all(20.0),
      gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: 3,
        crossAxisSpacing: 16,
        mainAxisSpacing: 16,
        childAspectRatio: 0.96,
      ),
      itemCount: categories.length,
      itemBuilder: (context, index) {
        final category = categories[index];
        return CategoryCard(
          name: category['name'],
          icon: category['icon'],
          isSelected: category['selected'],
          onTap: () {
            setState(() {
              for (int i = 0; i < categories.length; i++) {
                categories[i]['selected'] = i == index;
              }
            });
          },
        );
      },
    );
  }
}

class CategoryCard extends StatelessWidget {
  final String name;
  final String icon;
  final bool isSelected;
  final VoidCallback onTap;

  const CategoryCard({
    super.key,
    required this.name,
    required this.icon,
    required this.onTap,
    this.isSelected = false,
  });

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      borderRadius: BorderRadius.circular(12),
      child: Container(
        width: 96,
        height: 100,
        decoration: BoxDecoration(
          color: isSelected ? const Color(0xFF202267) : const Color(0xFF333C46),
          borderRadius: BorderRadius.circular(12),
          border: Border.all(
            color: isSelected ? const Color(0xFF4754FF) : const Color(0xFF394551),
            width: isSelected ? 1.5 : 2.0,
          ),
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Image.asset(
              icon,
              width: 32,
              height: 32,
            ),
            const SizedBox(height: 12),
            Text(
              name,
              style: const TextStyle(
                color: Colors.white,
                fontSize: 14,
                fontWeight: FontWeight.w500,
              ),
              textAlign: TextAlign.center,
            ),
          ],
        ),
      ),
    );
  }
}