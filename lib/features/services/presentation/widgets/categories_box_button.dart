import 'package:flutter/material.dart';
import 'package:mari_nail_app/core/theme/app_colors.dart';
import 'package:mari_nail_app/features/services/data/models/categories_models.dart';
import 'package:mari_nail_app/features/services/presentation/providers/booking_provider.dart';
import 'package:provider/provider.dart';

class CategoriesBoxButton extends StatefulWidget {
  const CategoriesBoxButton({super.key});

  @override
  State<CategoriesBoxButton> createState() => _CategoriesBoxButtonState();
}

class _CategoriesBoxButtonState extends State<CategoriesBoxButton> {
  int? selectedCategoryId;

  @override
  void initState() {
    super.initState();
    context.read<BookingProvider>().getCategories();
  }

  @override
  Widget build(BuildContext context) {
    final provider = context.watch<BookingProvider>();
    final dynamicCategories = provider.categoriesList ?? [];

    if (provider.isLoading ||
        (dynamicCategories.isEmpty && provider.errorMessage == null)) {
      return const Center(child: CircularProgressIndicator());
    }

    if (provider.errorMessage != null && dynamicCategories.isEmpty) {
      return Center(child: Text(provider.errorMessage!));
    }

    if (dynamicCategories.isEmpty) {
      return const Center(
        child: Padding(
          padding: EdgeInsets.all(24.0),
          child: Text(
            'No available categories',
            style: TextStyle(
              fontSize: 16,
              fontWeight: FontWeight.w500,
              color: Colors.grey,
            ),
          ),
        ),
      );
    }

    if (selectedCategoryId == null && dynamicCategories.isNotEmpty) {
      selectedCategoryId = dynamicCategories.first.id;
    }

    final selectedCategory = dynamicCategories.firstWhere(
      (cat) => cat.id == selectedCategoryId,
      orElse: () => dynamicCategories.first,
    );

    final currentServices = [];

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Wrap(
          spacing: 8,
          children: dynamicCategories.map((CategoryModel category) {
            return ChoiceChip(
              selectedColor: AppColors.primary,
              disabledColor: Colors.transparent,
              elevation: 0,
              pressElevation: 0,
              label: Text(category.name),
              selected: selectedCategoryId == category.id,
              onSelected: (bool selected) {
                if (selected) {
                  setState(() {
                    selectedCategoryId = category.id;
                  });
                }
              },
            );
          }).toList(),
        ),

        const SizedBox(height: 16),

        if (currentServices.isEmpty)
          const Padding(
            padding: EdgeInsets.symmetric(vertical: 20),
            child: Text('No services available for this category.'),
          )
        else
          ListView.builder(
            shrinkWrap: true,
            physics: const NeverScrollableScrollPhysics(),
            itemCount: currentServices.length,
            itemBuilder: (context, index) {
              final service = currentServices[index];
              return ListTile(title: Text(service.name));
            },
          ),
      ],
    );
  }
}
