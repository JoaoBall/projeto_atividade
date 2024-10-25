import 'dart:io' show Platform;
import 'package:flutter/material.dart';
import 'package:projeto_atividade/base/state/base_state.dart';



class AppbarWidget extends StatefulWidget implements PreferredSizeWidget {
  final bool hasWillPop;
  final AppbarSearchCallback? searchCallback;
  final Widget title;
  final List<Widget>? actions;

  const AppbarWidget({
    super.key,
    required this.hasWillPop,
    this.searchCallback,
    required this.title,
    this.actions,
  });

  @override
  Size get preferredSize => const Size.fromHeight(kToolbarHeight);

  @override
  State<StatefulWidget> createState() => _AppbarWidgetState();
}

class _AppbarWidgetState extends BaseState<AppbarWidget> {
  ModalRoute? modalRoute;
  ScaffoldState? scaffoldState;
  bool? canPop;
  bool? hasDrawer;

  @override
  Widget build(BuildContext context) {
    modalRoute = ModalRoute.of(context);
    scaffoldState ??= Scaffold.maybeOf(context);

    canPop ??= modalRoute?.canPop ?? false;
    hasDrawer ??= scaffoldState?.hasDrawer ?? false;

    if (Platform.isIOS) {
      return _ios();
    } else {
      return _android();
    }
  }

  Widget _android() {
    return AppBar(
      centerTitle: false,
      title: !_isSearching()
          ? widget.title
          : TextField(
              style: const TextStyle(color: Colors.white),
              cursorColor: Colors.white,
              decoration: InputDecoration(
                icon: const Icon(
                  Icons.search,
                  color: Colors.grey,
                ),
                hintText: Strings.common_search,
                hintStyle: const TextStyle(color: Colors.grey),
              ),
              onChanged: (value) => widget.searchCallback!.onSearch(value),
            ),
      actions: [
        if (!_hasSearchBar()) ...{
          ...?widget.actions
        } else ...{
          if (!_isSearching()) ...{
            IconButton(
              icon: const Icon(Icons.search),
              onPressed: () => _onSearchReset(true),
            )
          } else ...{
            IconButton(
              icon: const Icon(Icons.cancel),
              onPressed: () => _onSearchReset(false),
            )
          },
          Visibility(
            visible: !_isSearching(),
            child: Row(
              children: [...?widget.actions],
            ),
          ),
        },
      ],
    );
  }

  Widget _ios() {
    return AppBar(
      automaticallyImplyLeading: false,
      centerTitle: false,
      titleSpacing: 0.0,
      title: Row(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          if (canPop ?? false) ...{
            IconButton(
              icon: const Icon(Icons.arrow_back_ios_new),
              onPressed: () {
                if (widget.hasWillPop) {
                  modalRoute?.willPop();
                } else {
                  Navigator.of(context).pop();
                }
              },
            ),
          },
          if (hasDrawer ?? false) ...{
            IconButton(
              icon: const Icon(Icons.menu),
              onPressed: () => scaffoldState?.openDrawer(),
            )
          },
          const SizedBox(width: 16.0),
          Expanded(
            child: !_isSearching()
                ? widget.title
                : TextField(
                    style: const TextStyle(color: Colors.white),
                    cursorColor: Colors.white,
                    decoration: InputDecoration(
                      icon: const Icon(
                        Icons.search,
                        color: Colors.grey,
                      ),
                      hintText: Strings.common_search,
                      hintStyle: const TextStyle(color: Colors.grey),
                    ),
                    onChanged: (value) => widget.searchCallback!.onSearch(value),
                  ),
          )
        ],
      ),
      actions: [
        if (!_hasSearchBar()) ...{
          ...?widget.actions
        } else ...{
          if (!_isSearching()) ...{
            IconButton(
              icon: const Icon(Icons.search),
              onPressed: () => _onSearchReset(true),
            )
          } else ...{
            IconButton(
              icon: const Icon(Icons.cancel),
              onPressed: () => _onSearchReset(false),
            )
          },
          Visibility(
            visible: !_isSearching(),
            child: Row(
              children: [...?widget.actions],
            ),
          ),
        },
      ],
    );
  }

  bool _hasSearchBar() {
    return widget.searchCallback != null;
  }

  bool _isSearching() {
    return widget.searchCallback?.onIsSearching() ?? false;
  }

  void _onSearchReset(bool value) {
    setState(() {
      widget.searchCallback?.onSearchStateChange(value);
    });

    widget.searchCallback?.onSearchReset();
  }
}

// Callback
abstract class AppbarSearchCallback {
  void onSearch(String value);

  void onSearchReset();

  void onSearchStateChange(bool state);

  bool onIsSearching();
}
