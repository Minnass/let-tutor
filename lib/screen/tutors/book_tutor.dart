import 'package:flutter/material.dart';
import 'package:syncfusion_flutter_calendar/calendar.dart';

class BookTutorScreen extends StatefulWidget {
  const BookTutorScreen({super.key});

  @override
  State<BookTutorScreen> createState() => _BookTutorScreenState();
}

class _BookTutorScreenState extends State<BookTutorScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          elevation: 0,
          backgroundColor: Colors.blueAccent,
          leading: IconButton(
            icon: const Icon(
              Icons.arrow_back,
              color: Colors.white,
            ),
            onPressed: () => Navigator.of(context).pop(),
          ),
          title: const Text(
            'Book lesson',
            style: TextStyle(fontWeight: FontWeight.bold, color: Colors.white),
          ),
        ),
          body: SfCalendar(
            cellBorderColor: Colors.black,
            view: CalendarView.day,
            showDatePickerButton: true,
            showCurrentTimeIndicator: false,
            // dataSource: prov.appointmentData,
            allowAppointmentResize: true,
            appointmentBuilder: (context, calendarAppointmentDetails) {
              var appointment = calendarAppointmentDetails.appointments.first;
              if (appointment.subject == 'Booked') {
                return const Center(
                  child: Text(
                    'Booked',
                    style: TextStyle(
                        fontWeight: FontWeight.bold, color: Colors.green),
                  ),
                );
              } else {
                return Center(
                  child: ElevatedButton(
                    onPressed: () {},
                    style: ElevatedButton.styleFrom(
                      primary: Colors.blue, // Background color for Submit
                    ),
                    child: Text('Submit'),
                  ),
                );
              }
              TimeSlotViewSettings:
              const TimeSlotViewSettings(
                startHour: 0,
                endHour: 23,
                timeIntervalHeight: 65,
                timeRulerSize: 120,
                timeTextStyle: TextStyle(
                  fontSize: 14,
                  fontWeight: FontWeight.bold,
                  color: Colors.black,
                ),
                timeInterval: Duration(
                  minutes: 25,
                ),
                timeFormat: "HH:mm",
              );
            }));
  }
}
