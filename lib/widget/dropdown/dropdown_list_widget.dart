import 'package:flutter/material.dart';
import 'package:dropdown_search/dropdown_search.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';


class DropdownListWidget<T> extends StatelessWidget {
  final List<T> data;
  final bool showSearchBox;
  final String labelText;
  final String? hintText;
  final T? selectedItem;
  final String Function(T)? onSearch;
  final Function(T?)? onChanged;

  const DropdownListWidget({
    super.key,
    required this.data,
    required this.showSearchBox,
    required this.labelText,
    this.hintText,
    this.selectedItem,
    this.onSearch,
    this.onChanged,
  });

  @override
  Widget build(BuildContext context) {
    final Strings = AppLocalizations.of(context)!;

    return DropdownSearch<T>(
      items: data,
      itemAsString: (item) => onSearch?.call(item) ?? item.toString(),
      popupProps: PopupProps.menu(
        fit: FlexFit.loose,
        showSearchBox: showSearchBox,
        searchFieldProps: TextFieldProps(
          decoration: InputDecoration(
            border: OutlineInputBorder(
              borderRadius: BorderRadius.circular(2.0),
            ),
            suffixIcon: const Icon(Icons.search),
            labelText: Strings.common_search,
          ),
        ),
        searchDelay: const Duration(milliseconds: 0),
      ),
      dropdownDecoratorProps: DropDownDecoratorProps(
        dropdownSearchDecoration: InputDecoration(
          border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(2.0),
          ),
          labelText: labelText,
          hintText: hintText,
        ),
      ),
      selectedItem: selectedItem,
      onChanged: (value) => onChanged?.call(value),
    );
  }
}
