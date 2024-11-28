import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

class DashBoardAdmin extends StatelessWidget {
  const DashBoardAdmin({super.key});


  @override
  Widget build(BuildContext context) {

    //Data de hoje
    String formattedDate = DateFormat('dd/MM/yyyy').format(DateTime.now());

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
              child:Column(
                mainAxisAlignment: MainAxisAlignment.start,
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
                  SizedBox(
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
                  ),

                  SizedBox(height: 30,),

                  Row(

                    mainAxisAlignment: MainAxisAlignment.center,

                    children: [

                      //Quadro de prioridades
                      QuadroPrioridade(),

                      SizedBox(width: 16,),
                      
                      //Quadrado onde vai ficar a lista de demandas.
                      Container(
                        width: 499,
                        height: 438,
                        decoration: BoxDecoration(
                          color: Color(0xFFFFFFFF),
                          borderRadius: BorderRadius.circular(17)
                        ),
                      ),
                      
                      SizedBox(width: 16,),
                      
                      Column(
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
                          ),

                          SizedBox(height: 20,),

                          //Grafico 2
                          Container(
                            width: 340,
                            height: 132,
                            decoration: BoxDecoration(
                              color: Colors.white,
                              borderRadius: BorderRadius.circular(12),
                            ),
                          ),

                          SizedBox(height: 20,),

                          //Grafico 3
                          Container(
                            width: 340,
                            height: 132,
                            decoration: BoxDecoration(
                              color: Colors.white,
                              borderRadius: BorderRadius.circular(12),
                            ),
                          ),

                        ],
                      )
                    ],
                  ),

                  SizedBox(height: 37,),

                  //Botão de adicionar demanda
                  SizedBox(
                    width: 189,
                    height: 47,
                    child: ElevatedButton(
                    onPressed: (){

                  // Lógica do botão

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
                  )
                ],
              )
            ),
          ),

          //Icon menu
          Positioned(
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
          ),
        ],
      )
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
                  'Média',
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
