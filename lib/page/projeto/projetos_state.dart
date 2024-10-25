import 'package:flutter/material.dart';
import 'package:projeto_atividade/util/constants.dart';
import 'package:projeto_atividade/page/main/main_page.dart';
import 'package:projeto_atividade/base/state/base_state.dart';
import 'package:projeto_atividade/widget/list/list_widget.dart';
import 'package:projeto_atividade/widget/text/text_widget.dart';
import 'package:projeto_atividade/page/projeto/projetos_page.dart';
import 'package:projeto_atividade/page/projeto/projetos_model.dart';
import 'package:projeto_atividade/widget/appbar/appbar_widget.dart';
import 'package:projeto_atividade/widget/future/future_widget.dart';
import 'package:projeto_atividade/widget/list/list_item_widget.dart';
import 'package:projeto_atividade/model/entity/companies/companies.dart';

class ProjetosState extends BaseState<ProjetosPage> implements AppbarSearchCallback {
  final _model = ProjetosModel();

  @override
  Future<bool> onLoad() async {
    if (!super.loaded) {
      // Lists
      await _model.findCompany();
    }
    return super.onLoad();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppbarWidget(
        hasWillPop: false,
        searchCallback: this,
        title: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            TextWidget(
              text: Strings.projeto_toolbar_title,
              color: Colors.white,
              fontSize: 26,
              fontWeight: FontWeight.w700,
            ),
          ],
        ),
      ),
      body: FutureWidget<bool>(
        future: onLoad(),
        widget: (context, data) {
          return ListWidget(data: _model.filtered, builder: _item);
        },
      ),
    );
  }

  @override
  void onSearch(String value) {
    setState(() {
      _model.filtered = _model.entities.where((o) => o.toString().contains(value.toLowerCase())).toList();
    });
  }

  @override
  void onSearchReset() {
    setState(() {
      _model.filtered = _model.entities;
    });
  }

  @override
  void onSearchStateChange(bool state) {
    _model.setSearchState(state);
  }

  @override
  bool onIsSearching() {
    return _model.getSearchState();
  }

  Widget _item(Companies value) {
    return ListItemWidget(
      widget: (context) {
        return Center(
          child: Row(
            children: [
              const SizedBox(width: 20),
              const Icon(
                Icons.scatter_plot,
                size: 35,
                color: Colors.white,
              ),
              const SizedBox(width: 20),
              TextWidget(
                text: "${value.name} Unit",
                color: Colors.white,
                fontSize: 18,
              ),
            ],
          ),
        );
      },
      onTap: (context) {
        Navigator.of(context).push(
          MaterialPageRoute(
            builder: (context) => MainPage(
              value,
            ),
            settings: const RouteSettings(
              name: Constants.ROUTE_MAIN_PAGE,
            ),
          ),
        );
      },
    );
  }
}
