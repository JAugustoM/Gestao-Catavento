import 'package:catavento/bloc/auth/auth_bloc.dart';
import 'package:catavento/bloc/demanda/demanda_bloc.dart';
import 'package:catavento/bloc/trabalho/trabalho_bloc.dart';
import 'package:catavento/screens/dashboardFuncionarios/components/DropDownButton.dart';

import 'package:catavento/bloc/usuario/usuario_bloc.dart';
import 'package:catavento/screens/dashboardFuncionarios/components/aviso.dart';
import 'package:catavento/shared/widgets/bloc_snackbar.dart';
import 'package:catavento/shared/widgets/inputs.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'components/ativAndamentoCard.dart';

import 'package:flutter/material.dart';
import 'package:catavento/screens/dashboardFuncionarios/components/checkBox.dart';
import 'package:catavento/shared/theme/colors.dart';
import 'components/funcionarioCard.dart';
import 'package:catavento/shared/widgets/background.dart';
import 'package:catavento/shared/widgets/header.dart';
import 'package:catavento/shared/widgets/blocks.dart';
import 'package:catavento/shared/widgets/menu.dart';
import 'package:catavento/shared/widgets/dialog.dart';
import 'package:catavento/shared/widgets/graficInfo.dart';

class EmployeeManagement extends StatelessWidget {
  final List<Map<String, String>> ativAndamento = [
    {'nome': 'nomeFuncionario', 'demanda': 'nomeDemanda'},
    {'nome': 'nomeFuncionario', 'demanda': 'nomeDemanda'},
    {'nome': 'nomeFuncionario', 'demanda': 'nomeDemanda'},
    {'nome': 'nomeFuncionario', 'demanda': 'nomeDemanda'},
    {'nome': 'nomeFuncionario', 'demanda': 'nomeDemanda'},
    {'nome': 'nomeFuncionario', 'demanda': 'nomeDemanda'},
    {'nome': 'nomeFuncionario', 'demanda': 'nomeDemanda'},
    {'nome': 'nomeFuncionario', 'demanda': 'nomeDemanda'},
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      drawer: Navbar(),
      appBar: CustomHeader(
        title: 'Funcionários',
        historyButton: false,
      ),
      extendBodyBehindAppBar: true,
      body: Stack(
        children: [
          BackgroundPage(
            backgroundColor: Colors.white,
            children: [
              SizedBox(height: MediaQuery.of(context).size.height * 0.18),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 16.0),
                child: LayoutBuilder(
                  builder: (context, constraints) {
                    final bool isWideScreen = constraints.maxWidth > 600;
                    return SingleChildScrollView(
                      child: isWideScreen
                          ? Row(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Flexible(
                                  flex: 2,
                                  child: Column(
                                    children: [
                                      _buildBlockFunTotal(context),
                                      const SizedBox(
                                        height: 20,
                                      ),
                                      _buildBlockFunPresentes(context),
                                      const SizedBox(
                                        height: 20,
                                      ),
                                      _buildNewEmployeeButton(context),
                                      const SizedBox(height: 20),
                                    ],
                                  ),
                                ),
                                const SizedBox(width: 20),
                                Flexible(
                                  flex: 2,
                                  child: _buildFuncionariosBlock(context),
                                ),
                                const SizedBox(width: 20),
                                Flexible(
                                  flex: 3,
                                  child: _buildAtividadesBlock(context),
                                ),
                              ],
                            )
                          : Column(
                              children: [
                                _buildNewEmployeeButton(context),
                                const SizedBox(height: 20),
                                _buildFuncionariosBlock(context),
                                const SizedBox(height: 20),
                                _buildAtividadesBlock(context),
                              ],
                            ),
                    );
                  },
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }

  Widget _buildNewEmployeeButton(BuildContext context) {
    final size = MediaQuery.of(context).size;

    final buttonWidth = size.width * (size.width > 600 ? 0.25 : 0.8);
    final buttonHeight = size.height * 0.06;

    return Center(
      child: Container(
        width: buttonWidth,
        height: buttonHeight,
        decoration: BoxDecoration(
          gradient: LinearGradient(
            colors: [AppColors.gradientDarkBlue, AppColors.gradientLightBlue],
            begin: Alignment.centerLeft,
            end: Alignment.centerRight,
          ),
          borderRadius: BorderRadius.circular(
              MediaQuery.of(context).size.height * 0.0222),
        ),
        child: ElevatedButton(
          onPressed: () {
            _showNewEmployeeDialog(context);
          },
          style: ElevatedButton.styleFrom(
            backgroundColor: Colors.transparent,
            shadowColor: Colors.transparent,
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(
                  MediaQuery.of(context).size.height * 0.0222),
            ),
          ),
          child: Text(
            "Novo Funcionário",
            style: TextStyle(
              fontFamily: "FredokaOne",
              fontSize: size.height * 0.022,
              color: Colors.white,
            ),
          ),
        ),
      ),
    );
  }

  Widget _buildBlockFunTotal(context) {
    final size = MediaQuery.of(context).size;

    final blockWidth = size.width * (size.width > 600 ? 0.25 : 0.8);
    final blockHeight = size.height * 0.17;

    return Blocks(
      height: blockHeight,
      width: blockWidth,
      color: AppColors.lightGray,
      borderRadius: MediaQuery.of(context).size.height * 0.0226,
      child: Center(
        child: Graficinfo<UsuarioBloc, UsuarioState>(
          size: size.width * 0.04,
          icons: Icons.group_add,
          colorIcons: Color(0xFF015C98),
          info: 'Funcionários',
          dataKey: 'total',
          buildWhen: (previous, current) =>
              previous.metaData != current.metaData,
        ),
      ),
    );
  }

  Widget _buildBlockFunPresentes(context) {
    final size = MediaQuery.of(context).size;

    final blockWidth = size.width * (size.width > 600 ? 0.25 : 0.8);
    final blockHeight = size.height * 0.17;

    return Blocks(
      height: blockHeight,
      width: blockWidth,
      color: AppColors.lightGray,
      borderRadius: MediaQuery.of(context).size.height * 0.0226,
      child: Center(
          child: Graficinfo<TrabalhoBloc, TrabalhoState>(
        size: size.width * 0.04,
        icons: Icons.verified,
        colorIcons: Colors.green,
        info: 'Funcionários presentes',
        dataKey: 'presentes',
        buildWhen: (previous, current) => previous.metaData != current.metaData,
      )),
    );
  }

  Widget _buildFuncionariosBlock(BuildContext context) {
    return Blocks(
        title: "Todos os funcionários",
        titleColor: AppColors.gradientLightBlue,
        color: AppColors.lightGray,
        borderRadius: MediaQuery.of(context).size.height * 0.0226,
        child: LayoutBuilder(builder: (context, contraints) {
          double height = contraints.maxHeight * 0.85;
          double listWidth = contraints.maxWidth * 0.9;
          return SizedBox(
            width: listWidth,
            height: height,
            child: BlocConsumer<UsuarioBloc, UsuarioState>(
              listener: (context, state) {
                switch (state) {
                  case UsuarioCreateState():
                    showBlocSnackbar(context, "Usuário criado com sucesso!");
                  case UsuarioDeleteState():
                    showBlocSnackbar(context, "Usuário removido com sucesso!");
                  case UsuarioUpdateState():
                    showBlocSnackbar(
                        context, "Usuário atualizado com sucesso!");
                  case UsuarioLoadingState():
                    break;
                  case UsuarioErrorState():
                    showBlocSnackbar(context, state.message);
                }
              },
              builder: (context, state) {
                final data = state.databaseResponse;

                return ListView.builder(
                  padding: EdgeInsets.zero,
                  shrinkWrap: true,
                  itemCount: data.length,
                  itemBuilder: (context, index) {
                    final funcionario = data[index];
                    return FuncionarioCard(
                      nomeFuncionario: funcionario['usuario'],
                      setor: funcionario['setor'],
                      status: funcionario['status'] ?? "Indisponível",
                      email: funcionario['email'],
                    );
                  },
                );
              },
            ),
          );
        }));
  }

  Widget _buildAtividadesBlock(BuildContext context) {
    return Blocks(
      title: "Atividades em andamento",
      titleColor: AppColors.gradientLightBlue,
      color: AppColors.lightGray,
      borderRadius: MediaQuery.of(context).size.height * 0.0226,
      child: LayoutBuilder(builder: (context, contraints) {
        double height = contraints.maxHeight * 0.85;
        double listWidth = contraints.maxWidth * 0.9;
        return SizedBox(
          width: listWidth,
          height: height,
          child: ListView(
            padding: EdgeInsets.zero,
            shrinkWrap: true,
            children: [
              _buildAtividadeSetor("Setor de Cobertura"),
              const SizedBox(height: 20),
              _buildAtividadeSetor("Setor de Aplique"),
              const SizedBox(height: 20),
              _buildAtividadeSetor("Setor de Montagem"),
            ],
          ),
        );
      }),
    );
  }

  Widget _buildAtividadeSetor(String setor) {
    return LayoutBuilder(builder: (context, contraints) {
      final screenHeight = MediaQuery.of(context).size.height;

      return Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            setor,
            style: TextStyle(
              fontSize: screenHeight * 0.022,
              color: AppColors.gradientLightBlue,
              fontFamily: "FredokaOne",
              fontWeight: FontWeight.bold,
            ),
          ),
          BlocBuilder<TrabalhoBloc, TrabalhoState>(
            builder: (context, state) {
              if (state is TrabalhoEmptyState) {
                context.read<TrabalhoBloc>().add(TrabalhoAdmin());
              }

              final setorString = setor.substring(9);
              final List<String> trabalhos = [];

              final users = context.read<UsuarioBloc>().getUsers(setorString);

              for (var user in users) {
                final atividades = state.trabalho
                    .where((test) => test['usuario_email'] == user['email']);
                if (atividades.isNotEmpty) {
                  final trabalho = atividades.last;
                  final demanda = context
                      .read<DemandaBloc>()
                      .getDemanda(trabalho['demanda_id']);
                  trabalhos.add(demanda!['nome_demanda']);
                } else {
                  trabalhos.add("Nenhum bolo em andamento");
                }
              }

              return trabalhos.isEmpty
                ? Aviso()

                : ListView.builder(
                padding: EdgeInsets.zero,
                shrinkWrap: true,
                physics: const NeverScrollableScrollPhysics(),
                itemCount: users.length,
                itemBuilder: (context, index) {
                  final atividade = trabalhos[index];
                  final user = users[index];
                  return AtivAndamentoCard(
                    nomeFuncionario: user['usuario']!,
                    nomeDemanda: atividade,
                  );
                },
              );
            },
          ),
        ],
      );
    });
  }

  void _showNewEmployeeDialog(BuildContext context) {
    showDialog(
      context: context,
      builder: (context) {
        final TextEditingController nomeController = TextEditingController();
        final TextEditingController setorController = TextEditingController();
        final TextEditingController emailController = TextEditingController();
        final TextEditingController usuarioController = TextEditingController();
        final TextEditingController senhaController = TextEditingController();
        final TextEditingController tipoController = TextEditingController();
        return ReusableDialog(
          backgroundColor: AppColors.lightGray,
          title: "Novo Funcionário",
          confirmBeforeClose: true,
          body: SingleChildScrollView(
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                Container(
                  padding: EdgeInsets.all(16),
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(
                        MediaQuery.of(context).size.height * 0.012),
                  ),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Row(
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          Padding(
                            padding: EdgeInsets.only(
                                top:
                                    MediaQuery.of(context).size.height * 0.022),
                            child: Text(
                              "Nome",
                              style: TextStyle(
                                  fontFamily: "FredokaOne",
                                  fontSize: MediaQuery.of(context).size.height *
                                      0.022,
                                  fontWeight: FontWeight.bold,
                                  color: AppColors.gradientDarkBlue),
                            ),
                          ),
                          SizedBox(
                            width: MediaQuery.of(context).size.height * 0.01,
                          ),
                          Expanded(
                              child: InputTextField(
                            labelText: '',
                            hintText: "Digite o nome...",
                            controller: nomeController,
                          ))
                        ],
                      ),
                      SizedBox(
                          height: MediaQuery.of(context).size.height * 0.022),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text(
                            'Tipo de Acesso',
                            style: TextStyle(
                                fontFamily: "FredokaOne",
                                fontSize:
                                    MediaQuery.of(context).size.height * 0.022,
                                color: AppColors.gradientDarkBlue,
                                fontWeight: FontWeight.bold),
                          ),
                          Row(
                            children: [
                              CheckBox(
                                tipo: 'gerente',
                                controller: tipoController,
                              ),
                              SizedBox(
                                width: MediaQuery.of(context).size.width * 0.01,
                              ),
                              Text(
                                'Gerente',
                                style: TextStyle(
                                    color: AppColors.gradientDarkBlue,
                                    fontFamily: "FredokaOne",
                                    fontSize:
                                        MediaQuery.of(context).size.height *
                                            0.022),
                              ),
                            ],
                          ),
                          Row(
                            children: [
                              CheckBox(
                                tipo: 'padrao',
                                controller: tipoController,
                              ),
                              SizedBox(
                                width: MediaQuery.of(context).size.width * 0.01,
                              ),
                              Text(
                                'Funcionário',
                                style: TextStyle(
                                    color: AppColors.gradientDarkBlue,
                                    fontFamily: "FredokaOne",
                                    fontSize:
                                        MediaQuery.of(context).size.height *
                                            0.022),
                              ),
                            ],
                          ),
                        ],
                      ),
                      SizedBox(
                          height: MediaQuery.of(context).size.height * 0.022),
                      Row(
                        children: [
                          Text(
                            "Setor*",
                            style: TextStyle(
                                fontSize:
                                    MediaQuery.of(context).size.height * 0.022,
                                fontFamily: "FredokaOne",
                                color: AppColors.gradientDarkBlue,
                                fontWeight: FontWeight.bold),
                          ),
                          SizedBox(
                            width: MediaQuery.of(context).size.width * 0.01,
                          ),
                          Dropdownbutton(
                            controller: setorController,
                          ),
                        ],
                      ),
                      SizedBox(
                          height: MediaQuery.of(context).size.height * 0.022),
                      Row(
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          Padding(
                            padding: EdgeInsets.only(
                                top:
                                    MediaQuery.of(context).size.height * 0.022),
                            child: Text(
                              "Email",
                              style: TextStyle(
                                  fontFamily: "FredokaOne",
                                  fontSize: MediaQuery.of(context).size.height *
                                      0.022,
                                  fontWeight: FontWeight.bold,
                                  color: AppColors.gradientDarkBlue),
                            ),
                          ),
                          SizedBox(
                            width: MediaQuery.of(context).size.height * 0.01,
                          ),
                          Expanded(
                              child: InputTextField(
                            labelText: '',
                            hintText: "Digite o email...",
                            controller: emailController,
                          ))
                        ],
                      ),
                      SizedBox(
                          height: MediaQuery.of(context).size.height * 0.022),
                      Row(
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          Padding(
                            padding: EdgeInsets.only(
                                top:
                                    MediaQuery.of(context).size.height * 0.022),
                            child: Text(
                              "Nome de Usuário",
                              style: TextStyle(
                                  fontFamily: "FredokaOne",
                                  fontSize: MediaQuery.of(context).size.height *
                                      0.022,
                                  fontWeight: FontWeight.bold,
                                  color: AppColors.gradientDarkBlue),
                            ),
                          ),
                          SizedBox(
                            width: MediaQuery.of(context).size.height * 0.01,
                          ),
                          Expanded(
                              child: InputTextField(
                            labelText: '',
                            hintText: "Digite o nome de usuário...",
                            controller: usuarioController,
                          ))
                        ],
                      ),
                      SizedBox(
                          height: MediaQuery.of(context).size.height * 0.022),
                      Row(
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          Padding(
                            padding: EdgeInsets.only(
                                top:
                                    MediaQuery.of(context).size.height * 0.022),
                            child: Text(
                              "Senha",
                              style: TextStyle(
                                  fontFamily: "FredokaOne",
                                  fontSize: MediaQuery.of(context).size.height *
                                      0.022,
                                  fontWeight: FontWeight.bold,
                                  color: AppColors.gradientDarkBlue),
                            ),
                          ),
                          SizedBox(
                            width: MediaQuery.of(context).size.height * 0.01,
                          ),
                          Expanded(
                              child: InputTextField(
                            labelText: '',
                            hintText: "Digite a senha...",
                            controller: senhaController,
                          ))
                        ],
                      ),
                    ],
                  ),
                ),
                SizedBox(height: MediaQuery.of(context).size.height * 0.0224),
                Container(
                  decoration: BoxDecoration(
                    gradient: LinearGradient(
                      colors: [
                        AppColors.gradientDarkBlue,
                        AppColors.gradientLightBlue
                      ],
                      begin: Alignment.centerLeft,
                      end: Alignment.centerRight,
                    ),
                    borderRadius: BorderRadius.circular(
                        MediaQuery.of(context).size.height * 0.0222),
                  ),
                  child: ElevatedButton(
                    onPressed: () {
                      if (nomeController.text.isNotEmpty &&
                          usuarioController.text.isNotEmpty &&
                          setorController.text.isNotEmpty &&
                          emailController.text.isNotEmpty &&
                          tipoController.text.isNotEmpty &&
                          senhaController.text.isNotEmpty) {
                        context.read<UsuarioBloc>().add(UsuarioCreate(
                              nomeController.text,
                              usuarioController.text,
                              setorController.text,
                              emailController.text,
                              tipoController.text,
                              senhaController.text,
                            ));
                        context.read<AuthBloc>().add(AuthReauthenticateEvent());
                        Navigator.pop(context);
                      } else {
                        showBlocSnackbar(
                          context,
                          "Por favor, preencha todos os campos antes de prosseguir",
                          postFrameCallBack: false,
                        );
                      }
                    },
                    style: ElevatedButton.styleFrom(
                      backgroundColor: Colors.transparent,
                      shadowColor: Colors.transparent,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(
                            MediaQuery.of(context).size.height * 0.0222),
                      ),
                    ),
                    child: Text(
                      "Concluir",
                      style: TextStyle(
                        fontFamily: "FredokaOne",
                        fontSize: MediaQuery.of(context).size.height * 0.022,
                        color: Colors.white,
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
        );
      },
    );
  }
}
