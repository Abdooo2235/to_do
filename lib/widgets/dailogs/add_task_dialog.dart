import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

class AddTaskDialog extends StatefulWidget {
  const AddTaskDialog({
    super.key,
    required this.titleController,
    required this.subTitleController,
    required this.formKey,
    required this.onTap,
  });

  final TextEditingController titleController;
  final TextEditingController subTitleController;
  final GlobalKey<FormState> formKey;
  final Function onTap;

  @override
  State<AddTaskDialog> createState() => _AddTaskDialogState();
}

class _AddTaskDialogState extends State<AddTaskDialog> {
  @override
  Widget build(BuildContext context) {
    return Dialog(
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(16)),
      child: Padding(
        padding: const EdgeInsets.all(32.0),
        child: Form(
          key: widget.formKey,
          child: Column(
            mainAxisSize: MainAxisSize.min,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                AppLocalizations.of(context)!.add,
                style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
              ),
              const SizedBox(
                height: 16,
              ),
              TextFormField(
                controller: widget.titleController,
                validator: (value) {
                  if (value!.isEmpty) {
                    return AppLocalizations.of(context)!.entertaskname;
                  }

                  if (value.length < 5) {
                    return AppLocalizations.of(context)!.entervalidtitle;
                  }

                  return null;
                },
                decoration: InputDecoration(
                  hintText: AppLocalizations.of(context)!.entertaskname,
                  border: OutlineInputBorder(),
                ),
              ),
              const SizedBox(
                height: 16,
              ),
              TextFormField(
                decoration: InputDecoration(
                  hintText: AppLocalizations.of(context)!.entertasksubtitle,
                  border: OutlineInputBorder(),
                ),
                controller: widget.subTitleController,
              ),
              const SizedBox(
                height: 16,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  TextButton(
                    onPressed: () {
                      widget.titleController.clear();
                      widget.subTitleController.clear();
                      Navigator.pop(context);
                    },
                    child: Text(
                      AppLocalizations.of(context)!.cancel,
                      style: TextStyle(color: Colors.red),
                    ),
                  ),
                  ElevatedButton(
                    onPressed: () {
                      if (widget.formKey.currentState!.validate()) {
                        widget.onTap();
                      }
                    },
                    child: Text(AppLocalizations.of(context)!.add),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
