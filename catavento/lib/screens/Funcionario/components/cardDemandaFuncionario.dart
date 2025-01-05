import 'package:catavento/screens/Funcionario/components/buttonCard.dart';
import 'package:flutter/material.dart';

class CardDemanda extends StatelessWidget {
  const CardDemanda({super.key});

  @override
  Widget build(BuildContext context) {
    double screenHeight = MediaQuery.of(context).size.height / 1.2;

    return Container(
      width: 300,
      height: screenHeight,
      decoration: BoxDecoration(
          color: Color(0xFFEBEBEB), borderRadius: BorderRadius.circular(12)),
      child: Padding(
        padding: EdgeInsets.only(top: 20, left: 7.5, right: 7.5, bottom: 0),
        child: Column(
          children: [
            Text(
              "nome da demanda",
              style: TextStyle(
                  color: Color(0xFF015C98),
                  fontWeight: FontWeight.bold,
                  fontSize: 20),
            ),
            SizedBox(height: 10),
            Container(
              decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(12),
                  boxShadow: [
                    BoxShadow(
                      color: Colors.black.withOpacity(0.05),
                      offset: Offset(3, 3),
                      blurRadius: 12,
                      spreadRadius: 0,
                    ),
                  ]),
              height: 150,
            ),
            SizedBox(height: 10),
            Container(
              height: 250,
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(12), color: Colors.white),
              child: Padding(
                padding:
                EdgeInsets.only(left: 10, right: 10, bottom: 0, top: 10),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Icon(
                          Icons.search,
                          color: Color(0xFF015C98),
                        ),
                        SizedBox(
                          width: 10,
                        ),
                        Text(
                          "Informações",
                          style: TextStyle(
                              color: Color(0xFF015C98),
                              fontWeight: FontWeight.bold,
                              fontSize: 20),
                        )
                      ],
                    ),
                    SizedBox(
                      height: 10,
                    ),
                    Row(
                      children: [
                        Text(
                          "Código: ",
                          style: TextStyle(
                              color: Color(0xFF015C98),
                              fontSize: 16,
                              fontWeight: FontWeight.bold),
                        ),
                        Text(
                          "{codigo da demanda}",
                          style:
                          TextStyle(color: Color(0xFF015C98), fontSize: 14),
                        )
                      ],
                    ),
                    SizedBox(
                      height: 10,
                    ),
                    Text(
                      "Descrição: ",
                      style: TextStyle(
                          color: Color(0xFF015C98),
                          fontSize: 16,
                          fontWeight: FontWeight.bold),
                    ),
                    Expanded(
                      child: Text(
                        overflow: TextOverflow.ellipsis,
                        maxLines: 10,
                        "Lorem ipsum dolor sit amet, consectetur adipiscing elit. Vivamus sollicitudin, risus vel sodales egestas, purus nulla aliquet erat, a tristique nisl urna a lorem. Donec hendrerit ante ut ante sollicitudin, at malesuada risus tempor. Integer ultricies felis vitae dolor auctor, vel sollicitudin mauris maximus. Sed sit amet consequat ligula. Integer varius felis id justo congue auctor. Nullam sit amet euismod risus, eget posuere risus. Curabitur non quam sit amet lectus eleifend accumsan at ac eros. Sed auctor risus ut purus fermentum, ac malesuada lorem gravida. Donec varius orci vitae felis congue, eu dapibus ante pharetra. Cras euismod nisi sit amet ex tempus, eget lobortis orci finibus. Etiam tempor lorem eu tortor gravida, ac fermentum metus mollis. Proin ac urna tincidunt, cursus augue eu, tincidunt felis. Nullam ac fringilla leo. Mauris sed placerat augue. Pellentesque sed neque id odio egestas volutpat Mauris consequat justo sed sapien tincidunt, at condimentum elit tempor. Vivamus fringilla orci turpis, et interdum felis pretium sed. Proin tincidunt odio et velit cursus vehicula. Aenean sit amet quam euismod, varius ante sed, auctor sem. Quisque eu gravida sapien. Curabitur dapibus vehicula elit, nec convallis ex finibus ac. Nam sed eros et libero suscipit tincidunt ut et lectus. Donec sit amet justo nunc. Suspendisse potenti.",
                        style: TextStyle(
                            color: Color(0xFF015C98), fontSize: 14),
                      ),
                    ),
                  ],

                ),
              ),
            ),
            SizedBox(height: 12,),
            ButtonCard(title: Text("Inicar Bolo" , style: TextStyle(
              color: Colors.white,
              fontWeight: FontWeight.bold
            ),), icon: Icon(Icons.alarm , color: Colors.white,), onPressed: ()=> {}, isCompleted: true),

          ],
        ),
      ),
    );
  }
}
