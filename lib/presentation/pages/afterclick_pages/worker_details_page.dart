import 'package:capston/presentation/pages/home_page.dart';
import 'package:capston/presentation/utils/constant/colors.dart';
import 'package:capston/presentation/widgets/button_widget.dart';
import 'package:capston/presentation/widgets/text_widget.dart';
import 'package:cool_alert/cool_alert.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:url_launcher/url_launcher.dart';

class WorkerDetailsPage extends StatefulWidget {
  @override
  State<WorkerDetailsPage> createState() => _WorkerDetailsPageState();
}

class _WorkerDetailsPageState extends State<WorkerDetailsPage> {
  late String dateOfService;

  DateTime selectedDate = DateTime.now();

  TimeOfDay selectedTime = TimeOfDay.now();

  DateTime dateTime = DateTime.now();

  bool showDate = false;

  bool showTime = false;

  bool showDateTime = false;

  // Select for Date
  Future<DateTime> _selectDate() async {
    final selected = await showDatePicker(
      context: context,
      initialDate: selectedDate,
      firstDate: DateTime(2000),
      lastDate: DateTime(2025),
    );
    if (selected != null && selected != selectedDate) {
      setState(() {
        selectedDate = selected;
      });
      print(getDate());
    }
    return selectedDate;
  }

// Select for Time
  Future<TimeOfDay> _selectTime() async {
    final selected = await showTimePicker(
      context: context,
      initialTime: selectedTime,
    );
    if (selected != null && selected != selectedTime) {
      setState(() {
        selectedTime = selected;
      });

      print(getTime(selectedTime));
    }
    return selectedTime;
  }

  String getDate() {
    if (selectedDate == null) {
      return 'select date';
    } else {
      return DateFormat('MMM d, yyyy').format(selectedDate);
    }
  }

  String getTime(TimeOfDay tod) {
    final now = DateTime.now();

    final dt = DateTime(now.year, now.month, now.day, tod.hour, tod.minute);
    final format = DateFormat.jm();
    return format.format(dt);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: appBarColor,
        title: const TextBold(
            text: 'Skilled Worker', color: Colors.white, fontSize: 18),
        centerTitle: true,
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            const SizedBox(
              height: 20,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Column(
                  children: [
                    Image.asset(
                      'assets/images/profile.png',
                      height: 100,
                    ),
                    const SizedBox(
                      height: 10,
                    ),
                    const TextBold(
                        text: 'Hired: 12 times',
                        color: Colors.green,
                        fontSize: 14),
                  ],
                ),
                const SizedBox(
                  width: 20,
                ),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: const [
                    TextBold(
                        text: 'Lance Olana', color: Colors.black, fontSize: 24),
                    TextRegular(
                        text: '09090104355', color: Colors.black, fontSize: 14),
                    SizedBox(
                      height: 10,
                    ),
                    TextRegular(text: 'Rate', color: Colors.grey, fontSize: 10),
                    TextBold(
                        text: '350/day', color: Colors.green, fontSize: 16),
                  ],
                ),
              ],
            ),
            const SizedBox(
              height: 10,
            ),
            const Divider(
              color: Colors.grey,
              thickness: 0.5,
              endIndent: 25,
              indent: 25,
            ),
            const SizedBox(
              height: 10,
            ),
            const Text(
              'Technician',
              style: TextStyle(
                  fontFamily: 'QBold',
                  color: Colors.black,
                  fontSize: 24,
                  decoration: TextDecoration.underline),
            ),
            const SizedBox(
              height: 20,
            ),
            const TextRegular(
                text: 'Capabilities', color: Colors.grey, fontSize: 15),
            const SizedBox(
              height: 10,
            ),
            const Padding(
              padding: EdgeInsets.only(left: 20, right: 20),
              child: TextRegular(
                  text:
                      '> Job Description Job Description Job Description Job Description Job Description Job Description Job Description Job Description Job DescriptionJob Description Job Description Job Description Job Descriptionv Job Descriptionv  vJob Description Job Description Job Description Job Description Job Description Job DescriptionJob Description Job DescriptionJob DescriptionJob Description Job Description Job DescriptionJob DescriptionJob DescriptionJob Description Job Description Job Description  Job Description',
                  color: Colors.grey,
                  fontSize: 12),
            ),
            const SizedBox(
              height: 20,
            ),
            const TextRegular(
                text: 'BIR Certificate', color: Colors.grey, fontSize: 15),
            const SizedBox(
              height: 10,
            ),
            Padding(
              padding: const EdgeInsets.only(left: 20, right: 20),
              child: Container(
                color: Colors.grey,
                height: 350,
                width: 300,
              ),
            ),
            const SizedBox(
              height: 20,
            ),
            const TextRegular(
                text: 'Police Clearance', color: Colors.grey, fontSize: 15),
            const SizedBox(
              height: 10,
            ),
            Padding(
              padding: const EdgeInsets.only(left: 20, right: 20),
              child: Container(
                color: Colors.grey,
                height: 350,
                width: 300,
              ),
            ),
            const SizedBox(
              height: 50,
            ),
            MaterialButton(
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(5),
              ),
              color: appBarColor,
              onPressed: () async {
                String driverContactNumber = '09090104355';
                final _text = 'tel:$driverContactNumber';
                if (await canLaunch(_text)) {
                  await launch(_text);
                }
              },
              child: const Padding(
                padding: EdgeInsets.fromLTRB(50, 10, 50, 10),
                child: TextRegular(
                    text: 'Call Me', color: Colors.white, fontSize: 14),
              ),
            ),
            ButtonWidget(
              text: 'Hire Me',
              onPressed: () {
                CoolAlert.show(
                  barrierDismissible: false,
                  context: context,
                  backgroundColor: appBarColor,
                  type: CoolAlertType.success,
                  confirmBtnColor: appBarColor,
                  confirmBtnTextStyle: const TextStyle(
                    fontFamily: 'QRegular',
                    color: Colors.white,
                  ),
                  title: '',
                  onConfirmBtnTap: () {
                    Navigator.of(context).pushReplacement(
                        MaterialPageRoute(builder: (context) => HomePage()));
                  },
                  text: "Service Booked Successfully!",
                );
                _selectTime();
                _selectDate();
              },
            ),
            const SizedBox(
              height: 20,
            ),
          ],
        ),
      ),
    );
  }
}
