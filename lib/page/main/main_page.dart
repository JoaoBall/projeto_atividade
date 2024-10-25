import 'package:flutter/material.dart';
import 'package:projeto_atividade/page/main/main_state.dart';
import 'package:projeto_atividade/model/entity/companies/companies.dart';

class MainPage extends StatefulWidget {
  final Companies companies;

  const MainPage(this.companies, {super.key});

  @override
  State<MainPage> createState() => MainState();
}
