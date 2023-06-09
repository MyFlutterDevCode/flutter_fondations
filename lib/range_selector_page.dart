import 'package:flutter/material.dart';
import 'package:flutter_fondations/randomizer_page.dart';
import 'package:flutter_fondations/range_selector_form.dart';

class RangeSelectorPage extends StatelessWidget {
  final formKey = GlobalKey<FormState>();

  RangeSelectorPage({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          "Selector Range",
        ),
      ),
      body: RangeSelectorForm(
        formKey: formKey,
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
                builder: (context) => const RandomizerPage(),
              ),
            );
          }
        },
      ),
    );
  }
}
