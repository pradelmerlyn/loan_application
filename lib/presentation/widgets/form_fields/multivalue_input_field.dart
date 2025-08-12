import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class MultiValueInputField extends StatefulWidget {
  final String label;
  final TextEditingController controller; 
  final List<String> initialValues;
  final ValueChanged<List<String>>? onChanged;
  final FormFieldValidator<List<String>>? validator; // 

  const MultiValueInputField({
    super.key,
    required this.label,
    required this.controller,
    this.initialValues = const [],
    this.onChanged,
    this.validator,
  });

  @override
  State<MultiValueInputField> createState() => _MultiValueInputFieldState();
}

class _MultiValueInputFieldState extends State<MultiValueInputField> {
  final FocusNode _entryFocus = FocusNode();
  final TextEditingController _entryCtrl = TextEditingController();
  late List<String> _values;

  @override
  void initState() {
    super.initState();
    _values = _parse(widget.controller.text);
    if (widget.initialValues.isNotEmpty) {
      _values.addAll(widget.initialValues.where((e) => !_values.contains(e)));
      _writeBack(); // ensure controller reflects initialValues too
    }
    widget.controller.addListener(_syncFromController);
  }

  @override
  void dispose() {
    widget.controller.removeListener(_syncFromController);
    _entryCtrl.dispose();
    _entryFocus.dispose();
    super.dispose();
  }

  List<String> _parse(String s) => s
      .split(RegExp(r'[,\s]+'))
      .map((e) => e.trim())
      .where((e) => e.isNotEmpty)
      .toList();

  void _writeBack() {
    widget.controller.text = _values.join(', ');
    widget.onChanged?.call(List.unmodifiable(_values));
  }

  void _syncFromController() {
    final parsed = _parse(widget.controller.text);
    if (parsed.join('|') != _values.join('|')) {
      setState(() => _values = parsed);
    }
  }

  void _tryAdd(String raw, FormFieldState<List<String>> field) {
    final v = raw.trim();
    if (v.isEmpty || _values.contains(v)) return;
    setState(() {
      _values.add(v);
      _entryCtrl.clear();
    });
    field.didChange(List.unmodifiable(_values)); // ✅ notify FormField
    _writeBack();
  }

  void _remove(String v, FormFieldState<List<String>> field) {
    setState(() {
      _values.remove(v);
    });
    field.didChange(List.unmodifiable(_values)); // ✅ notify FormField
    _writeBack();
  }

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);

    return FormField<List<String>>(
      initialValue: List.unmodifiable(_values),
      validator: widget.validator, 
      builder: (field) {
        return Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            InputDecorator(
              decoration: InputDecoration(
                labelText: widget.label,
                floatingLabelBehavior: FloatingLabelBehavior.always,
                filled: true,
                fillColor: Colors.white,
                contentPadding:
                    const EdgeInsets.symmetric(horizontal: 16, vertical: 14),
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(8),
                ),
                enabledBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(8),
                  borderSide: BorderSide(color: theme.colorScheme.onSecondary),
                ),
                focusedBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(8),
                  borderSide:
                      BorderSide(color: theme.colorScheme.primary, width: 2),
                ),
                errorText: field.errorText, 
              ),
              child: Wrap(
                spacing: 8,
                runSpacing: 8,
                children: [
                  for (final v in _values)
                    Chip(
                      label: Text(v),
                      onDeleted: () => _remove(v, field),
                    ),
                  SizedBox(
                    width: 160,
                    child: KeyboardListener(
                      focusNode: _entryFocus,
                      onKeyEvent: (event) {
                        if (HardwareKeyboard.instance
                            .isLogicalKeyPressed(LogicalKeyboardKey.enter)) {
                          _tryAdd(_entryCtrl.text, field);
                        }
                      },
                      child: TextField(
                        controller: _entryCtrl,
                        decoration: const InputDecoration(
                          isDense: true,
                          border: InputBorder.none,
                          hintText: 'Type and press Enter…',
                        ),
                        onChanged: (t) {
                          if (t.endsWith(',') || t.endsWith(' ')) {
                            _tryAdd(t.substring(0, t.length - 1), field);
                          }
                        },
                        onSubmitted: (v) => _tryAdd(v, field),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ],
        );
      },
    );
  }
}
