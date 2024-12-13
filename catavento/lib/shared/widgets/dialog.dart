import 'package:flutter/material.dart';
import 'package:catavento/shared/widgets/confirmDialog.dart';

class ReusableDialog extends StatelessWidget {
  final String title;
  final Widget body;
  final bool confirmBeforeClose;
  final Color backgroundColor;
  final BorderRadiusGeometry borderRadius;

  const ReusableDialog({
    super.key,
    required this.title,
    required this.body,
    this.confirmBeforeClose = false,
    this.backgroundColor = const Color(0xFFD1EEFF),
    this.borderRadius = const BorderRadius.all(Radius.circular(16)),
  });

  void _showCloseConfirmationDialog(BuildContext context) {
    showDialog(
      context: context,
      builder: (context) => ConfirmDialog(
        title: "Confirmar saída",
        contente: "Tem certeza de que deseja fechar esta janela?",
        onConfirm: () =>
            Navigator.of(context).popUntil((route) => route.isFirst),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Dialog(
      backgroundColor: backgroundColor,
      shape: RoundedRectangleBorder(borderRadius: borderRadius),
      child: SizedBox(
        width: 534,
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            // Header com título e botão de fechar
            Padding(
              padding: const EdgeInsets.all(16.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    title,
                    style: const TextStyle(
                      fontSize: 20,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  IconButton(
                    onPressed: () {
                      if (confirmBeforeClose) {
                        _showCloseConfirmationDialog(context);
                      } else {
                        Navigator.pop(context);
                      }
                    },
                    icon: const Icon(Icons.close, size: 25),
                  )
                ],
              ),
            ),
            // Corpo da dialog
            Flexible(
              child: Padding(
                padding: const EdgeInsets.symmetric(
                    vertical: 16.0, horizontal: 16.0),
                child: body,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
