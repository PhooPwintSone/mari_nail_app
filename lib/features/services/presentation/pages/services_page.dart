import 'package:flutter/material.dart';
import 'package:mari_nail_app/core/theme/app_colors.dart';
import 'package:mari_nail_app/core/widgets/appBar_style2.dart';
import 'package:mari_nail_app/features/services/presentation/widgets/categories_box_button.dart';

class ServicesPage extends StatefulWidget {
  const ServicesPage({super.key});

  @override
  State<ServicesPage> createState() => _ServicesPageState();
}

class _ServicesPageState extends State<ServicesPage> {
  bool hasUnreadNotification = true;
  String _searchQuery = '';
  final TextEditingController _searchController = TextEditingController();

  @override
  void dispose() {
    _searchController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.backgroundBG,
      appBar: AppBarStyle2(
        showNotification: true,
        hasUnreadNotification: hasUnreadNotification,
        backButtonAction: () {},
        onNotificationTap: () {
          setState(() {
            hasUnreadNotification = false;
          });
        },
        mainText: "Our Services",
        subText: "Select services to build your booking",
      ),
      body: Column(
        children: [
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 18, vertical: 8),
            child: SearchBar(
              controller: _searchController,
              hintText: 'Search services...',
              leading: const Icon(Icons.search),

              shape: WidgetStateProperty.all(
                const RoundedRectangleBorder(
                  borderRadius: BorderRadius.all(Radius.circular(12.0)),
                ),
              ),
              side: WidgetStateProperty.all(
                const BorderSide(color: AppColors.primary, width: 1.5),
              ),
              trailing: [
                if (_searchQuery.isNotEmpty)
                  IconButton(
                    icon: const Icon(Icons.clear),
                    onPressed: () {
                      setState(() {
                        _searchController.clear();
                        _searchQuery = '';
                      });
                    },
                  ),
              ],
              onChanged: (value) {
                setState(() {
                  _searchQuery = value;
                });
              },
              elevation: WidgetStateProperty.all(0),
            ),
          ),

          CategoriesBoxButton(),
        ],
      ),
    );
  }
}
