import 'package:catavento/screens/Desempenho/components/listaDiario.dart';
import 'package:catavento/screens/Desempenho/components/listaMensal.dart';
import 'package:catavento/screens/Desempenho/components/listaSemanal.dart';
import 'package:catavento/shared/theme/colors.dart';
import 'package:catavento/shared/widgets/dialog.dart';
import 'package:catavento/shared/widgets/dropdown.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';

class FuncionariosCardDesempenho extends StatefulWidget {
  final String emailFuncionario;
  final String nomeFuncionario;
  final String setor;

  FuncionariosCardDesempenho({
    required this.emailFuncionario,
    required this.nomeFuncionario,
    required this.setor,
  });

  @override
  State<FuncionariosCardDesempenho> createState() {
    return FuncionariosCardDesempenhoState();
  }
}

class FuncionariosCardDesempenhoState
    extends State<FuncionariosCardDesempenho> {
  //Dados temporarios
  late String email;
  late String nome;
  late String setor;

  @override
  void initState() {
    super.initState();
    email = widget.emailFuncionario;
    nome = widget.nomeFuncionario;
    setor = widget.setor;
  }

  final List<Map<String, String>> bolos = [
    {
      'nomeDemanda': '{nomeDemanda}',
      'inicio': '10:50',
      'fim': '11:40',
      'duracao': '00:50',
      'image': '../catavento/assets/images/cake.png'
    },
    {
      'nomeDemanda': '{nomeDemanda}',
      'inicio': '10:50',
      'fim': '11:40',
      'duracao': '00:50',
      'image': '../catavento/assets/images/cake.png'
    },
    {
      'nomeDemanda': '{nomeDemanda}',
      'inicio': '10:50',
      'fim': '11:40',
      'duracao': '00:50',
      'image': '../catavento/assets/images/cake.png'
    },
    {
      'nomeDemanda': '{nomeDemanda}',
      'inicio': '10:50',
      'fim': '11:40',
      'duracao': '00:50',
      'image': '../catavento/assets/images/cake.png'
    },
    {
      'nomeDemanda': '{nomeDemanda}',
      'inicio': '10:50',
      'fim': '11:40',
      'duracao': '00:50',
      'image': '../catavento/assets/images/cake.png'
    },
    {
      'nomeDemanda': '{nomeDemanda}',
      'inicio': '10:50',
      'fim': '11:40',
      'duracao': '00:50',
      'image': '../catavento/assets/images/cake.png'
    },
  ];

  @override
  Widget build(BuildContext context) {
    double screenWidth = MediaQuery.of(context).size.width;
    double screenHeight = MediaQuery.of(context).size.height;

    return Card(
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(20),
      ),
      color: AppColors.lightGray,
      child: Row(
        children: [
          SizedBox(
            width: screenWidth * 0.01,
          ),
          Icon(
            Icons.person,
            color: AppColors.gradientLightBlue,
            size: screenWidth * 0.045,
          ),
          SizedBox(
            width: screenWidth * 0.01,
          ),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  widget.nomeFuncionario,
                  style: TextStyle(
                      fontSize: screenHeight * 0.018,
                      fontFamily: "FredokaOne",
                      fontWeight: FontWeight.bold,
                      color: AppColors.gradientLightBlue),
                ),
                Row(children: [
                  Text(
                    'Setor: ',
                    style: TextStyle(
                      fontSize: MediaQuery.of(context).size.height * 0.018,
                      fontFamily: "FredokaOne",
                      color: AppColors.gradientLightBlue,
                    ),
                  ),
                  Text(widget.setor,
                      style: TextStyle(
                        fontSize: MediaQuery.of(context).size.height * 0.018,
                        fontFamily: "Fredoka",
                        fontWeight: FontWeight.bold,
                        color: AppColors.gradientLightBlue,
                      ))
                ]),
              ],
            ),
          ),
          IconButton(
            icon: Icon(
              Icons.info,
              color: AppColors.gradientLightBlue,
              size: screenWidth * 0.018,
            ),
            onPressed: () {
              _showInfoDialog(context, nome, setor);
            },
          )
        ],
      ),
    );
  }

  void _showInfoDialog(
    BuildContext context,
    String nome,
    String setor,
  ) {
    showDialog(
      context: context,
      builder: (context) {
        return ReusableDialog(
          backgroundColor: AppColors.lightGray,
          title: nome,
          body: SingleChildScrollView(
            // Adicionando SingleChildScrollView para evitar overflow
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Container(
                  padding: const EdgeInsets.all(16),
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius:
                        BorderRadius.circular(16), // Bordas arredondadas
                  ),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Row(
                        children: [
                          Icon(
                            Icons.person,
                            color: AppColors.gradientDarkBlue,
                            size: MediaQuery.of(context).size.width * 0.016,
                          ),
                          SizedBox(width: 10),
                          Text(
                            'Dados',
                            style: TextStyle(
                              color: AppColors.gradientDarkBlue,
                              fontSize:
                                  MediaQuery.of(context).size.height * 0.024,
                              fontFamily: "FredokaOne",
                            ),
                          )
                        ],
                      ),
                      Center(
                          child: CircleAvatar(
                        radius: MediaQuery.of(context).size.height * 0.07,
                        backgroundColor: Colors.grey.shade200,
                        child: Icon(
                          Icons.person,
                          color: AppColors.gradientDarkBlue,
                          size: MediaQuery.of(context).size.width * 0.07,
                        ),
                      )),
                      SizedBox(
                        height: MediaQuery.of(context).size.height * 0.05,
                      ),
                      Center(
                        child: Column(
                          children: [
                            Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Text(
                                  'Nome: ',
                                  style: TextStyle(
                                    fontSize:
                                        MediaQuery.of(context).size.height *
                                            0.026,
                                    fontFamily: "FredokaOne",
                                    color: AppColors.gradientDarkBlue,
                                  ),
                                ),
                                Text(
                                  nome,
                                  style: TextStyle(
                                      fontSize:
                                          MediaQuery.of(context).size.height *
                                              0.026,
                                      fontFamily: "Fredoka",
                                      fontWeight: FontWeight.bold,
                                      color: AppColors.gradientDarkBlue),
                                )
                              ],
                            ),
                            SizedBox(
                              height: MediaQuery.of(context).size.height * 0.03,
                            ),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Text(
                                  'Setor: ',
                                  style: TextStyle(
                                      fontSize:
                                          MediaQuery.of(context).size.height *
                                              0.026,
                                      fontFamily: "FredokaOne",
                                      color: AppColors.gradientDarkBlue,
                                      fontWeight: FontWeight.bold),
                                ),
                                Text(
                                  setor,
                                  style: TextStyle(
                                      fontSize:
                                          MediaQuery.of(context).size.height *
                                              0.026,
                                      fontFamily: "Fredoka",
                                      fontWeight: FontWeight.bold,
                                      color: AppColors.gradientDarkBlue),
                                )
                              ],
                            ),
                            SizedBox(
                              height: MediaQuery.of(context).size.height * 0.03,
                            ),
                            SizedBox(
                              width: MediaQuery.of(context).size.width * 0.2,
                              height:
                                  MediaQuery.of(context).size.height * 0.047,
                              child: Container(
                                decoration: BoxDecoration(
                                  gradient: LinearGradient(
                                    colors: [
                                      AppColors.gradientDarkBlue,
                                      AppColors.gradientLightBlue
                                    ],
                                    begin: Alignment.centerLeft,
                                    end: Alignment.centerRight,
                                  ),
                                  borderRadius: BorderRadius.circular(22),
                                ),
                                child: ElevatedButton(
                                  onPressed: () {
                                    _showDesempenhoDialog(context);
                                  },
                                  style: ElevatedButton.styleFrom(
                                    backgroundColor: Colors.transparent,
                                    shadowColor: Colors.transparent,
                                    shape: RoundedRectangleBorder(
                                      borderRadius: BorderRadius.circular(22),
                                    ),
                                  ),
                                  child: Text(
                                    "Ver Desempenhos",
                                    style: TextStyle(
                                        color: Colors.white,
                                        fontSize:
                                            MediaQuery.of(context).size.height *
                                                0.022),
                                  ),
                                ),
                              ),
                            )
                          ],
                        ),
                      )
                    ],
                  ),
                ),
              ],
            ),
          ),
        );
      },
    );
  }

  void _showDesempenhoDialog(BuildContext context) {
    showDialog(
      context: context,
      builder: (context) {
        // Variável para controlar qual lista será exibida
        String selectedValue = 'hoje';

        return StatefulBuilder(
          builder: (context, setState) {
            return ReusableDialog(
              backgroundColor: AppColors.lightGray,
              title: 'Desempenhos',
              body: SingleChildScrollView(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    CustomDropdownDesempenho(
                      initialValue: selectedValue,
                      onChanged: (value) {
                        setState(() {
                          selectedValue = value; // Atualiza o valor selecionado
                        });
                      },
                    ),
                    // Exibe a lista correspondente ao valor selecionado
                    if (selectedValue == 'hoje')
                      Listadiario(emailFuncionario: email),
                    if (selectedValue == 'semanal')
                      Listasemanal(emailFuncionario: email),
                    if (selectedValue == 'mensal')
                      Listamensal(
                          emailFuncionario: email), // Sua lista mensal aqui
                  ],
                ),
              ),
            );
          },
        );
      },
    );
  }
}
