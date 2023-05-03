import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:tfg_ac_partes_trabajo/themes/color_styles.dart';
import 'package:tfg_ac_partes_trabajo/themes/font_styles.dart';
import 'package:tfg_ac_partes_trabajo/utils/extensions.dart';

const double _kMenuItemHeight = kMinInteractiveDimension;

/// {@template expanded_dropdown}
/// Widget to show list of items when is expanded in the botton.
///
/// The `hint` is used to show a initial text when nothing has been
/// selected yet.
/// If you want to change the separator between the items, you can
/// pass a new widget in `separator` propertie.
///
/// You can build a custom item implement the `itemBuilder` or use:
/// * [TextExpandedDropdownItem]
///    {@macro text_expanded_dropdown_item}
///
/// * [CheckExpandedDropdownItem]
///    {@macro check_expanded_dropdown_item}
///
/// * [ColumnExpandedDropdownItem]
///    {@macro column_expanded_dropdown_item}
/// {@endtemplate}
class ExpandedDropdown<T> extends StatefulWidget {
  /// {@macro expanded_dropdown}
  const ExpandedDropdown({
    super.key,
    this.title,
    this.hint,
    this.subHint,
    this.trailingHint,
    this.showSubHint = false,
    this.showTrailingHint = false,
    this.separator,
    this.value,
    this.errorVisible,
    this.errorText,
    required this.onChange,
    required this.items,
    this.padding = const EdgeInsets.fromLTRB(24, 0, 24, 0),
    this.itemBuilder,
    this.maxItemToResize = 2,
    this.onCheckAllChange,
    this.itemPadding = const EdgeInsets.only(left: 10, right: 10),
  });

  /// Title to show in the header of the widget.
  final String? title;

  /// Shows the first time the widget is built.
  final String? hint;

  /// Text to show below the [hint].
  final String? subHint;

  /// Controls the visibility of the [subHint].
  final bool showSubHint;

  /// Controls the visibility of the [subHint].
  final bool showTrailingHint;

  /// Widget to show in the right side of the [hint].
  final String? trailingHint;

  /// Show between each item in the list.
  final Widget? separator;

  /// Show text error
  final bool? errorVisible;

  /// Show text error
  final String? errorText;

  /// Defines how the selected value will look once the list is hidden.
  ///
  /// If `null` the [hint] will be shown instead. The [hint] must be set
  /// to `null` to use this property.
  final BaseExpandedDropdownItem<T>? value;

  /// List of items to show in the list.
  ///
  /// Use [TextExpandedDropdownItem] for despplay a simple text. For multiple
  /// selection use [CheckExpandedDropdownItem]. You can build a custom item
  /// implement the `itemBuilder`.
  final List<BaseExpandedDropdownItem<T>> items;

  /// Padding that covers the entire widget.
  final EdgeInsets? padding;

  final EdgeInsets itemPadding;

  /// The function is call when is selected one of items in the list.
  ///
  /// Takes the value of the item selected.
  final void Function(int index) onChange;

  /// Called when `check all` item is selected.
  final void Function(bool status)? onCheckAllChange;

  /// Use to build a custom item.
  ///
  /// The [itemBuilder] takes the BuildContext and current value [T] and
  /// must return a widget.
  final Widget Function(BuildContext context, T value)? itemBuilder;

  /// Decide when resize the [hint] text.
  final int maxItemToResize;

  @override
  State<ExpandedDropdown<T>> createState() => _ExpandedDropdownState<T>();
}

class _ExpandedDropdownState<T> extends State<ExpandedDropdown<T>> {
  bool _isItemListVisible = false;
  late String _currentText;
  String? _leadingText;
  String? _subtitle;
  final _checksSelected = <int>{};
  bool _resizeText = false;
  bool _isCheckAll = false;

  BaseExpandedDropdownItem<T>? _value;

  @override
  void initState() {
    if (widget.hint == null && widget.subHint == null) {
      _value = widget.value;
    }

    _currentText = widget.hint ?? '';
    _subtitle = widget.subHint;
    _leadingText = widget.trailingHint;
    if (widget.items is List<CheckExpandedDropdownItem<T>>) {
      for (var i = 0; i < widget.items.length; i++) {
        if ((widget.items[i] as CheckExpandedDropdownItem<T>).isActive) {
          _checksSelected.add(i);
        }
      }
      _isCheckAll = widget.items
          .every((check) => (check as CheckExpandedDropdownItem<T>).isActive);
      _changeSelectedText();
    }
    super.initState();
  }

  void _changeSelectedText() {
    _resizeText = _checksSelected.length > widget.maxItemToResize;
    if (_checksSelected.isNotEmpty) {
      _currentText =
          _checksSelected.map((e) => widget.items[e].text).join(', ');
    } else {
      _currentText = widget.hint ?? '';
    }
  }

  @override
  void didUpdateWidget(covariant ExpandedDropdown<T> oldWidget) {
    super.didUpdateWidget(oldWidget);

    if (widget.value != null && widget.value != _value) {
      _value = widget.value;
      _currentText = _value?.text ?? widget.hint ?? '';
      _subtitle = _value?.subText ?? widget.subHint;
      _leadingText = _value?.trailingText ?? widget.trailingHint;
    }
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: widget.padding,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        mainAxisSize: MainAxisSize.min,
        children: [
          (widget.title != null)
              ? Text(
                  widget.title!.toUpperCase(),
                  style: MyFontStyles(MyColorStyles.titleColor)
                      .getSourceSansPro14Regular(),
                )
              : const SizedBox.shrink(),
          Row(
            children: [
              Expanded(
                child: GestureDetector(
                  onTap: () {
                    if (_value != null || widget.items.isNotEmpty) {
                      setState(() {
                        _isItemListVisible = !_isItemListVisible;
                      });
                    }
                  },
                  child: Container(
                    constraints:
                        const BoxConstraints(minHeight: _kMenuItemHeight),
                    decoration: const BoxDecoration(
                      border: Border(
                        bottom: BorderSide(
                          width: 1,
                          color: MyColorStyles.darkBlueColor,
                        ),
                      ),
                    ),
                    child: Padding(
                      padding: _value != null
                          ? EdgeInsets.zero
                          : const EdgeInsets.only(bottom: 4.0, top: 4.0),
                      child: Row(
                        children: [
                          Expanded(
                            child: _value ??
                                Column(
                                  mainAxisSize: MainAxisSize.min,
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Text(
                                      _currentText,
                                      maxLines: 2,
                                      overflow: TextOverflow.ellipsis,
                                      style: _resizeText
                                          ? MyFontStyles(
                                              MyColorStyles.darkGreyColor,
                                            ).getSourceSansPro12Regular()
                                          : MyFontStyles(
                                              MyColorStyles.darkGreyColor,
                                            ).getSourceSansPro16Regular(),
                                    ),
                                    if (widget.showSubHint && _subtitle != null)
                                      Padding(
                                        padding:
                                            const EdgeInsets.only(top: 4.0),
                                        child: Text(
                                          _subtitle!,
                                          maxLines: 1,
                                          overflow: TextOverflow.ellipsis,
                                          style: MyFontStyles(
                                            MyColorStyles.darkGreyColor60,
                                          ).getSourceSansPro12Regular(),
                                        ),
                                      ),
                                  ],
                                ),
                          ),
                          if (_leadingText != null && widget.showTrailingHint)
                            Padding(
                              padding:
                                  const EdgeInsets.symmetric(horizontal: 16.0),
                              child: Text(
                                _leadingText!,
                                style: MyFontStyles(MyColorStyles.darkGreyColor)
                                    .getSourceSansPro16Regular(),
                              ),
                            ),
                          (_value != null || widget.items.isNotEmpty)
                              ? (SvgPicture.asset(
                                  width: 16,
                                  _isItemListVisible
                                      ? 'assets/icon_arrow_up.svg'
                                      : 'assets/icon_arrow_down.svg',
                                ))
                              : const SizedBox.shrink(),
                        ],
                      ),
                    ),
                  ),
                ),
              ),
            ],
          ),
          Visibility(
            child: widget.errorVisible != null && widget.errorVisible == true
                ? Container(
                    width: double.infinity,
                    margin: const EdgeInsets.all(0),
                    child: Row(
                      children: [
                        Container(
                          margin: const EdgeInsets.fromLTRB(0, 10, 5, 0),
                          child: SvgPicture.asset(
                            width: 16,
                            'assets/icon_wrong.svg',
                            color: const Color(0xFFD33038).withOpacity(0.90),
                          ),
                        ),
                        Container(
                          margin: const EdgeInsets.only(top: 10),
                          child: Text(
                            style: !widget.errorVisible!
                                ? MyFontStyles(
                                    MyColorStyles.titleColor.withOpacity(0),
                                  ).getSourceSansPro12Regular()
                                : MyFontStyles(MyColorStyles.negativeColor)
                                    .getSourceSansPro12Regular(),
                            widget.errorText ?? 'Este campo esta vacío.',
                          ),
                        ),
                      ],
                    ),
                  )
                : const SizedBox(),
          ),
          Visibility(
            visible: _isItemListVisible,
            child: Container(
              width: double.infinity,
              decoration: BoxDecoration(
                border: Border.all(
                  width: 1,
                  color: Colors.black38,
                ),
              ),
              child: widget.items.isNotEmpty
                  ? Column(
                      mainAxisAlignment: MainAxisAlignment.start,
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        if (widget.items is List<CheckExpandedDropdownItem<T>>)
                          Column(
                            mainAxisSize: MainAxisSize.min,
                            children: [
                              GestureDetector(
                                onTap: () {
                                  setState(() {
                                    _isCheckAll = !_isCheckAll;

                                    if (_isCheckAll) {
                                      _checksSelected.clear();
                                      _checksSelected.addAll(
                                        List<int>.generate(
                                          widget.items.length,
                                          (index) => index,
                                        ),
                                      );
                                    } else {
                                      _checksSelected.clear();
                                    }
                                    _changeSelectedText();

                                    widget.onCheckAllChange?.call(_isCheckAll);
                                  });
                                },
                                child: CheckExpandedDropdownItem(
                                  text: context
                                      .translate('multi_seleccionar_todo'),
                                  value: 'select_all',
                                  isActive: _isCheckAll,
                                  padding: widget.itemPadding,
                                ),
                              ),
                              Padding(
                                padding: widget.itemPadding,
                                child: widget.separator ??
                                    const Divider(thickness: 1, height: 0),
                              ),
                            ],
                          ),
                        ListView.separated(
                          padding: widget.itemPadding,
                          physics: const NeverScrollableScrollPhysics(),
                          shrinkWrap: true,
                          itemCount: widget.items.length,
                          separatorBuilder: (context, index) =>
                              widget.separator ??
                              const Divider(thickness: 1, height: 0),
                          itemBuilder: (BuildContext context, int index) {
                            final itemSelected = widget.items[index];
                            Widget? item;

                            if (widget.itemBuilder != null) {
                              item = widget.itemBuilder!
                                  .call(context, itemSelected.value);
                            }

                            return InkWell(
                              onTap: () {
                                widget.onChange.call(index);
                                _isCheckAll = false;
                                if (itemSelected is CheckExpandedDropdownItem) {
                                  final contains = _checksSelected.any(
                                    (e) => e == index,
                                  );

                                  if (contains) {
                                    _checksSelected.remove(index);
                                  } else {
                                    _checksSelected.add(index);
                                  }

                                  _changeSelectedText();
                                } else {
                                  _isItemListVisible = !_isItemListVisible;
                                  _currentText = itemSelected.text;
                                  _subtitle = itemSelected.subText;
                                  _leadingText = itemSelected.trailingText;
                                  setState(() {
                                    if (widget.hint == null &&
                                        widget.subHint == null) {
                                      _value = itemSelected;
                                    }
                                  });
                                }
                              },
                              child: item ?? itemSelected,
                            );
                          },
                        ),
                      ],
                    )
                  : Container(
                      constraints:
                          const BoxConstraints(minHeight: _kMenuItemHeight),
                      child: Center(
                        child: Text(
                          context.translate('empty').toUpperCase(),
                          style: MyFontStyles(MyColorStyles.darkGreyColor)
                              .getSourceSansPro16Regular(),
                        ),
                      ),
                    ),
            ),
          ),
        ],
      ),
      // ),
    );
  }
}

/// {@template column_expanded_dropdown_item}
/// Display a column of childs.
///
/// See example in componets page:
/// ```dart
/// ExpandedDropdown<_Country>(
///   title: 'Colum - of - Items',
///   padding: const EdgeInsets.fromLTRB(24, 24, 24, 24),
///   value: ColumnExpandedDropdownItem(
///     value: const _Country(
///       name: 'España',
///       code: 'ES',
///       flag: 'assets/currencyFlags/ES.svg',
///       isFav: true,
///     ),
///     padding: EdgeInsets.zero,
///     text: 'España',
///     children: [
///       Text(
///         'España',
///         style: MyFontStyles(MyColorStyles.darkBlueColor)
///             .getSourceSansPro14Bold(),
///       ),
///     ],
///   ),
///   onChange: (index) {
///     log(index.toString());
///   },
///   items: _contries
///       .map(
///         (country) => ColumnExpandedDropdownItem(
///           value: country,
///           text: country.name,
///           children: [
///             Text(country.code),
///             Text(country.flag),
///             Text('Is fav: ${country.isFav}'),
///           ],
///         ),
///       )
///       .toList(),
/// ),
/// ```
/// {@endtemplate}
class ColumnExpandedDropdownItem<V> extends BaseExpandedDropdownItem<V> {
  /// {@macro column_expanded_dropdown_item}
  const ColumnExpandedDropdownItem({
    super.key,
    super.padding,
    super.itemHeight,
    required super.value,
    required super.text,
    required this.children,
    this.crossAxisAlignment = CrossAxisAlignment.start,
  });

  final List<Widget> children;
  final CrossAxisAlignment crossAxisAlignment;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: padding,
      child: Container(
        constraints: const BoxConstraints(minHeight: _kMenuItemHeight),
        padding: const EdgeInsets.symmetric(vertical: 10),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Expanded(
              flex: 2,
              child: Column(
                mainAxisSize: MainAxisSize.min,
                crossAxisAlignment: crossAxisAlignment,
                children: [
                  Text(
                    text,
                    maxLines: 2,
                    overflow: TextOverflow.ellipsis,
                    style: MyFontStyles(MyColorStyles.darkGreyColor)
                        .getSourceSansPro16Regular(),
                  ),
                  ...children,
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}

/// {@template check_expanded_dropdown_item}
/// Display a selecteable item in the list.
///
/// Example:
/// ```dart
/// final countries = [Country('Brazil', isFavorite: true), Country('USA', isFavorite: false)];
///
/// ExpandedDropdown<Contry>(
///   title: 'Favorite countries',
///   hint: 'Select your favorite countries',
///   onChange: (index) {
///     setState(() {
///       final value = countries[index];
///       countries[index] = value.copyWith(isFavorite: !value.isFavorite);
///     });
///   },
///   items: countries
///       .map((contry) => CheckExpandedDropdownItem<Contry>(
///             value: contry,
///             text: contry.name,
///             isActive: contry.isFavorite,
///           ))
///       .toList(),
/// )
/// ```
/// {@endtemplate}
class CheckExpandedDropdownItem<C> extends BaseExpandedDropdownItem<C> {
  CheckExpandedDropdownItem({
    Key? key,
    required super.value,
    required super.text,
    super.trailingText,
    super.itemHeight,
    super.padding,
    super.subText,
    this.isActive = false,
  }) : super(key: key ?? ValueKey(value.hashCode));

  final bool isActive;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: padding,
      // height: itemHeight,
      constraints: BoxConstraints(minHeight: itemHeight),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          AbsorbPointer(
            child: Transform.scale(
              scale: 1.2,
              child: Checkbox(
                visualDensity: VisualDensity.compact,
                materialTapTargetSize: MaterialTapTargetSize.shrinkWrap,
                checkColor: Colors.white,
                fillColor:
                    MaterialStateProperty.all(MyColorStyles.darkBlueColor),
                value: isActive,
                onChanged: (bool? value) {},
              ),
            ),
          ),
          const SizedBox(width: 6),
          Expanded(
            flex: 2,
            child: Column(
              mainAxisSize: MainAxisSize.min,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  text,
                  maxLines: 2,
                  overflow: TextOverflow.ellipsis,
                  style: MyFontStyles(MyColorStyles.darkGreyColor)
                      .getSourceSansPro16Regular(),
                ),
                if (subText != null)
                  Text(
                    subText!,
                    maxLines: 2,
                    overflow: TextOverflow.ellipsis,
                    style: MyFontStyles(MyColorStyles.darkGreyColor60)
                        .getSourceSansPro12Regular(),
                  ),
              ],
            ),
          ),
          if (trailingText != null)
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16.0),
              child: Text(
                trailingText!,
                maxLines: 1,
                overflow: TextOverflow.ellipsis,
                style: MyFontStyles(MyColorStyles.darkGreyColor)
                    .getSourceSansPro16Regular(),
              ),
            ),
        ],
      ),
    );
  }
}

/// {@template text_expanded_dropdown_item}
/// Displays a simple text item in the dropdown list.
///
/// Example:
/// ```dart
/// final countries = ['France', 'Germany', 'Italy', 'Spain', 'United Kingdom'];
///
/// ExpandedDropdown<String>(
///   title: 'Countries',
///   hint: 'Select a country',
///   onChange: (country) => log('onChange: $country'),
///   items: countries.map((e) => TextExpandedDropdownItem<String>(text: e, value: e)).toList(),
/// )
/// ```
/// {@endtemplate}
class TextExpandedDropdownItem<T> extends BaseExpandedDropdownItem<T> {
  const TextExpandedDropdownItem({
    super.key,
    required super.value,
    required super.text,
    super.trailingText,
    super.itemHeight,
    super.padding = const EdgeInsets.symmetric(vertical: 10),
    super.subText,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      constraints: const BoxConstraints(minHeight: _kMenuItemHeight),
      padding: padding,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Expanded(
            flex: 2,
            child: Column(
              mainAxisSize: MainAxisSize.min,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  text,
                  maxLines: 2,
                  overflow: TextOverflow.ellipsis,
                  style: MyFontStyles(MyColorStyles.darkGreyColor)
                      .getSourceSansPro16Regular(),
                ),
                if (subText != null)
                  Text(
                    subText!.toUtf8,
                    maxLines: 2,
                    overflow: TextOverflow.ellipsis,
                    style: MyFontStyles(MyColorStyles.darkGreyColor60)
                        .getSourceSansPro12Regular(),
                  ),
              ],
            ),
          ),
          if (trailingText != null)
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16.0),
              child: Text(
                trailingText!,
                maxLines: 1,
                overflow: TextOverflow.ellipsis,
                style: MyFontStyles(MyColorStyles.darkGreyColor)
                    .getSourceSansPro16Regular(),
              ),
            ),
        ],
      ),
    );
  }
}

/// {@template base_expanded_dropdown_item}
/// Base class for the items of the [ExpandedDropdown].
///
/// It's used to create a custom item.
/// {@endtemplate}
abstract class BaseExpandedDropdownItem<T> extends StatelessWidget {
  /// {@macro base_expanded_dropdown_item}
  const BaseExpandedDropdownItem({
    super.key,
    required this.value,
    this.itemHeight = 60,
    required this.text,
    this.trailingText,
    this.subText,
    this.padding = const EdgeInsets.all(0),
  });

  /// Value of the item.
  final T value;

  /// Height of the item.
  final double itemHeight;

  /// Text of the item to show.
  final String text;

  /// Text to show below the [text].
  final String? subText;

  /// Text to show in the left side of the item.
  final String? trailingText;

  /// Padding of the item.
  final EdgeInsets padding;
}
