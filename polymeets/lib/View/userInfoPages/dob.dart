import 'package:flutter/material.dart';
import 'package:polymeets/View/userInfoPages/gender.dart';

class DateOfBirth extends StatefulWidget {
  @override
  _DateOfBirthState createState() => _DateOfBirthState();
}

class _DateOfBirthState extends State<DateOfBirth> {
  DateTime selectedDate = DateTime.utc(2003);
  late int dayPicked;
  late int monthPicked;
  late int yearPicked;
  late int age;

  bool legalAge = false;

  int? legalYear() {
    int eighteen = DateTime.now().year.toInt() - selectedDate.year.toInt();
    if (eighteen == 18) {
      eighteen = DateTime.now().year.toInt() - 18;
      return eighteen;
    } else {
      print(eighteen);
      return null;
    }
  }

  _selectDate(BuildContext context) async {
    final DateTime? picked = await showDatePicker(
        context: context,
        initialDate: selectedDate,
        firstDate: DateTime(DateTime.now().year - 50),
        lastDate: DateTime(DateTime.now().year - 17));
    if (picked != null && picked != selectedDate) {
      setState(() {
        selectedDate = picked;
        dayPicked = picked.day;
        monthPicked = picked.month;
        yearPicked = picked.year;
        age = DateTime.now().year - picked.year;

        if (dayPicked < DateTime.now().day &&
            monthPicked > DateTime.now().month) {
          age = age - 1;
        } else if (monthPicked == DateTime.now().month &&
            dayPicked > DateTime.now().day) {
          age = age - 1;
        } else if (monthPicked > DateTime.now().month) {
          age = age - 1;
        }

        print('$dayPicked/$monthPicked/$yearPicked your age is $age');
      });
    }
  }

  String messageAge() {
    if (dayPicked == DateTime.now().day &&
        monthPicked == DateTime.now().month) {
      legalAge = true;
      return "Manuia lou aso fanau! You just turned $age.";
    } else if (age == null) {
      return "";
    } else if (age < 18) {
      legalAge = false;
      return "Sorry you are only $age and a moepi";
    } else {
      legalAge = true;
      return "You are $age years of age";
    }
  }

  Widget nextButton() {
    if (age == null) {
      return SizedBox();
    } else if (age == 18 || age > 18) {
      return ElevatedButton(
        onPressed: () {
          Navigator.push(
              context, MaterialPageRoute(builder: (context) => Gender()));
        },
        child: Text("Next"),
        style: ElevatedButton.styleFrom(
            primary: Colors.white, onPrimary: Colors.redAccent),
      );
    } else {
      return SizedBox();
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Container(
          alignment: Alignment.centerLeft,
          padding: EdgeInsets.fromLTRB(50, 100, 50, 0),
          color: Colors.redAccent,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                'Date of Birth',
                style: TextStyle(
                    color: Colors.white,
                    fontSize: 30,
                    fontWeight: FontWeight.bold),
              ),
              Text(
                messageAge(),
                style: TextStyle(
                    fontSize: 20,
                    fontWeight: FontWeight.bold,
                    color: Colors.white),
              ),
              SizedBox(
                height: 20.0,
              ),
              ElevatedButton(
                onPressed: () => _selectDate(context),
                child: Text("Select Date"),
                style: ElevatedButton.styleFrom(
                    primary: Colors.white, onPrimary: Colors.redAccent),
              ),
              SizedBox(
                height: 20.0,
              ),
              nextButton(),
            ],
          ),
        ),
      ),
    );
  }
}
