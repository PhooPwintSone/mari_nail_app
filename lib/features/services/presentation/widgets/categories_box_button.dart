import 'package:flutter/material.dart';
import 'package:mari_nail_app/core/theme/app_colors.dart';
import 'package:mari_nail_app/core/theme/text_styles.dart';
import 'package:mari_nail_app/core/widgets/small_button.dart';
import 'package:mari_nail_app/features/services/data/models/categories_models.dart';
import 'package:mari_nail_app/features/services/data/models/services_model.dart';
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
    context.read<BookingProvider>().getCategories().then((_) {
      if (mounted) {
        context.read<BookingProvider>().getAllservices();
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    final provider = context.watch<BookingProvider>();
    final dynamicCategories = provider.getcategoriesList ?? [];
    final dynamicServices = provider.servicesList ?? [];

    if (provider.isLoading) {
      return const Center(child: CircularProgressIndicator());
    }

    if (provider.errorMessage != null) {
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

    final currentServices = dynamicServices.where((dynamic item) {
      if (item is ServicesModel) {
        return item.categoryId == selectedCategoryId;
      }
      return false;
    }).toList();

    return Padding(
      padding: const EdgeInsets.only(top: 10),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Wrap(
            spacing: 5,
            children: dynamicCategories.map((CategoryModel category) {
              return Padding(
                padding: const EdgeInsets.symmetric(horizontal: 10),
                child: ChoiceChip(
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
                ),
              );
            }).toList(),
          ),

          const SizedBox(height: 16),

          if (currentServices.isEmpty)
            const Padding(
              padding: EdgeInsets.symmetric(vertical: 20),
              child: Center(
                child: Text('No services available for this category.'),
              ),
            )
          else
            ListView.builder(
              shrinkWrap: true,
              physics: const NeverScrollableScrollPhysics(),
              itemCount: currentServices.length,
              itemBuilder: (context, index) {
                final service = currentServices[index];
                return Padding(
                  padding: const EdgeInsets.symmetric(
                    horizontal: 25,
                    vertical: 8,
                  ),
                  child: Container(
                    decoration: BoxDecoration(
                      border: Border.all(color: AppColors.primary),
                      borderRadius: BorderRadius.circular(15),
                    ),
                    width: MediaQuery.of(context).size.width % 100,
                    height: MediaQuery.of(context).size.height % 100,
                    child: Row(
                      children: [
                        Padding(
                          padding: const EdgeInsets.symmetric(horizontal: 35),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Text(service.name, style: TextStyles.body1Medium),
                              Row(
                                children: [
                                  Text(
                                    '${service.price.toString()} Kyats',
                                    style: TextStyles.button1Medium,
                                  ),
                                  SizedBox(width: 30),
                                  Text(
                                    '(${service.durationInMinutes} mins)',
                                    style: TextStyle(color: Color(0xffFF9800)),
                                  ),
                                ],
                              ),
                            ],
                          ),
                        ),

                        Padding(
                          padding: const EdgeInsets.only(left: 70),
                          child: SmallButton(
                            label: "Book Now",
                            button2Action: () {},
                          ),
                        ),
                      ],
                    ),
                  ),
                );

                // ListTile(title: Text(service.name));
              },
            ),
        ],
      ),
    );
  }
}
