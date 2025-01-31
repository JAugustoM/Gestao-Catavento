import 'package:flutter/material.dart';
import 'package:catavento/shared/widgets/confirmDialog.dart';
import 'package:catavento/shared/theme/colors.dart';

class ReusableDialog extends StatelessWidget {
  final String title;
  final Widget body;
  final bool confirmBeforeClose;
  final Color backgroundColor;
  final BorderRadiusGeometry borderRadius;
  final String? closeRoute;

  const ReusableDialog({
    super.key,
    required this.title,
    required this.body,
    this.confirmBeforeClose = false,
    this.backgroundColor = AppColors.lightGray,
    this.borderRadius = const BorderRadius.all(Radius.circular(25)),
    this.closeRoute,
  });

  void _showCloseConfirmationDialog(BuildContext context) {
    showDialog(
      context: context,
      builder: (context) => ConfirmDialog(
        title: "Confirmar saída",
        contente: "Tem certeza de que deseja fechar esta janela?",
        onConfirm: () {
          Navigator.of(context).pop(); // Fecha o ConfirmDialog
          if (closeRoute != null) {
            Navigator.of(context).pushNamedAndRemoveUntil(
              closeRoute!,
              (route) => false, // Remove todas as rotas anteriores
            );
          } else {
            Navigator.of(context)
                .pop(); // Comportamento padrão: fecha o ReusableDialog
          }
        },
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    double screenHeight = MediaQuery.of(context).size.height;
    double screenWidth = MediaQuery.of(context).size.width;

    return Dialog(
      backgroundColor: backgroundColor,
      shape: RoundedRectangleBorder(borderRadius: borderRadius),
      child: Stack(
        children: [
          SizedBox(
            width: screenWidth * 0.4,
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                Padding(
                  padding: EdgeInsets.only(
                      left: screenWidth * 0.04,
                      right: screenWidth * 0.04,
                      top: screenHeight * 0.04,
                      bottom: screenHeight * 0.01),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(
                        title,
                        style: TextStyle(
                          fontSize: screenHeight * 0.025,
                          fontFamily: 'FredokaOne',
                          color: AppColors.gradientDarkBlue,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ],
                  ),
                ),
                // Corpo da dialog
                Flexible(
                  child: Padding(
                    padding: const EdgeInsets.symmetric(
                        vertical: 25.0, horizontal: 25.0),
                    child: body,
                  ),
                ),
              ],
            ),
          ),
          Positioned(
            top: screenHeight * 0.04,
            right: screenWidth * 0.01,
            child: GestureDetector(
              onTap: () {
                if (confirmBeforeClose) {
                  _showCloseConfirmationDialog(context);
                } else {
                  Navigator.pop(context);
                }
              },
              child: Container(
                width: screenWidth * 0.030,
                height: screenHeight * 0.030,
                decoration: BoxDecoration(
                  color: AppColors.gradientDarkBlue,
                  shape: BoxShape.circle,
                ),
                child: MouseRegion(
                  cursor: SystemMouseCursors.click,
                  child: Icon(
                    Icons.close,
                    color: Colors.white,
                    size: screenHeight * 0.022,
                  ),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
