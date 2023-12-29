import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:lettutor/data/providers/language.provider.dart';
import 'package:provider/provider.dart';

class SelectDate extends StatefulWidget {
  final String initialDate;
  final Function onDatePickerComplete;
  const SelectDate(
      {Key? key, required this.initialDate, required this.onDatePickerComplete})
      : super(key: key);

  @override
  State<SelectDate> createState() => _SelectDateState();
}

class _SelectDateState extends State<SelectDate> {
  late DateTime selectedDate;
  late LanguageProvider languageProvider;

  @override
  void initState() {
    super.initState();
    selectedDate = DateTime.parse(widget.initialDate);
  }

  Future<void> _selectDate(BuildContext context) async {
    final DateTime? picked = await showDatePicker(
      context: context,
      initialDate: DateTime.now(),
      firstDate: DateTime(1900),
      lastDate: DateTime(2050),
    );

    if (picked != null && picked != selectedDate) {
      setState(() {
        selectedDate = picked;
      });
      widget.onDatePickerComplete(selectedDate);
    }
  }

  @override
  Widget build(BuildContext context) {
    languageProvider = context.watch<LanguageProvider>();
    return InkWell(
      onTap: () {
        _selectDate(context);
      },
      child: Container(
        height: 48,
        padding: EdgeInsets.symmetric(horizontal: 16),
        decoration: BoxDecoration(
          border: Border.all(
            width: 2,
            color: Colors.grey[400]!,
          ),
          borderRadius: BorderRadius.circular(10),
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(
              DateFormat(languageProvider.language.dateFormat)
                  .format(selectedDate),
              style: TextStyle(
                fontSize: 18,
                fontWeight: FontWeight.w500,
                color: Colors.black87,
              ),
            ),
            Icon(Icons.access_time),
          ],
        ),
      ),
    );
  }
}
