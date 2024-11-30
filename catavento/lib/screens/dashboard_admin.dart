import 'dart:ffi';

import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'dart:ui';

//Plano de fundo
class DashBoardAdmin extends StatelessWidget {
  const DashBoardAdmin({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Stack(
      children: [
        //Tela de fundo
        Container(
          width: double.infinity,
          height: double.infinity,
          decoration: BoxDecoration(
              gradient: LinearGradient(
            colors: [Color(0xFF75CDF3), Color(0xFFB2E8FF)],
            begin: Alignment.topCenter,
            end: Alignment.bottomCenter,
          )),
          child: Center(child: AddDemandPageAdmin()),
        ),

        //Icon menu
        IconMenu()
      ],
    ));
  }
}

//Estrutura da pagina
class AddDemandPageAdmin extends StatefulWidget {
  const AddDemandPageAdmin({super.key});

  @override
  State<AddDemandPageAdmin> createState() {
    return AddDemandPageAdminState();
  }
}

//Estrutura da pagina
class AddDemandPageAdminState extends State<AddDemandPageAdmin> {
  @override
  Widget build(BuildContext context) {
    String formattedDate = DateFormat('dd/MM/yyyy').format(DateTime.now());

    return Stack(
      children: [
        Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              //Titulo
              Text(
                'Demandas atuais $formattedDate',
                style: TextStyle(fontSize: 29.5, color: Color(0xFF015C98)),
              ),

              SizedBox(height: 40),

              //Barra de pesquisa
              Search(),

              SizedBox(
                height: 30,
              ),

              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  QuadroPrioridade(),
                  SizedBox(
                    width: 16,
                  ),
                  ListDemanda(),
                  SizedBox(
                    width: 16,
                  ),
                  QuadroGrafico()
                ],
              ),

              SizedBox(
                height: 37,
              ),

              ButtonAddDemanda()
            ],
          ),
        )
      ],
    );
  }
}

//Icon Menu
class IconMenu extends StatefulWidget {
  const IconMenu({super.key});

  @override
  State<IconMenu> createState() {
    return IconMenuState();
  }
}

//Icon Menu
class IconMenuState extends State<IconMenu> {
  @override
  Widget build(BuildContext context) {
    //Icon Menu
    return Positioned(
      top: 20,
      left: 20,
      child: IconButton(
        iconSize: 50,
        onPressed: () {
          //Logica do menu
        },
        icon: Icon(Icons.menu),
        color: Color(0xFF015C98),
      ),
    );
  }
}

//Graficos
class QuadroGrafico extends StatefulWidget {
  const QuadroGrafico({super.key});

  @override
  State<QuadroGrafico> createState() {
    return QuadroGraficoState();
  }
}

//Graficos
class QuadroGraficoState extends State<QuadroGrafico> {
  int completas = 8; //quantidade de bolos prontos (trocar)
  int restantes = 2; //quantidade de bolos restantes (trocar)
  int total = 10; //quantidade total de bolos (trocar)
  String fabricacao = '1';
  String espera = '1';

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        //Grafico 1
        Container(
            width: 340,
            height: 132,
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.circular(12),
            ),
            child: Padding(
                padding: EdgeInsets.symmetric(vertical: 15.0, horizontal: 30.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      "Completas: $completas\n"
                      "Restantes: $restantes\n",
                      style: TextStyle(
                        fontSize: 17,
                        color: Colors.black,
                      ),
                    ),
                    SizedBox(
                      height: 2,
                    ),
                    Text(
                      "Total: $total",
                      style: TextStyle(
                          fontSize: 18,
                          fontWeight: FontWeight.bold,
                          color: Colors.black),
                    )
                  ],
                ))),

        SizedBox(
          height: 20,
        ),

        Container(
            width: 340,
            height: 132,
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.circular(12),
            ),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                Padding(
                  padding: EdgeInsets.only(top: 10.0, bottom: 10.0, left: 60.0),
                  child: Icon(
                    Icons.cake,
                    size: 80.0,
                    color: Colors.pink,
                  ),
                ),
                SizedBox(
                  width: 30,
                ),
                Padding(
                    padding: EdgeInsets.only(top: 25.0, right: 40.0),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.end,
                      children: [
                        Text(
                          fabricacao,
                          style: TextStyle(
                            fontSize: 30,
                            fontWeight: FontWeight.bold,
                            color: Colors.black,
                          ),
                        ),
                        SizedBox(
                          height: 2,
                        ),
                        Text(
                          "Em fabricação",
                          style: TextStyle(fontSize: 18, color: Colors.black),
                        )
                      ],
                    )),
              ],
            )),

        SizedBox(
          height: 30,
        ),

        Container(
            width: 340,
            height: 132,
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.circular(12),
            ),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                Padding(
                  padding: EdgeInsets.only(top: 10.0, bottom: 10.0, left: 60.0),
                  child: Icon(
                    Icons.layers,
                    size: 80.0,
                    color: Color(0xFF015C98),
                  ),
                ),
                SizedBox(
                  width: 40,
                ),
                Padding(
                    padding: EdgeInsets.only(top: 25.0, right: 20.0),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.end,
                      children: [
                        Text(
                          espera,
                          style: TextStyle(
                            fontSize: 30,
                            fontWeight: FontWeight.bold,
                            color: Colors.black,
                          ),
                        ),
                        SizedBox(
                          height: 2,
                        ),
                        Text(
                          "Em espera",
                          style: TextStyle(fontSize: 18, color: Colors.black),
                        )
                      ],
                    )),
              ],
            )),
      ],
    );
  }
}

class ListDemanda extends StatefulWidget {
  const ListDemanda({super.key});

  @override
  State<ListDemanda> createState() {
    return ListDemandaState();
  }
}

class ListDemandaState extends State<ListDemanda> {
  // lista apenas ilustrativa, já q ainda n temos a real lista de demandas
  final List<String> demandas = List.generate(10, (index) => "Demanda #$index");

  @override
  Widget build(BuildContext context) {
    return Container(
        padding: EdgeInsets.all(7.0),
        width: 499,
        height: 438,
        decoration: BoxDecoration(
            color: Color(0xFFFFFFFF), borderRadius: BorderRadius.circular(17)),
        child: ListView.builder(
          itemCount: demandas.length, // Número de itens na lista
          itemBuilder: (context, index) {
            return DemandCard(index: index); // Exibindo o card de demanda
          },
        ));
  }
}

//Botão de adicionar demanda
class ButtonAddDemanda extends StatefulWidget {
  const ButtonAddDemanda({super.key});

  @override
  State<ButtonAddDemanda> createState() {
    return ButtonAddDemandaState();
  }
}



class ButtonAddDemandaState extends State<ButtonAddDemanda> {

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: 189,
      height: 47,
      child: ElevatedButton(
        onPressed: () {
          // Lógica do botão
          AddInfoDemand();
        },
        style: ElevatedButton.styleFrom(
            backgroundColor: Color(0xFF015C98),
            shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(22))),
        child: Text(
          "Adicionar Demanda",
          style: TextStyle(
            color: Colors.white,
          ),
        ),
      ),
    );
  }

  Future AddInfoDemand() => showGeneralDialog(
    
    context: context,
    pageBuilder: (context, animation1, animation2) {
      return Container();
    },
    transitionBuilder: (context, a1, a2, widget) {
        return ScaleTransition(
          scale: Tween<double>(begin: 0.5, end: 1.0).animate(a1),
          child: AlertDialog(
            backgroundColor: Color(0xFFD1EEFF),
            content: SizedBox(
              height: 446,
              width: 534,
              child: Padding(
                padding: const EdgeInsets.only(top: 41),
                child: Column(
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.end,
                      children: [
                        Expanded(
                          child: Align(
                            alignment: Alignment.center,
                            child: Text(
                              "Nova demanda",
                              style: TextStyle(
                                fontSize: 20,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                          ),
                        ),
                        IconButton(
                          onPressed: () {
                            Navigator.pop(context);
                          },
                          icon: Icon(
                            Icons.close,
                            size: 25,
                          ),
                        )
                      ],
                    ),
                    
                    SizedBox(height: 47,),

                    Row(
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: [
                          Align(
                            alignment: Alignment.centerLeft,
                            child: Text(
                              "Código",
                              style: TextStyle(
                                fontSize: 15,
                                color: Colors.black,
                              ),
                            ),
                        ),

                        SizedBox(width: 10,),

                        //input codigo
                        inputNameID(),

                        SizedBox(width: 50,),

                        Align(
                            alignment: Alignment.centerLeft,
                            child: Text(
                              "Nome",
                              style: TextStyle(
                                fontSize: 15,
                                color: Colors.black,
                              ),
                            ),
                        ),

                        SizedBox(width: 10,),

                        //input nome
                        inputNameID(),
                      ],
                    ),

                    SizedBox(height: 14,),

                    Row(
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: [
                        Align(
                            alignment: Alignment.centerLeft,
                            child: Text(
                              "Data do pedido",
                              style: TextStyle(
                                fontSize: 15,
                                color: Colors.black,
                              ),
                            ),
                        ),

                        SizedBox(width: 10,),

                        //input data do pedido
                        inputDate(),

                        SizedBox(width: 54,),

                        Align(
                            alignment: Alignment.centerLeft,
                            child: Text(
                              "Prazo",
                              style: TextStyle(
                                fontSize: 15,
                                color: Colors.black,
                              ),
                            ),
                        ),

                        SizedBox(width: 10,),

                        //input data do prazo
                        inputDate()
                      ],
                    ),

                    SizedBox(height: 24,),

                    Row(
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: [
                        Padding(
                          padding: EdgeInsets.only(bottom: 70),
                            child: Align(
                              alignment: Alignment.topLeft,
                              child: Text(
                                "Descrição",
                                style: TextStyle(
                                  fontSize: 15,
                                  color: Colors.black,
                                ),
                              ),
                          ),
                        ),
                        

                        SizedBox(width: 10,),

                        //input descrição
                        SizedBox(
                          width: 339,
                          height: 92 ,
                          //input da descrição
                          child: TextField(
                            style: TextStyle(
                              fontSize: 15,
                              color: Colors.black,
                            ),
                            maxLines: null,
                            minLines: 6,
                            decoration: InputDecoration(
                              hintStyle: TextStyle(
                                fontSize: 15
                              ),
                              filled: true,
                              fillColor: Colors.white,
                              border: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(10),
                                borderSide: BorderSide(color: Colors.grey, width: 2),
                              ),
                              enabledBorder: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(10),
                                borderSide: BorderSide(color: Colors.grey, width: 2),
                              ),
                              focusedBorder: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(10),
                                borderSide: BorderSide(color: Colors.grey, width: 2)
                              )
                            ),
                          ),
                        ),
                      ],
                    ),

                    SizedBox(height: 23,),

                    Row(
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: [
                        Align(
                            alignment: Alignment.centerLeft,
                            child: Text(
                              "Prioridade",
                              style: TextStyle(
                                fontSize: 15,
                                color: Colors.black,
                              ),
                            ),
                        ),

                        SizedBox(width: 10,),

                        ButtonChoosePriority()
                      ],
                    ),

                    SizedBox(height: 47,),

                    ButtonConcluir(),

                  ],
                ),
              ),
            ),
          ),
        );
      },
  );
}



class ButtonConcluir extends StatelessWidget {
  const ButtonConcluir({super.key});

  
  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: SizedBox(
        width: 169,
        height: 33,
        child: ElevatedButton(
          onPressed: () {
            //Lógica do botão
            showDialogConfirm(context);
          },
          style: ElevatedButton.styleFrom(
            backgroundColor: Color(0xFF50B432),
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(27)
            )
          ),
          child: Text(
            "Concluir",
            style: TextStyle(
              color: Colors.white,
              fontSize: 15,
            ),
          )
        ),
    ),
  );
  }
}



void showDialogConfirm (BuildContext context){
  showDialog(
    context: context,
    builder: (BuildContext context) {
      return AlertDialog(
        title: Text(
          "Deseja confirmar a operação?",
          textAlign: TextAlign.center,
          style: TextStyle(
            fontSize: 20,
            fontWeight: FontWeight.bold, 
          ),
        ),
        content: Text(
          "Essa operação não poderá ser revertida",
          style: TextStyle(
            fontSize: 20,
            color: Colors.black,
          ),
        ),
        actions: <Widget>[
          Expanded(
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,

              children: [
                SizedBox(
                  width: 137,
                  height: 57,
                  child: ElevatedButton(
                    onPressed: () {
                      //Lógica do botão
                    },
                    style: ElevatedButton.styleFrom(
                      backgroundColor: Color(0xFF50B432),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(22)
                      )
                    ),
                    child: Text(
                      "Sim",
                      style: TextStyle(
                        fontSize: 20,
                        color: Colors.white,
                      ),
                    )
                  ),
                ),

                SizedBox(width: 40,),

                SizedBox(
                  width: 137,
                  height: 57,
                  child: TextButton(
                    onPressed: () {
                      Navigator.of(context).pop();
                    },
                    style: TextButton.styleFrom(
                      backgroundColor: Color(0xFFD54A3D),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(22)
                      )
                    ),
                    child: Text(
                      "Não",
                      style: TextStyle(
                        fontSize: 20,
                        color: Colors.white,
                      ),
                    )
                  ),
                )
              ],
            )
          ),
        ],
      );
    }
  );
}




//Botão de escolha prioridade
class ButtonChoosePriority extends StatefulWidget {
  const ButtonChoosePriority({super.key});

  @override
  State<ButtonChoosePriority> createState() {
    return ButtonChoosePriorityState();
  }
}

class ButtonChoosePriorityState extends State<ButtonChoosePriority> {
  String? selectedOption;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 146,
      height: 25,
      padding: EdgeInsets.symmetric(horizontal: 10),
      decoration: BoxDecoration(
        border: Border.all(color: Colors.grey, width: 2),
        borderRadius: BorderRadius.circular(9),
        color: Colors.white,
      ),

      child: DropdownButton<String>(
        isExpanded: true,
        hint: Text(
          "Escolha uma opção",
          style: TextStyle(fontSize: 15, color: Colors.black.withOpacity(0.5)),
        ),
        underline: SizedBox(),
        value: selectedOption,
        onChanged: (String? newValue) {
          setState(() {
            selectedOption = newValue;
          });
        },
        items: ["Alta", "Média", "Baixa"].map((String option) {
          return DropdownMenuItem<String>(
            value: option,
            child: Text(option),
          );
        }).toList(),
      ),
    );
  }
}




//input do nome e do id
Widget inputNameID() {
  return SizedBox(
    width: 143,
    height: 24,
    //input do código
    child: TextField(
      style: TextStyle(
        fontSize: 15,
        color: Colors.black,
      ),
      textAlignVertical: TextAlignVertical.center,
      maxLines: 1,
      decoration: InputDecoration(
        contentPadding: EdgeInsets.symmetric(vertical: 2.0, horizontal: 10.0),
        filled: true,
        fillColor: Colors.white,
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(10),
          borderSide: BorderSide(color: Colors.grey, width: 2),
        ),
        enabledBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(10),
          borderSide: BorderSide(color: Colors.grey, width: 2),
        ),
        focusedBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(10),
          borderSide: BorderSide(color: Colors.grey, width: 2)
        )
      ),
    ),
  );
}

//input das datas
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
            hintStyle: TextStyle(
              fontSize: 15,
              color: Colors.black.withOpacity(0.5)
            ),
            contentPadding: EdgeInsets.symmetric(vertical: 2.0, horizontal: 10.0),
            filled: true,
            fillColor: Colors.white,
            border: OutlineInputBorder(
              borderRadius: BorderRadius.circular(10),
              borderSide: BorderSide(color: Colors.grey, width: 2),
            ),
            enabledBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(10),
              borderSide: BorderSide(color: Colors.grey, width: 2),
            ),
            focusedBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(10),
              borderSide: BorderSide(color: Colors.grey, width: 2)
            )
          ),
        ),
      ),

      SizedBox(width: 10,),

      Icon(Icons.calendar_month, color: Colors.black26,)
    ],
  );
}

class Search extends StatefulWidget {
  const Search({super.key});

  @override
  State<Search> createState() {
    return SearchState();
  }
}

class SearchState extends State<Search> {
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: 499,
      height: 32,
      child: TextField(
        decoration: InputDecoration(
            prefixIcon: Icon(
              Icons.search,
              color: Color(0xFF015C98),
            ), //Icon de pesquisa

            hintText: "Insira o nome de uma demanda para iniciar uma busca",
            hintStyle: TextStyle(
                fontSize: 11,
                color: Colors.black.withOpacity(0.5) //Opacidade do texto
                ),
            filled: true,
            fillColor: Colors.white,
            border: OutlineInputBorder(
              borderRadius: BorderRadius.circular(16),
              borderSide: BorderSide(color: Colors.white, width: 2),
            ),
            enabledBorder: OutlineInputBorder(
              borderSide: BorderSide(color: Colors.white, width: 2),
              borderRadius: BorderRadius.circular(16),
            ),
            focusedBorder: OutlineInputBorder(
              borderSide: BorderSide(color: Colors.white, width: 2),
              borderRadius: BorderRadius.circular(16),
            )),
      ),
    );
  }
}

class QuadroPrioridade extends StatefulWidget {
  const QuadroPrioridade({super.key});

  @override
  State<QuadroPrioridade> createState() {
    return QuadroPrioridadeState();
  }
}

class QuadroPrioridadeState extends State<QuadroPrioridade> {
  Color colorQ = Color(0xFFC3206F);

  //Troca a cor do quadro
  void prioridadeAlta() {
    setState(() {
      colorQ = Color(0xFFC3206F);
    });
  }

  //Troca a cor do quadro
  void prioridadeMedia() {
    setState(() {
      colorQ = Color(0xFFFF66B0);
    });
  }

  //Troca a cor do quadro
  void prioridadeBaixa() {
    setState(() {
      colorQ = Color(0xFFFFC6E1);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        //Quadro de prioridade
        Container(
          width: 340,
          height: 398,
          decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(16), color: colorQ),
        ),

        SizedBox(
          height: 15,
        ),

        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            //Botão alta prioridade
            SizedBox(
              width: 97,
              height: 24,
              child: ElevatedButton(
                onPressed: prioridadeAlta,
                style: ElevatedButton.styleFrom(
                    backgroundColor: Color(0xFFC3206F),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(15),
                    )),
                child: Text(
                  'Alta',
                  style: TextStyle(
                    color: Colors.black,
                  ),
                ),
              ),
            ),

            SizedBox(
              width: 17,
            ),

            //Botão média prioridade
            SizedBox(
              width: 97,
              height: 24,
              child: ElevatedButton(
                onPressed: prioridadeMedia,
                style: ElevatedButton.styleFrom(
                    backgroundColor: Color(0xFFFF66B0),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(15),
                    )),
                child: Text(
                  'Média',
                  style: TextStyle(
                    color: Colors.black,
                  ),
                ),
              ),
            ),

            SizedBox(
              width: 17,
            ),

            //Botão baixa prioridade
            SizedBox(
              width: 97,
              height: 24,
              child: ElevatedButton(
                onPressed: prioridadeBaixa,
                style: ElevatedButton.styleFrom(
                    backgroundColor: Color(0xFFFFC6E1),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(15),
                    )),
                child: Text(
                  'Baixa',
                  style: TextStyle(
                    color: Colors.black,
                  ),
                ),
              ),
            ),
          ],
        )
      ],
    );
  }
}

// Dialog
void _showCustomDialog(BuildContext context) {
  showGeneralDialog(
    context: context,
    pageBuilder: (context, animation1, animation2) {
      return Container();
    },
    transitionBuilder: (context, a1, a2, widget) {
      return ScaleTransition(
        scale: Tween<double>(begin: 0.5, end: 1.0).animate(a1),
        child: AlertDialog(
          backgroundColor: Color(0xFFD1EEFF),
          content: SizedBox(
              height: 639,
              width: 560,
              child: Padding(
                padding: const EdgeInsets.only(top: 41),
                child: Container(
                  child: Column(
                    children: [
                      Row(
                        mainAxisAlignment: MainAxisAlignment.end,
                        children: [
                          Expanded(
                              child: Align(
                            //Aqui ficará o nome da demanda ou qual demanda será
                            alignment: Alignment.center,
                            child: Text("Nome da demanda",
                                style: TextStyle(
                                  fontSize: 24,
                                  fontWeight: FontWeight.bold,
                                )),
                          )),
                          IconButton(
                              onPressed: () {
                                Navigator.pop(context);
                              },
                              icon: Icon(
                                Icons.close,
                                size: 25,
                              ))
                        ],
                      ),
                      SizedBox(height: 31),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Container(
                            width: 186,
                            height: 202,
                            decoration: BoxDecoration(
                              color: Colors.white,
                              borderRadius: BorderRadius.circular(20),
                            ),
                          ),
                          SizedBox(width: 30),
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              RichText(
                                  text: TextSpan(
                                      text: "Código: ",
                                      style: TextStyle(
                                          fontWeight: FontWeight.bold,
                                          fontSize: 15),
                                      children: [
                                    TextSpan(text: "{Codigo do bolos}")
                                  ])),
                              SizedBox(height: 10),
                              RichText(
                                  text: TextSpan(
                                      text: "Data do pedido: ",
                                      style: TextStyle(
                                          fontWeight: FontWeight.bold,
                                          fontSize: 15),
                                      children: [
                                    TextSpan(text: "{dataPedido}")
                                  ])),
                              SizedBox(height: 10),
                              RichText(
                                  text: TextSpan(
                                      text: "Prazo: ",
                                      style: TextStyle(
                                          fontWeight: FontWeight.bold,
                                          fontSize: 15),
                                      children: [
                                    TextSpan(text: "{prazoPedido}")
                                  ])),
                              SizedBox(height: 10),
                              RichText(
                                  text: TextSpan(
                                      text: "Descrição: ",
                                      style: TextStyle(
                                          fontWeight: FontWeight.bold,
                                          fontSize: 15),
                                      children: [
                                    TextSpan(text: "{descriçãoDemanda}")
                                  ])),
                            ],
                          )
                        ],
                      ),
                      SizedBox(
                        height: 40,
                      ),
                      Text(
                        "Acompanhamento da produção",
                        style: TextStyle(
                            fontWeight: FontWeight.bold, fontSize: 20),
                      ),
                      SizedBox(
                        height: 10,
                      ),
                      Text(
                        "Status: Em andamento",
                        style: TextStyle(
                            fontWeight: FontWeight.bold, fontSize: 16),
                      ),
                      _stage_demand(context),
                      SizedBox(
                        height: 11,
                      ),
                      _stage_demand(context),
                    ],
                  ),
                ),
              )),
          shape: OutlineInputBorder(
              borderRadius: BorderRadius.circular(16.0),
              borderSide: BorderSide.none),
        ),
      );
    },
  );
}

Widget _stage_demand(BuildContext context) {
  return Container(
    color: Color(0xFF50b432),
    height: 40,
    child: Row(
      children: [
        Padding(
            padding: EdgeInsets.symmetric(horizontal: 20),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [Text("data"), Text("data")],
            ))
      ],
    ),
  );
}

class DemandCard extends StatelessWidget {
  final int index;

  DemandCard({required this.index});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 4.0, horizontal: 10),
      child: Card(
        color: Color(0xFFE5F7FF),
        elevation: 5,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(10),
        ),
        child: Padding(
          padding: const EdgeInsets.all(10.0),
          child: Row(
            children: [
              // Imagem do card
              Container(
                width: 100,
                height: 100,
                decoration: BoxDecoration(
                  image: DecorationImage(
                    image: AssetImage('assets/images/photo.jpg'),
                    fit: BoxFit.cover,
                  ),
                  borderRadius: BorderRadius.circular(10),
                ),
              ),
              SizedBox(width: 10),

              // Informações do card
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    Text(
                      'Nome da Demanda #$index',
                      style: TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: 16,
                      ),
                    ),
                    SizedBox(height: 4),
                    Text(
                      'Código da Demanda #$index',
                      style: TextStyle(
                        fontSize: 14,
                      ),
                    ),
                    SizedBox(height: 4),
                    Text(
                      'Descrição da Demanda',
                      style: TextStyle(
                        fontSize: 12,
                      ),
                    ),
                  ],
                ),
              ),
              // Botões de ação
              Column(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  _buildActionButton(
                    icon: Icons.delete,
                    label: 'Deletar',
                    onPressed: () {
                      // Ação de deletar
                    },
                  ),
                  _buildActionButton(
                    icon: Icons.edit,
                    label: 'Editar',
                    onPressed: () {
                      // Ação de editar
                    },
                  ),
                  _buildActionButton(
                    icon: Icons.info,
                    label: 'Informações',
                    onPressed: () {
                      // Ação de informações
                      _showCustomDialog(context);
                    },
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildActionButton({
    required IconData icon,
    required String label,
    required VoidCallback onPressed,
  }) {
    return Row(
      children: [
        IconButton(
          icon: Icon(icon),
          iconSize: 18,
          onPressed: onPressed,
        ),
        SizedBox(width: 5),
        Text(
          label,
          style: TextStyle(
            fontSize: 12,
          ),
        ),
      ],
    );
  }
}