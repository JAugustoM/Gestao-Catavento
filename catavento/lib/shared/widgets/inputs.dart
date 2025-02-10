import 'package:catavento/constants.dart';
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
    double screenHeight = MediaQuery.of(context).size.height;
    double screenWidth = MediaQuery.of(context).size.width;

    return Padding(
      padding: const EdgeInsets.only(right: 0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text(
            labelText,
            style: TextStyle(
              fontSize: screenHeight * 0.018,
              fontFamily: "FredokaOne",
              fontWeight: FontWeight.bold,
              color: AppColors.gradientDarkBlue,
            ),
          ),
          const SizedBox(height: 5),
          TextField(
              controller: controller,
              cursorHeight: screenWidth * 0.016,
              style: TextStyle(
                  fontFamily: "FredokaOne",
                  color: Color.fromRGBO(0, 0, 0, 90),
                  fontSize: screenHeight * 0.016),
              keyboardType: keyboardType,
              obscureText: isPassword,
              inputFormatters: inputFormatters,
              maxLines: maxLines,
              decoration: InputDecoration(
                contentPadding: EdgeInsets.symmetric(
                    vertical: screenHeight * 0.01,
                    horizontal: screenWidth * 0.015),
                isDense: true,
                hintText: hintText,
                hintStyle: TextStyle(
                    fontFamily: "FredokaOne",
                    fontWeight: FontWeight.normal,
                    fontSize: screenHeight * 0.016,
                    color: Colors.black.withOpacity(0.5)),
                filled: true,
                fillColor: Colors.white,
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(screenHeight * 0.02),
                ),
                enabledBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(screenHeight * 0.02),
                  borderSide: BorderSide(color: AppColors.mediumPink, width: 2),
                ),
                focusedBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(screenHeight * 0.02),
                  borderSide: BorderSide(color: AppColors.pink, width: 2),
                ),
                focusColor: AppColors.lightGray,
              )),
        ],
      ),
    );
  }
}

Widget inputDate(TextEditingController controller) {
  return Row(
    mainAxisAlignment: MainAxisAlignment.start,
    children: [
      SizedBox(
        width: 95,
        height: 25,
        //input da data
        child: TextField(
          controller: controller,
          inputFormatters: [dateInputFormat],
          style: TextStyle(
            fontSize: 15,
            color: Color.fromRGBO(0, 0, 0, 90),
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
