import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:catavento/shared/theme/colors.dart';

class InputTextField extends StatelessWidget {
  final String labelText;
  final String hintText;
  final TextEditingController? controller;
  final TextInputType keyboardType;
  final bool isPassword;
  final int? maxLines;
  final List<TextInputFormatter>? inputFormatters;

  const InputTextField({
    super.key,
    required this.labelText,
    required this.hintText,
    this.controller,
    this.keyboardType = TextInputType.text,
    this.isPassword = false,
    this.maxLines,
    this.inputFormatters,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(right: 0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            labelText,
            style: TextStyle(
              fontSize: 16,
              fontWeight: FontWeight.bold,
              color: AppColors.gradientDarkBlue,
            ),
          ),
          const SizedBox(height: 5),
          TextField(
              controller: controller,
              keyboardType: keyboardType,
              obscureText: isPassword,
              inputFormatters: inputFormatters,
              maxLines: maxLines,
              decoration: InputDecoration(
                isDense: true,
                hintText: hintText,
                filled: true,
                fillColor: Colors.white,
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(20),
                ),
                enabledBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(20),
                  borderSide: BorderSide(
                      color: AppColors.mediumPink,
                      width: 2), // Cor e espessura da borda
                ),
                focusedBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(20),
                  borderSide: BorderSide(
                      color: AppColors.pink, width: 2), // Cor da borda ao focar
                ),
                focusColor: AppColors.lightGray,
              )),
        ],
      ),
    );
  }
}

Widget inputDate() {
  return Row(
    mainAxisAlignment: MainAxisAlignment.start,
    children: [
      SizedBox(
        width: 95,
        height: 25,
        //input da data
        child: TextField(
          style: TextStyle(
            fontSize: 15,
            color: Colors.black,
          ),
          textAlignVertical: TextAlignVertical.center,
          maxLines: 1,
          decoration: InputDecoration(
              hintText: 'dd/mm/yy',
              hintStyle:
                  TextStyle(fontSize: 15, color: Colors.black.withOpacity(0.5)),
              contentPadding:
                  EdgeInsets.symmetric(vertical: 2.0, horizontal: 10.0),
              filled: true,
              fillColor: Colors.white,
              border: OutlineInputBorder(
                borderRadius: BorderRadius.circular(10),
                borderSide: BorderSide(color: AppColors.mediumPink, width: 2),
              ),
              enabledBorder: OutlineInputBorder(
                borderRadius: BorderRadius.circular(10),
                borderSide: BorderSide(color: AppColors.mediumPink, width: 2),
              ),
              focusedBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(10),
                  borderSide: BorderSide(color: AppColors.pink, width: 2))),
        ),
      ),
      SizedBox(
        width: 10,
      ),
      Icon(
        Icons.calendar_month,
        color: AppColors.gradientLightBlue,
      )
    ],
  );
}
