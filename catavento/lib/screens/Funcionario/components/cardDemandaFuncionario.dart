import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:catavento/shared/theme/colors.dart';

class CardDemanda extends StatelessWidget {
  final String title;
  final String description;
  final String codigo;
  final Color backgroundColor;
  final Color shadowColor;
  final VoidCallback onFinish;

  const CardDemanda({
    Key? key,
    required this.title,
    required this.description,
    required this.codigo,
    required this.backgroundColor,
    required this.shadowColor,
    required this.onFinish,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    double cardWidth = 400;
    double cardHeight = 600;
    return SizedBox(
      width: cardWidth,
      height: cardHeight,
      child: Card(
        color: backgroundColor,
        shadowColor: shadowColor,
        elevation: 5,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(10),
        ),
        child: Padding(
          padding: const EdgeInsets.all(15.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              // Título da tarefa
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Text(
                    title,
                    style: TextStyle(
                        fontSize: 18,
                        fontFamily: 'FredokaOne',
                        fontWeight: FontWeight.bold,
                        color: AppColors.gradientDarkBlue),
                  ),
                ],
              ),
              SizedBox(height: 10),

              Row(children: [
                Expanded(
                  child: ClipRRect(
                    borderRadius: BorderRadius.circular(15),
                    child: Image.asset(
                      'assets/images/photo.jpg', // URL da imagem
                      width: 100,
                      height: 150,
                      fit: BoxFit.cover,
                    ),
                  ),
                )
              ]),

              SizedBox(height: 10),
              // Descrição com scroll
              Expanded(
                child: Container(
                  padding: const EdgeInsets.all(10),
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(10),
                    boxShadow: [
                      BoxShadow(
                        color: Colors.black12,
                        blurRadius: 4,
                        offset: Offset(2, 2),
                      ),
                    ],
                  ),
                  child: SingleChildScrollView(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: [
                            Icon(
                              Icons.search,
                              size: 24,
                              color: AppColors.gradientDarkBlue,
                            ),
                            SizedBox(width: 8),
                            Text(
                              'Texto ao lado do ícone',
                              style: TextStyle(
                                  fontSize: 18,
                                  fontFamily: 'FredokaOne',
                                  color: AppColors.gradientDarkBlue),
                            ),
                          ],
                        ),
                        SizedBox(height: 20),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.start,
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: [
                            Text(
                              "Código: ",
                              style: TextStyle(
                                  fontSize: 16,
                                  fontWeight: FontWeight.bold,
                                  color: AppColors.gradientDarkBlue),
                            ),
                            SizedBox(height: 10),
                            Text(
                              codigo,
                              style: TextStyle(
                                  fontSize: 16,
                                  color: AppColors.gradientDarkBlue),
                            ),
                          ],
                        ),
                        SizedBox(height: 10),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.start,
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: [
                            Text(
                              "Descrição: ",
                              style: TextStyle(
                                fontSize: 16,
                                fontWeight: FontWeight.bold,
                                color: AppColors.gradientDarkBlue,
                              ),
                            ),
                            SizedBox(height: 10),
                            Text(
                              description, // Texto longo que pode ter rolagem
                              style: TextStyle(
                                fontSize: 16,
                                color: AppColors.gradientDarkBlue,
                              ),
                            ),
                          ],
                        ),
                      ],
                    ),
                  ),
                ),
              ),
              SizedBox(height: 10),
              // Botão de finalizar tarefa
              Align(
                alignment: Alignment.center,
                child: Container(
                  width: 300,
                  decoration: BoxDecoration(
                    gradient: LinearGradient(
                      colors: [
                        AppColors.gradientDarkBlue,
                        AppColors.gradientLightBlue,
                      ],
                      begin: Alignment.centerLeft,
                      end: Alignment.centerRight,
                    ),
                    borderRadius: BorderRadius.circular(22),
                  ),
                  child: ElevatedButton(
                    onPressed: onFinish,
                    style: ElevatedButton.styleFrom(
                      backgroundColor: Colors.transparent,
                      shadowColor: Colors.transparent,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(22),
                      ),
                    ),
                    child: const Text(
                      "Concluir Bolo",
                      style: TextStyle(
                        color: Colors.white,
                      ),
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
