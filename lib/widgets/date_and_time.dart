import 'package:first_course_project/constants.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class DateAndTime extends StatefulWidget {
  const DateAndTime({Key? key}) : super(key: key);

  @override
  _DateAndTimeState createState() => _DateAndTimeState();
}

class _DateAndTimeState extends State<DateAndTime> {
  late DateTime pickedDate;
  late TimeOfDay time;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    pickedDate = DateTime.now();
    time = TimeOfDay.now();
  }

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const Text(
            '   Choose the Date',
            style: TextStyle(
                fontSize: 17, color: kBlue, fontWeight: FontWeight.bold),
          ),
          ListTile(
            title: Text(
                '${pickedDate.year} , ${pickedDate.month} , ${pickedDate.day}'),
            trailing: const Icon(Icons.keyboard_arrow_down),
            onTap: _pickDate,
          ),
          const Text(
            '   Choose the Time',
            style: TextStyle(
                fontSize: 17, color: kBlue, fontWeight: FontWeight.bold),
          ),
          ListTile(
            title: Text('${time.hour} : ${time.minute}'),
            trailing: const Icon(Icons.keyboard_arrow_down),
            onTap: _pickTime,
          ),
        ],
      ),
    );
  }

  _pickDate() async {
    DateTime? date = await showDatePicker(
      context: context,
      initialDate: pickedDate,
      firstDate: DateTime(DateTime.now().year - 5),
      lastDate: DateTime(DateTime.now().year + 5),
    );
    if (date != null) {
      setState(() {
        pickedDate = date;
      });
    }
  }

  _pickTime() async {
    TimeOfDay? sTime =
        await showTimePicker(context: context, initialTime: time);
    if (sTime != null) {
      setState(() {
        time = sTime;
        Provider.of<TimeProvider>(context , listen: false).timeFunction(sTime);
      });
    }
  }
}

class TimeProvider extends ChangeNotifier {
  TimeOfDay time = TimeOfDay.now();

  timeFunction(TimeOfDay time) {
    this.time = time;
  }
}
