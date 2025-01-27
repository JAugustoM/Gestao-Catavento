import 'package:mask_text_input_formatter/mask_text_input_formatter.dart';

// Routes

const loginRoute = "/login/";
const homeRoute = "/home/";
const crudFuncionariosRoute = "/dashboardEmployees/";

const produtosRoute = "/dashboardProdutos/";
const atividadesFuncionarioRoute = "/employee/task";
const dadosFuncionario = "/employee/data";
const desempenhoAdminRoute = "/dashboardDesempenhoAdmin";

// Supabase

const supabaseUrl = 'https://gfxmrqhwjqekfzrlurqr.supabase.co';
const supabaseKey = String.fromEnvironment('ANON_KEY');
const boloPadrao =
    'https://gfxmrqhwjqekfzrlurqr.supabase.co/storage/v1/object/public/imagens/cake.png';

// Formatters

const timeFormat = 'yyyy-MM-dd HH:mm:ss';
final dateInputFormat = MaskTextInputFormatter(
  mask: "##/##/##",
  filter: {
    "#": RegExp(r'\d+|-|/'),
  },
);
