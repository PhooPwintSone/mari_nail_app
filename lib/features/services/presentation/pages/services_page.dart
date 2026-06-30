import 'package:flutter/material.dart';
import 'package:mari_nail_app/core/theme/app_colors.dart';
import 'package:mari_nail_app/core/theme/text_styles.dart';
import 'package:mari_nail_app/core/widgets/notification_badge.dart';
import 'package:mari_nail_app/features/services/presentation/widgets/categories_box_button.dart';

class ServicesPage extends StatefulWidget {
  const ServicesPage({super.key});

  @override
  State<ServicesPage> createState() => _ServicesPageState();
}

class _ServicesPageState extends State<ServicesPage> {
  bool hasUnreadNotification = true;
  String _searchQuery = '';
  bool showNotification = true;
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
      appBar: AppBar(
        toolbarHeight: 100,
        backgroundColor: Colors.transparent,
        elevation: 0,

        title: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              'Our Services',
              style: TextStyles.heading1Semi.copyWith(
                color: AppColors.backgroundBG,
              ),
            ),
            const SizedBox(height: 8),
            Text(
              'Select services to build your booking',
              style: TextStyles.textNormal.copyWith(color: AppColors.secondary),
            ),
          ],
        ),

        flexibleSpace: Container(
          decoration: const BoxDecoration(
            gradient: LinearGradient(
              colors: [AppColors.primary, Color(0xff956970)],
            ),
          ),
        ),

        actions: showNotification
            ? [
                Align(
                  alignment: Alignment.center,
                  child: Padding(
                    padding: const EdgeInsets.only(right: 8, bottom: 8, top: 8),
                    child: NotificationBadge(
                      showBadge: hasUnreadNotification,
                      onTap: () {},
                      child: Container(
                        width: 40,
                        height: 40,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(12),
                          color: AppColors.backgroundBG,
                        ),
                        child: const Icon(
                          Icons.notifications,
                          color: AppColors.secondary,
                        ),
                      ),
                    ),
                  ),
                ),
              ]
            : null,
      ),

      //  BODY //
      body: Column(
        children: [
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 18, vertical: 8),
            child: SearchBar(
              controller: _searchController,
              hintText: 'Search services...',
              leading: const Icon(Icons.search, size: 30),

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
