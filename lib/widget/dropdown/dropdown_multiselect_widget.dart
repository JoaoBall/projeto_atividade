import 'package:flutter/material.dart';
import 'package:dropdown_search/dropdown_search.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';



class DropdownMultiselectWidget<T> extends StatelessWidget {
  final List<T> data;
  final List<T> selectedData;
  final bool showSearchBox;
  final String? labelText;
  final String? hintText;
  final String Function(T)? onSearch;
  final Function(List<T>)? onChanged;

  const DropdownMultiselectWidget({
    super.key,
    required this.data,
    required this.selectedData,
    required this.showSearchBox,
    this.labelText,
    this.hintText,
    this.onSearch,
    this.onChanged,
  });

  @override
  Widget build(BuildContext context) {
    final Strings = AppLocalizations.of(context)!;

    return DropdownSearch<T>.multiSelection(
      items: data,
      selectedItems: selectedData,
      itemAsString: (item) => onSearch?.call(item) ?? item.toString(),
      popupProps: PopupPropsMultiSelection.dialog(
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
        dialogProps: const DialogProps(barrierDismissible: false),
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
      onChanged: (value) => onChanged?.call(value),
    );
  }
}
