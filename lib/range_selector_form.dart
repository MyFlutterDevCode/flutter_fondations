import 'package:flutter/material.dart';

typedef IntValueSetter = void Function(int value);

class RangeSelectorForm extends StatelessWidget {
  final GlobalKey formKey;
  final IntValueSetter minValueSelector;
  final IntValueSetter maxValueSelector;

  const RangeSelectorForm({
    Key? key,
    required this.formKey,
    required this.minValueSelector,
    required this.maxValueSelector,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Form(
      key: formKey,
      child: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            RangeSelectorTextFormField(
              labelText: "Minimum",
              intValueSelector: minValueSelector,
            ),
            const SizedBox(height: 12),
            RangeSelectorTextFormField(
              labelText: "Maximum",
              intValueSelector: maxValueSelector,
            ),
          ],
        ),
      ),
    );
  }
}

class RangeSelectorTextFormField extends StatelessWidget {
  final String labelText;
  final IntValueSetter intValueSelector;
  const RangeSelectorTextFormField({
    Key? key,
    required this.labelText,
    required this.intValueSelector,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      decoration: InputDecoration(
        border: const OutlineInputBorder(),
        labelText: labelText,
      ),
      keyboardType: const TextInputType.numberWithOptions(
        decimal: false,
        signed: true,
      ),
      validator: (value) {
        if (value == null || int.tryParse(value) == null) {
          return "Must be an integer";
        } else {
          return null;
        }
      },
      onSaved: (newValue) => intValueSelector(
        int.parse(newValue ?? ""),
      ),
    );
  }
}
