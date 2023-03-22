import 'package:flutter/material.dart';
import 'package:flutter_fondations/randomizer_page.dart';
import 'package:flutter_fondations/range_selector_form.dart';
import 'package:flutter_hooks/flutter_hooks.dart';

class RangeSelectorPage extends HookWidget {
  final formKey = GlobalKey<FormState>();

  RangeSelectorPage({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    final min = useState<int>(0);
    final max = useState<int>(0);
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          "Selector Range",
        ),
      ),
      body: RangeSelectorForm(
        formKey: formKey,
        minValueSelector: (value) => min.value = value,
        maxValueSelector: (value) => max.value = value,
      ),
      floatingActionButton: FloatingActionButton(
        child: const Icon(
          Icons.arrow_forward,
        ),
        onPressed: () {
          if (formKey.currentState?.validate() == true) {
            formKey.currentState?.save();
            Navigator.of(context).push(
              MaterialPageRoute(
                builder: (context) => RandomizerPage(
                  min: min.value,
                  max: max.value,
                ),
              ),
            );
          }
        },
      ),
    );
  }
}
