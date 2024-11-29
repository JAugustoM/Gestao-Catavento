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
              )
            ),

            child: Center(
              child: AddDemandPageAdmin()
              
            ),
          ),

          //Icon menu
          IconMenu()
        ],
      )
    );
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
                  style: TextStyle(
                    fontSize: 29.5,
                    color: Color(0xFF015C98)
                  ),
                ),
    
                SizedBox(height: 40),

                //Barra de pesquisa
                Search(),

                SizedBox(height: 30,),
    
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
    
                  children: [
                    QuadroPrioridade(),
    
                    SizedBox(width: 16,),
    
                    ListDemanda(),
    
                    SizedBox(width: 16,),
    
                    QuadroGrafico()
                  ],
                ),
    
                SizedBox(height: 37,),
    
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

                SizedBox(height: 2,),

                Text(
                  "Total: $total",
                  style: TextStyle(
                    fontSize: 18,
                    fontWeight: FontWeight.bold,
                    color: Colors.black
                  ),
                )
              ],
            )      
          )
        ),

        SizedBox(height: 20,),

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

              SizedBox(width: 30,),

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

                    SizedBox(height: 2,),

                    Text(
                      "Em fabricação",
                      style: TextStyle(
                        fontSize: 18,
                        color: Colors.black
                      ),
                    )
                  ],
                )      
              ),
            ],
          )
        ),

        SizedBox(height: 30,),

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

              SizedBox(width: 40,),

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

                    SizedBox(height: 2,),

                    Text(
                      "Em espera",
                      style: TextStyle(
                        fontSize: 18,
                        color: Colors.black
                      ),
                    )
                  ],
                )      
              ),
            ],
          )
        ),
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

  @override
  Widget build(BuildContext context) {

    return Container(
      width: 499,
      height: 438,
      decoration: BoxDecoration(
        color: Color(0xFFFFFFFF),
        borderRadius: BorderRadius.circular(17)
      ),
    );
  }
}



class ButtonAddDemanda extends StatelessWidget {
  const ButtonAddDemanda({super.key});

  @override
  Widget build(BuildContext context) {

    return SizedBox(
      width: 189,
      height: 47,
      child: ElevatedButton(
        onPressed: (){
          // Lógica do botão
          _showCustomDialog(context);

        },
        style: ElevatedButton.styleFrom(
          backgroundColor:  Color(0xFF015C98),
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(22)
          )
        ),
        child: Text(
          "Adicionar Demanda",
          style: TextStyle(
          color: Colors.white,
          ),
        ),
      ),
    );
  }
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

          prefixIcon: Icon(Icons.search, color: Color(0xFF015C98),), //Icon de pesquisa

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
          )
        ),
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
  void prioridadeBaixa(){
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
            borderRadius: BorderRadius.circular(16),
            color: colorQ
          ),
        ),

        SizedBox(height: 15,),

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
                  )
                ),
                child: Text(
                  'Alta',
                  style: TextStyle(
                    color: Colors.black,
                  ),
                ),
              ),
            ),
            
            SizedBox(width: 17,),

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
                  )
                ),
                child: Text(
                  'Média',
                  style: TextStyle(
                    color: Colors.black,
                  ),
                ),
              ),
            ),
            

            SizedBox(width: 17,),

            //Botão baixa prioridade
            SizedBox(
              width: 97,
              height: 24,
              child:ElevatedButton(
                onPressed: prioridadeBaixa, 
                style: ElevatedButton.styleFrom(
                  backgroundColor: Color(0xFFFFC6E1),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(15),
                  )
                ),
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
void _showCustomDialog(BuildContext context){
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
                              borderRadius:
                              BorderRadius.circular(20),
                            ),
                          ),
                          SizedBox(width: 30),
                          Column(
                            children: [
                              RichText(
                                  text: TextSpan(
                                      text: "Código: ",
                                      style: TextStyle(
                                          fontWeight:
                                          FontWeight.bold,
                                          fontSize:15),

                                      children: [
                                        TextSpan(
                                            text: "{Codigo do bolos}")
                                      ])),
                              SizedBox(height: 10),
                              RichText(
                                  text: TextSpan(
                                      text: "Código: ",
                                      style: TextStyle(
                                          fontWeight:
                                          FontWeight.bold,
                                          fontSize:15),

                                      children: [
                                        TextSpan(
                                            text: "{Codigo do bolos}")
                                      ])),
                              SizedBox(height: 10),

                              RichText(
                                  text: TextSpan(
                                      text: "Código: ",
                                      style: TextStyle(
                                          fontWeight:
                                          FontWeight.bold,
                                          fontSize:15),

                                      children: [
                                        TextSpan(
                                            text: "{Codigo do bolos}")
                                      ])),
                              SizedBox(height: 10),

                              RichText(
                                  text: TextSpan(
                                      text: "Código: ",
                                      style: TextStyle(
                                          fontWeight:
                                          FontWeight.bold,
                                          fontSize:15),

                                      children: [
                                        TextSpan(
                                            text: "{Codigo do bolos}")
                                      ])),
                            ],
                          )
                        ],
                      )
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
