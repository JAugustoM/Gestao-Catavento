import 'package:catavento/bloc/auth/auth_bloc.dart';
import 'package:catavento/bloc/trabalho/trabalho_bloc.dart';
import 'package:flutter/material.dart';
import 'package:catavento/shared/theme/colors.dart';
import 'package:flutter/scheduler.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class CardDemanda extends StatefulWidget {
  final String title;
  final String description;
  final String codigo;
  final Color backgroundColor;
  final Color shadowColor;
  final double width;
  final double height;
  final String? imagem;
  final int status;
  final void Function()? onCronometroFinalizado;

  const CardDemanda({
    Key? key,
    required this.title,
    required this.description,
    required this.codigo,
    required this.backgroundColor,
    required this.shadowColor,
    required this.width,
    required this.height,
    required this.imagem,
    required this.status,
    this.onCronometroFinalizado,
  }) : super(key: key);

  @override
  _CardDemandaState createState() => _CardDemandaState();
}

class _CardDemandaState extends State<CardDemanda> {
  String _buttonText = "Iniciar Bolo";

  @override
  void initState() {
    super.initState();
    _buttonText = "Iniciar Bolo";
    SchedulerBinding.instance.addPostFrameCallback((_) {
      if (widget.title == "Carregando") {
        _buttonText = "Carregando";
      } else if (widget.status == 0) {
        _buttonText = "Iniciar Bolo";
      } else if (widget.status == 1) {
        _buttonText = "Finalizar Bolo";
      }
    });
  }

  void _handleButtonPress() async {
    if (_buttonText == "Iniciar Bolo") {
      setState(() {
        _buttonText = "Finalizar Bolo";
      });

      final email = context.read<AuthBloc>().email;
      final setor = context.read<AuthBloc>().setor!.toLowerCase();
      context.read<TrabalhoBloc>().add(TrabalhoInit(
            email: email!,
            setor: setor,
          ));
    } else if (_buttonText == "Finalizar Bolo") {
      setState(() {
        _buttonText = "Bolo Concluído";
      });

      if (widget.onCronometroFinalizado != null) {
        widget.onCronometroFinalizado!();
      }

      final email = context.read<AuthBloc>().email;
      final setor = context.read<AuthBloc>().setor!.toLowerCase();

      context.read<TrabalhoBloc>().add(TrabalhoFinish(
            email: email!,
            setor: setor,
          ));
    }
  }

  @override
  Widget build(BuildContext context) {
    double cardWidth = widget.width;
    double cardHeight = widget.height;
    return SizedBox(
      width: cardWidth,
      height: cardHeight,
      child: Card(
        color: widget.backgroundColor,
        shadowColor: widget.shadowColor,
        elevation: 5,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(10),
        ),
        child: Padding(
          padding: const EdgeInsets.all(15.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    widget.title,
                    style: const TextStyle(
                      fontSize: 18,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ],
              ),
              const SizedBox(height: 10),
              // Imagem
              Row(children: [
                Expanded(
                  child: ClipRRect(
                    borderRadius: BorderRadius.circular(15),
                    child: widget.imagem == null
                        ? Image.asset(
                            'assets/images/photo.jpg',
                            width: 100,
                            height: 150,
                            fit: BoxFit.cover,
                          )
                        : Image.network(
                            widget.imagem!,
                            width: 100,
                            height: 100,
                            fit: BoxFit.cover,
                          ),
                  ),
                )
              ]),
              const SizedBox(height: 10),
              // Descrição e código
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
                        offset: const Offset(2, 2),
                      ),
                    ],
                  ),
                  child: SingleChildScrollView(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Row(
                          mainAxisAlignment: MainAxisAlignment.start,
                          children: [
                            Text(
                              "Código: ",
                              style: const TextStyle(
                                fontSize: 16,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                            Text(
                              widget.codigo,
                              style: const TextStyle(
                                fontSize: 16,
                              ),
                            ),
                          ],
                        ),
                        const SizedBox(height: 10),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.start,
                          children: [
                            Text(
                              "Descrição: ",
                              style: const TextStyle(
                                fontSize: 16,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                            Text(
                              widget.description,
                              style: const TextStyle(
                                fontSize: 16,
                              ),
                            ),
                          ],
                        ),
                      ],
                    ),
                  ),
                ),
              ),
              const SizedBox(height: 10),
              // Botão com estados
              Align(
                alignment: Alignment.center,
                child: Container(
                  width: 300,
                  decoration: BoxDecoration(
                    gradient: const LinearGradient(
                      colors: [Colors.blue, Colors.lightBlueAccent],
                      begin: Alignment.centerLeft,
                      end: Alignment.centerRight,
                    ),
                    borderRadius: BorderRadius.circular(22),
                  ),
                  child: ElevatedButton(
                    onPressed: (_buttonText == "Bolo Concluído")
                        ? null
                        : _handleButtonPress,
                    style: ElevatedButton.styleFrom(
                      backgroundColor: (_buttonText == "Iniciar Bolo")
                          ? AppColors.gradientLightBlue
                          : Colors.green,
                      shadowColor: Colors.transparent,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(22),
                      ),
                    ),
                    child: Text(
                      _buttonText,
                      style: const TextStyle(
                        color: Colors.white,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
