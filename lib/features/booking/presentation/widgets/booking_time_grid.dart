import 'package:flutter/material.dart';
import 'package:mari_nail_app/core/theme/app_colors.dart';

class BookingTimeGrid extends StatefulWidget {
  const BookingTimeGrid({super.key});

  @override
  State<BookingTimeGrid> createState() => _BookingTimeGridState();
}

class _BookingTimeGridState extends State<BookingTimeGrid> {
  final List<Map<String, dynamic>> timeSlots = [
    {"time": "9:00 AM", "available": true},
    {"time": "10:00 AM", "available": true},
    {"time": "11:00 AM", "available": true},
    {"time": "12:00 PM", "available": true},
    {"time": "1:00 PM", "available": false},
    {"time": "2:00 PM", "available": true},
    {"time": "3:00 PM", "available": false},
    {"time": "4:00 PM", "available": true},
    {"time": "5:00 PM", "available": true},
    {"time": "6:00 PM", "available": true},
    {"time": "7:00 PM", "available": true},
    {"time": "8:00 PM", "available": false},
  ];
  // --- Time Disable will show when user chose staff first ---//
  String? selectedTime;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(24),
      decoration: BoxDecoration(
        color: AppColors.backgroundBG,
        borderRadius: BorderRadius.circular(24), // Matches the Figma card
        boxShadow: [
          BoxShadow(
            color: Colors.black.withValues(alpha: 0.3),
            blurRadius: 10,
            offset: const Offset(0, 4),
          ),
        ],
      ),
      child: GridView.builder(
        shrinkWrap: true,
        physics: const NeverScrollableScrollPhysics(),
        gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 3,
          childAspectRatio: 2.5,
          crossAxisSpacing: 20,
          mainAxisSpacing: 10,
        ),
        itemCount: timeSlots.length,
        itemBuilder: (context, index) {
          final slot = timeSlots[index];
          final bool isAvailable = slot["available"];
          final bool isSelected = selectedTime == slot["time"];

          return GestureDetector(
            onTap: isAvailable
                ? () {
                    selectedTime = slot['time'];
                    Navigator.pop(context, selectedTime);
                  }
                : null,
            child: Container(
              alignment: Alignment.center,
              decoration: BoxDecoration(
                color: isSelected ? AppColors.primary : AppColors.backgroundBG,
                borderRadius: BorderRadius.circular(20),
                border: Border.all(
                  color: isSelected
                      ? Colors.transparent
                      : isAvailable
                      ? Colors.pink[200]!
                      : Colors.grey[300]!,
                ),
              ),
              //
              child: Text(
                slot["time"],
                style: TextStyle(
                  fontSize: 15,
                  fontWeight: FontWeight.w500,
                  color: isSelected
                      ? Colors.white
                      : isAvailable
                      ? Colors.pink[200]
                      : Colors.grey[400],
                  decoration: isAvailable
                      ? TextDecoration.none
                      : TextDecoration.lineThrough,
                ),
              ),
            ),
          );
        },
      ),
    );
  }
}
