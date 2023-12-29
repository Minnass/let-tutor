import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:lettutor/data/network/apis/schedule/schedule.api.dart';
import 'package:lettutor/data/network/dio_client.dart';
import 'package:lettutor/data/providers/auth.provider.dart';
import 'package:lettutor/data/providers/language.provider.dart';
import 'package:lettutor/domains/entity/user/user.dart';
import 'package:provider/provider.dart';

class BookTutorDialog extends StatefulWidget {
  const BookTutorDialog(
      {Key? key,
      required this.start,
      required this.end,
      required this.scheduleId,
      required this.bookClass})
      : super(key: key);
  final DateTime start;
  final DateTime end;
  final String scheduleId;
  final Function(String, String) bookClass;
  @override
  State<BookTutorDialog> createState() => _BookTutorDialogState();
}

class _BookTutorDialogState extends State<BookTutorDialog> {
  ScheduleApi scheduleApi = ScheduleApi(DioClient(Dio()));
  late AuthProvider authProvider;

  void validate() {
    if (_noteController.text.isEmpty) {
      _noteError = languageProvider.language.requiredField;
    } else {
      _noteError = '';
    }
    setState(() {});
  }

  Future<bool> onBookClass() async {
    validate();
    if (_noteError.isEmpty) {
      return await widget.bookClass(widget.scheduleId, _noteController.text);
    }
    return false;
  }

  late LanguageProvider languageProvider;
  late User? user;
  String _noteError = '';
  final _noteController = TextEditingController();
  String getHoursMinues(DateTime time) {
    return "${time.hour.toString().length == 1 ? "0" + time.hour.toString() : time.hour.toString()}:${time.minute.toString().length == 1 ? "0" + time.minute.toString() : time.minute.toString()}";
  }

  String getDate(DateTime date, String country) {
    return DateFormat('EEEE, d MMMM y', country).format(date);
  }

  @override
  Widget build(BuildContext context) {
    LanguageProvider languageProvider = context.watch<LanguageProvider>();
    user = context.watch<AuthProvider>().currentUser;
    return Dialog(
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(8)),
        child: SingleChildScrollView(
            scrollDirection: Axis.vertical,
            child: Column(children: [
              Padding(
                  padding: const EdgeInsets.fromLTRB(16, 8, 16, 0),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        languageProvider.language.bookingDetails,
                        style: TextStyle(
                            fontWeight: FontWeight.bold, fontSize: 18),
                      ),
                      IconButton(
                          onPressed: () {
                            Navigator.of(context).pop();
                          },
                          icon: const Icon(Icons.close_sharp))
                    ],
                  )),
              const Divider(),
              Padding(
                  padding: const EdgeInsets.fromLTRB(16, 0, 16, 16),
                  child: SingleChildScrollView(
                      child: Column(children: [
                    Table(
                      border: TableBorder.all(
                        color: const Color(0xfff0f0f0),
                        style: BorderStyle.solid,
                        width: 1,
                      ),
                      children: [
                        TableRow(
                            decoration: const BoxDecoration(
                              color: Color(0xfff0f0f0),
                            ),
                            children: [
                              Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Container(
                                      padding: const EdgeInsets.all(8),
                                      child: Text(
                                        languageProvider.language.bookingTime,
                                        style: TextStyle(
                                          fontWeight: FontWeight.w700,
                                        ),
                                        textAlign: TextAlign.left,
                                      ),
                                    )
                                  ])
                            ]),
                        TableRow(children: [
                          Container(
                              padding: const EdgeInsets.all(16),
                              child: Container(
                                padding: const EdgeInsets.symmetric(
                                    horizontal: 8, vertical: 4),
                                decoration: BoxDecoration(
                                  color: const Color(0xffeeeaff),
                                  borderRadius: BorderRadius.circular(10),
                                ),
                                child: Text(
                                  '${getHoursMinues(widget.start)}-${getHoursMinues(widget.end)}, ${getDate(widget.start, languageProvider.language.regionDatetime)}',
                                  textAlign: TextAlign.center,
                                  style: const TextStyle(
                                    fontWeight: FontWeight.bold,
                                    color: Color(0xff7766c7),
                                  ),
                                ),
                              ))
                        ])
                      ],
                    ),
                    const SizedBox(
                      height: 8,
                    ),
                    Table(
                      columnWidths: const {
                        0: FlexColumnWidth(3),
                        1: FlexColumnWidth(7),
                      },
                      border: TableBorder.all(
                        color: const Color(0xfff0f0f0),
                        style: BorderStyle.solid,
                        width: 1,
                      ),
                      children: [
                        TableRow(
                            decoration: const BoxDecoration(
                              color: Color(0xfff0f0f0),
                            ),
                            children: [
                              Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Container(
                                      padding: const EdgeInsets.all(8),
                                      child: Text(
                                        languageProvider.language.balance,
                                        style: TextStyle(
                                          fontWeight: FontWeight.bold,
                                        ),
                                        textAlign: TextAlign.left,
                                      ),
                                    )
                                  ]),
                              Column(
                                  crossAxisAlignment: CrossAxisAlignment.end,
                                  children: [
                                    Container(
                                      padding: const EdgeInsets.all(8),
                                      child: Text(
                                        '${(int.tryParse(user!.walletInfo?.amount ?? "0") ?? 0) ~/ 100000} ${languageProvider.language.lesson}',
                                        style: const TextStyle(
                                          color: Color(0xff7766c7),
                                        ),
                                        textAlign: TextAlign.right,
                                      ),
                                    )
                                  ])
                            ]),
                        TableRow(
                            decoration: const BoxDecoration(
                              color: Color(0xfff0f0f0),
                            ),
                            children: [
                              Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Container(
                                        padding: const EdgeInsets.all(8),
                                        child: Text(
                                          languageProvider.language.price,
                                          style: TextStyle(
                                            fontWeight: FontWeight.bold,
                                          ),
                                          textAlign: TextAlign.left,
                                        ))
                                  ]),
                              Column(
                                  crossAxisAlignment: CrossAxisAlignment.end,
                                  children: [
                                    Container(
                                        padding: const EdgeInsets.all(8),
                                        child: Text(
                                          '10 ${languageProvider.language.lesson}',
                                          style: const TextStyle(
                                            color: Color(0xff7766c7),
                                          ),
                                          textAlign: TextAlign.right,
                                        ))
                                  ])
                            ])
                      ],
                    ),
                    const SizedBox(
                      height: 8,
                    ),
                    Table(
                        border: TableBorder.all(
                          color: const Color(0xfff0f0f0),
                          style: BorderStyle.solid,
                          width: 1,
                        ),
                        children: [
                          TableRow(
                              decoration: const BoxDecoration(
                                color: Color(0xfff0f0f0),
                              ),
                              children: [
                                Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      Container(
                                        padding: const EdgeInsets.all(8),
                                        child: Text(
                                          languageProvider.language.notes,
                                          style: TextStyle(
                                            fontWeight: FontWeight.w700,
                                          ),
                                          textAlign: TextAlign.left,
                                        ),
                                      )
                                    ]),
                              ]),
                          TableRow(children: [
                            Container(
                                padding: const EdgeInsets.all(16),
                                child: TextFormField(
                                    onTap: () {},
                                    minLines: 5,
                                    maxLines: 5,
                                    controller: _noteController,
                                    decoration: const InputDecoration(
                                      border: OutlineInputBorder(),
                                    )))
                          ])
                        ]),
                    const Divider(),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.end,
                      children: [
                        ElevatedButton(
                          onPressed: () {
                            Navigator.of(context).pop(); // Cancel button action
                          },
                          style: ElevatedButton.styleFrom(
                            primary:
                                Colors.white, // Background color for Cancel
                            onPrimary: Colors.blue, // Border color for Cancel
                          ),
                          child: Text(languageProvider.language.cancel),
                        ),
                        const SizedBox(
                            width: 8), // Add some spacing between buttons
                        ElevatedButton(
                          onPressed: () async {
                            final res = await onBookClass();
                            if (_noteError.isEmpty) {
                              Navigator.pop(context, res);
                            }
                          },
                          style: ElevatedButton.styleFrom(
                            primary: Colors.blue, // Background color for Submit
                          ),
                          child: Text(languageProvider.language.book),
                        ),
                      ],
                    ),
                  ])))
            ])));
  }
}
