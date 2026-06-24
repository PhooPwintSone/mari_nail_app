import 'package:flutter/material.dart';

class AppbarBackButton extends StatelessWidget {
  final void Function()? buttonAction;
  final String buttonName;

  const AppbarBackButton({
    super.key,
    required this.buttonAction,
    required this.buttonName,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(top: 20, left: 10),
      child: GestureDetector(
        onTap: buttonAction,
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [Icon(Icons.arrow_back_ios), Text(buttonName)],
        ),
      ),
    );
  }
}
