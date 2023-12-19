import 'package:flutter/material.dart';

class BookTutorDialog extends StatefulWidget {
  const BookTutorDialog(
      {Key? key, required this.start, required this.end, required this.date})
      : super(key: key);
  final String start;
  final String end;
  final String date;

  @override
  State<BookTutorDialog> createState() => _BookTutorDialogState();
}

class _BookTutorDialogState extends State<BookTutorDialog> {
  @override
  Widget build(BuildContext context) {
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
                      const Text(
                        'Booking details',
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
                                      child: const Text(
                                        'Booking Time',
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
                                  '${widget.start}-${widget.end}, ${widget.date}',
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
                                      child: const Text(
                                        'Balance',
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
                                        'You have 10 lesson left',
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
                                        child: const Text(
                                          'Price',
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
                                          '10 lesson',
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
                                        child: const Text(
                                          'Notes',
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
                          child: Text('Cancel'),
                        ),
                        const SizedBox(
                            width: 8), // Add some spacing between buttons
                        ElevatedButton(
                          onPressed: () {},
                          style: ElevatedButton.styleFrom(
                            primary: Colors.blue, // Background color for Submit
                          ),
                          child: Text('Book'),
                        ),
                      ],
                    ),
                  ])))
            ])));
  }
}
