import 'package:flutter/material.dart';

import 'my_button.dart';

class DialogBox extends StatelessWidget {
  final TextEditingController controller;
  final VoidCallback onSave;
  final VoidCallback onCancel;

  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();

  DialogBox({
    super.key,
    required this.controller,
    required this.onSave,
    required this.onCancel,
  });

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      content: Form(
        key: _formKey,
        child: SizedBox(
          height: 150,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              TextFormField(
                controller: controller,
                autofocus: true,
                decoration: const InputDecoration(
                  border: OutlineInputBorder(),
                  hintText: "Add a new task",
                ),
                validator: (value) {
                  if (value == null || value.trim().isEmpty) {
                    return "Task name cannot be empty";
                  }

                  if (value.trim().length < 3) {
                    return "Task must be at least 3 characters";
                  }

                  if (value.trim().length > 50) {
                    return "Task cannot be more than 50 characters";
                  }

                  return null;
                },
              ),

              // buttons (save and cancel)
              Row(
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  // save button
                  MyButton(
                    buttonName: "Save",
                    onPressed: () {
                      if (_formKey.currentState!.validate()) {
                        onSave();
                      }
                    },
                  ),

                  const SizedBox(width: 8),

                  // cancel button
                  MyButton(buttonName: "Cancel", onPressed: onCancel),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
