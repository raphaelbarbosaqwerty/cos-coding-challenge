import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:intl/intl.dart';
import 'package:test_challenge/app/modules/vehicles/domain/entities/inspection.dart';
import 'package:test_challenge/app/modules/vehicles/domain/validator/inspection_validator.dart';
import 'package:test_challenge/app/modules/vehicles/presenter/vehicles_store.dart';

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
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  final TextEditingController date = TextEditingController();
  final TextEditingController identification = TextEditingController();
  DateTime? dateTime = DateTime.now();

  final VehiclesStore store = Modular.get();

  @override
  void initState() {
    super.initState();
    dateTime = widget.inspection?.date ?? DateTime.now();
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
                  onTap: () async {
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
                  },
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
                TextFormField(
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
                const SizedBox(height: 12),
                ElevatedButton(
                  onPressed: () async {
                    // TODO - Create new Inspection
                    if (_formKey.currentState?.validate() ?? false) {}
                  },
                  child: const Text('Save'),
                ),
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
