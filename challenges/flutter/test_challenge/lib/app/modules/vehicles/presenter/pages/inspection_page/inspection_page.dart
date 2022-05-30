import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:intl/intl.dart';
import 'package:test_challenge/app/modules/vehicles/domain/entities/inspection.dart';
import 'package:test_challenge/app/modules/vehicles/domain/validator/inspection_validator.dart';
import 'package:test_challenge/app/modules/vehicles/presenter/pages/inspection_page/inspection_store.dart';
import 'package:test_challenge/app/modules/vehicles/presenter/pages/inspection_page/states/inspection_state.dart';

class InspectionPage extends StatefulWidget {
  final String title;
  final Inspection? inspection;
  const InspectionPage({
    Key? key,
    this.title = 'Inspection',
    this.inspection,
  }) : super(key: key);
  @override
  InspectionPageState createState() => InspectionPageState();
}

class InspectionPageState extends State<InspectionPage> {
  final TextEditingController identification = TextEditingController();
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  final TextEditingController date = TextEditingController();
  final InspectionStore store = Modular.get();
  DateTime? dateTime = DateTime.now();

  @override
  void initState() {
    super.initState();
    dateTime = widget.inspection?.date ?? DateTime.now();
    date.text = widget.inspection?.dateFormatted ??
        DateFormat('dd/MM/yyyy').format(dateTime ?? DateTime.now());
    identification.text = widget.inspection?.identification ?? '';

    store.addListener(() {
      if (store.value is SuccessInspectionState) {
        ScaffoldMessenger.of(context).showSnackBar(
          const SnackBar(
            content: Text('Success!'),
            backgroundColor: Colors.green,
          ),
        );
        Modular.to.pop();
      }

      if (store.value is ErrorInspectionState) {
        ScaffoldMessenger.of(context).showSnackBar(
          const SnackBar(
            content: Text('Error!'),
            backgroundColor: Colors.red,
          ),
        );
      }
    });
  }

  @override
  void dispose() {
    super.dispose();
    store.value = InitialInspectionState();
  }

  @override
  Widget build(BuildContext context) {
    final textTheme = Theme.of(context).textTheme;
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(
          vertical: 12,
          horizontal: 24,
        ),
        child: Center(
          child: Form(
            key: _formKey,
            autovalidateMode: AutovalidateMode.onUserInteraction,
            child: Column(
              children: <Widget>[
                Text(
                  "Inspection ${widget.inspection?.dateFormatted ?? ''}",
                  style: textTheme.headline6,
                ),
                const Divider(),
                InkWell(
                  onTap: widget.inspection?.date == null
                      ? () async {
                          dateTime = await showDatePicker(
                            context: context,
                            initialDate: dateTime ?? DateTime.now(),
                            firstDate: DateTime(2000),
                            lastDate: DateTime.now(),
                          );

                          if (dateTime != null) {
                            date.text = DateFormat('MM/dd/yyyy').format(
                              dateTime ?? DateTime.now(),
                            );
                          }
                        }
                      : null,
                  child: AbsorbPointer(
                    child: TextFormField(
                      controller: date,
                      decoration: const InputDecoration(
                        hintText: "Date of inspection",
                      ),
                    ),
                  ),
                ),
                const SizedBox(height: 8),
                AbsorbPointer(
                  absorbing: widget.inspection?.identification != null,
                  child: TextFormField(
                    controller: identification,
                    inputFormatters: [
                      UpperCaseTextFormatter(),
                    ],
                    decoration: const InputDecoration(
                      hintText: "Vehicle Identification",
                    ),
                    validator: (value) {
                      return InspectionValidator(value).vehicleIdentification();
                    },
                    maxLength: 17,
                    maxLengthEnforcement: MaxLengthEnforcement.enforced,
                  ),
                ),
                const SizedBox(height: 12),
                ValueListenableBuilder(
                  valueListenable: store,
                  builder: (context, value, _) {
                    if (value is LoadingInspectionState) {
                      return const Center(
                        child: CircularProgressIndicator(),
                      );
                    }

                    return ElevatedButton(
                      onPressed: widget.inspection?.identification == null
                          ? () async {
                              if (_formKey.currentState?.validate() ?? false) {
                                await store.newInspection(
                                  Inspection(
                                    date: dateTime ?? DateTime.now(),
                                    identification: identification.text,
                                    vehicle: widget.inspection?.vehicle,
                                  ),
                                );
                              }
                            }
                          : null,
                      child: const Text('Save'),
                    );
                  },
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}

class UpperCaseTextFormatter extends TextInputFormatter {
  @override
  TextEditingValue formatEditUpdate(
      TextEditingValue oldValue, TextEditingValue newValue) {
    return TextEditingValue(
      text: newValue.text.toUpperCase(),
      selection: newValue.selection,
    );
  }
}
