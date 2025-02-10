import 'package:flutter/material.dart';
import 'package:catavento/shared/theme/colors.dart';

class ConfirmDialog extends StatelessWidget {
  final String title;
  final String contente;
  final VoidCallback onConfirm;

  const ConfirmDialog({
    super.key,
    required this.title,
    required this.contente,
    required this.onConfirm,
  });

  @override
  Widget build(BuildContext context) {
    double screenHeight = MediaQuery.of(context).size.height;
    double screenWidth = MediaQuery.of(context).size.width;

    return AlertDialog(
      title: Text(
        title,
        textAlign: TextAlign.center,
        style: TextStyle(
          fontFamily: "FredokaOne",
          fontSize: screenHeight * 0.02,
          fontWeight: FontWeight.bold,
          color: AppColors.gradientDarkBlue,
        ),
      ),
      content: Text(
        contente,
        style: TextStyle(
          fontFamily: "Fredoka",
          fontWeight: FontWeight.bold,
          fontSize: screenHeight * 0.02,
          color: AppColors.gradientDarkBlue,
        ),
      ),
      actions: <Widget>[
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            SizedBox(
              width: screenWidth * 0.1,
              height: screenHeight * 0.03,
              child: ElevatedButton(
                onPressed: onConfirm,
                style: ElevatedButton.styleFrom(
                  backgroundColor: Color(0xFF50B432),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(22),
                  ),
                ),
                child: Text(
                  "Sim",
                  style: TextStyle(
                    fontFamily: "FredokaOne",
                    fontSize: screenHeight * 0.02,
                    color: Colors.white,
                  ),
                ),
              ),
            ),
            SizedBox(width: screenWidth * 0.04),
            SizedBox(
              width: screenWidth * 0.1,
              height: screenHeight * 0.03,
              child: TextButton(
                onPressed: () {
                  Navigator.of(context).pop();
                },
                style: TextButton.styleFrom(
                  backgroundColor: Color(0xFFD54A3D),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(22),
                  ),
                ),
                child: Text(
                  "Não",
                  style: TextStyle(
                    fontFamily: "FredokaOne",
                    fontSize: screenHeight * 0.02,
                    color: Colors.white,
                  ),
                ),
              ),
            ),
          ],
        ),
      ],
    );
  }
}
