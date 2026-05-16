import 'package:flutter/material.dart';

class CardLogin extends StatelessWidget {
  final GlobalKey<FormState> formKey;
  final List<Widget> children;

  const CardLogin({super.key, required this.formKey, required this.children});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Container(
          padding: const EdgeInsets.only(bottom: 16, left: 0, right: 0),
          child: Column(
            children: [
              Padding(padding: const EdgeInsets.only(),
                child: Form(
                  key: formKey, 
                  child: Column(
                    spacing: 12,
                    children: children
                  )
                ),
              ),
            ],
          ),
        ),
      ]
    );
  }
}