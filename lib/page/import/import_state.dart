import 'package:flutter/material.dart';
import 'package:projeto_atividade/util/assets.dart';
import 'package:projeto_atividade/util/constants.dart';
import 'package:projeto_atividade/util/messenger.dart';
import 'package:projeto_atividade/base/state/base_state.dart';
import 'package:projeto_atividade/widget/text/text_widget.dart';
import 'package:projeto_atividade/page/import/import_page.dart';
import 'package:projeto_atividade/page/import/import_model.dart';
import 'package:projeto_atividade/page/projeto/projetos_page.dart';
import 'package:projeto_atividade/util/exceptions/exceptions.dart';
import 'package:projeto_atividade/network/listener/service_listener.dart';

class ImportState extends BaseState<ImportPage> implements ServiceListener {
  final _model = ImportModel();

  late String _txtServiceMessage = Strings.common_import_init;

  @override
  void initState() {
    super.initState();

    _onLoad();
  }

  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      onWillPop: _onBackPressed,
      child: Container(
        alignment: Alignment.center,
        margin: const EdgeInsets.all(16.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            SizedBox(
              width: 300,
              child: Image.asset(Assets.IMAGE_LOGO),
            ),
            const SizedBox(height: 16.0),
            const CircularProgressIndicator(),
            const SizedBox(height: 8.0),
            TextWidget(
              text: Strings.common_import_advice,
              align: TextAlign.center,
            ),
            const SizedBox(height: 8.0),
            TextWidget(
              text: _txtServiceMessage,
              align: TextAlign.center,
            )
          ],
        ),
      ),
    );
  }

  // Events
  Future<bool> _onBackPressed() async {
    Messenger.snackbar(context, Strings.common_import_wait);

    return false;
  }

  void _onLoad() async {
    try {
      await _model.import();

      _openMain();
    } catch (e) {
      _onError(e);
    }
  }

  void _onError(dynamic error) {
    if (error is RemoteException) {
      Messenger.dialog(
        context: context,
        dismissable: false,
        title: TextWidget(
          color: Colors.red,
          text: Strings.common_attention,
        ),
        message: TextWidget(
          text: Strings.common_import_remote_error(error.toString()),
        ),
        actions: [
          TextButton(
            child: TextWidget(
              align: TextAlign.end,
              text: Strings.common_confirm.toUpperCase(),
            ),
            onPressed: () {
              Navigator.of(context).pop();

              _openMain();
            },
          ),
        ],
      );
    } else {
      Messenger.dialog(
        context: context,
        dismissable: false,
        title: TextWidget(
          color: Colors.red,
          text: Strings.common_attention,
        ),
        message: TextWidget(text: Strings.common_import_error(error.toString())),
        actions: [
          TextButton(
            child: TextWidget(
              align: TextAlign.end,
              text: Strings.common_confirm.toUpperCase(),
            ),
            onPressed: () {
              Navigator.of(context).pop();

              _openMain();
            },
          ),
        ],
      );
    }
  }

  void _openMain() {
    Navigator.of(context).pushReplacement(
      MaterialPageRoute(
        builder: (context) => const ProjetosPage(),
        settings: const RouteSettings(
          name: Constants.ROUTE_PROJETOS_PAGE,
        ),
      ),
    );
  }

  // ServiceListener
  @override
  void onServiceMessage(String message, {int? total, int? index}) {
    setState(() {
      _txtServiceMessage = ServiceListener.message(message, total, index);
    });
  }
}
