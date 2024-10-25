import 'package:flutter/material.dart';
import 'package:projeto_atividade/page/main/main_page.dart';
import 'package:projeto_atividade/page/main/main_model.dart';
import 'package:projeto_atividade/base/state/base_state.dart';
import 'package:projeto_atividade/widget/text/text_widget.dart';
import 'package:projeto_atividade/widget/future/future_widget.dart';
import 'package:projeto_atividade/widget/appbar/appbar_widget.dart';
import 'package:projeto_atividade/page/treeview/treeview_widget.dart';
import 'package:projeto_atividade/network/response/asset/asset_response.dart';
import 'package:projeto_atividade/network/response/locations/locations_response.dart';

class MainState extends BaseState<MainPage> {
  final _model = MainModel();

  var searchQuery = '';
  var isAlertSelected = false;
  var isSensorTypeSelected = false;

  List<AssetResponse> filteredAssets = [];
  List<LocationsResponse> filteredLocations = [];

  @override
  Future<bool> onLoad() async {
    if (!super.loaded) {
      await _model.find(widget.companies.id);
      // Inicialmente, todos os dados estão visíveis
      filteredAssets = _model.assets;
      filteredLocations = _model.locations;
    }

    return super.onLoad();
  }

  @override
  Widget build(BuildContext context) {
    return FutureWidget<bool>(
      future: onLoad(),
      widget: (context, data) {
        return Scaffold(
          appBar: AppbarWidget(
            hasWillPop: false,
            title: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                TextWidget(text: Strings.assets_toobar_title),
              ],
            ),
            actions: [
              IconButton(
                icon: Icon(
                  Icons.bolt_outlined,
                  color: !isSensorTypeSelected ? Colors.white : Colors.green,
                ),
                onPressed: toggleSensorTypeFilter,
              ),
              IconButton(
                icon: Icon(
                  Icons.info_outline,
                  color: !isAlertSelected ? Colors.white : Colors.red,
                ),
                onPressed: toggleAlertFilter,
              )
            ],
          ),
          body: Column(
            children: [
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: TextField(
                  onChanged: updateSearchQuery,
                  decoration: InputDecoration(
                    hintText: Strings.asses_search,
                    filled: true,
                    isDense: true,
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.all(Radius.circular(4)),
                    ),
                    focusedBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.all(Radius.circular(4)),
                    ),
                    prefixIcon: const Icon(Icons.search),
                  ),
                ),
              ),
              Expanded(
                child: TreeViewWidget(
                  assets: filteredAssets,
                  locations: filteredLocations,
                ),
              ),
            ],
          ),
        );
      },
    );
  }

  void updateSearchQuery(String query) {
    setState(() {
      searchQuery = query.toLowerCase();
      applyFilters();
    });
  }

  void toggleSensorTypeFilter() {
    setState(() {
      isSensorTypeSelected = !isSensorTypeSelected;
      applyFilters();
    });
  }

  void toggleAlertFilter() {
    setState(() {
      isAlertSelected = !isAlertSelected;
      applyFilters();
    });
  }

  void applyFilters() {
    setState(() {
      // Filtragem de ativos com base na consulta de texto
      filteredAssets = _model.assets.where((asset) {
        final matchesSearchQuery = asset.name!.toLowerCase().contains(searchQuery);

        // Filtragem adicional por tipo de sensor
        final matchesSensorType = !isSensorTypeSelected || (asset.sensorType == 'energy' && isSensorTypeSelected);

        // Filtragem adicional por status de alerta
        final matchesAlertStatus = !isAlertSelected || (asset.status == 'alert' && isAlertSelected);

        // Retorna true se o ativo passar em todas as condições de filtro
        return matchesSearchQuery && matchesSensorType && matchesAlertStatus;
      }).toList();
    });
  }
}
