import 'package:eservice_app/helper/UI/card_with_header.dart';
import 'package:flutter/material.dart';
import 'package:flutter/painting.dart';
import 'package:intl/intl.dart';
import 'package:hijri_picker/hijri_picker.dart';
import 'package:hijri/hijri_calendar.dart';



class HistorySearchCard extends StatefulWidget {
  const HistorySearchCard({Key? key}) : super(key: key);

  @override
  _HistorySearchCardState createState() => _HistorySearchCardState();
}

class _HistorySearchCardState extends State<HistorySearchCard> {
  final TextEditingController _fromDateController = TextEditingController();
  final TextEditingController _toDateController = TextEditingController();
  final GlobalKey _formKey = GlobalKey<FormState>();
  AutovalidateMode mode = AutovalidateMode.disabled;
  var selectedDate = new HijriCalendar.now();

  @override
  Widget build(BuildContext context) {
    HijriCalendar.setLocal(Localizations.localeOf(context).languageCode);

    return CardWithHeader(
      height: MediaQuery.of(context).size.height/2.4,
      title: 'بحث حركات المحفظه',
      child: _buildCardWidget(),
    );
  }

  Widget _buildCardWidget() {
    return SingleChildScrollView(
      child: SafeArea(
        child: Form(
            key: _formKey,
            autovalidateMode: mode,
            child: Padding(
              padding: const EdgeInsets.symmetric(
                horizontal: 5,
                vertical: 10,
              ),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  TextFormField(
                    validator: (val) {
                      if (val!.isEmpty || val.trim().length == 0) {
                        return 'Please Enter the date';
                      }
                      return null;
                    },
                    keyboardType: TextInputType.datetime,
                    controller: _fromDateController,
                    key: Key("fromDate"),
                    decoration: InputDecoration(
                        filled: true,
                        suffixIcon: GestureDetector(
                          onTap: () {
                            _selectFromDate(context);
                          },
                          child: Container(
                            decoration: BoxDecoration(
                              color: Colors.blue,
                              borderRadius: BorderRadius.circular(5),
                            ),
                            child: Padding(
                              padding: EdgeInsets.only(top: 10),
                              child: Text(
                                'هـ',
                                style: TextStyle(color: Colors.white),
                                textAlign: TextAlign.center,
                              ),
                            ),
                          ),
                        ),
                        fillColor: Colors.white,
                        contentPadding: const EdgeInsets.symmetric(
                            vertical: 10.0, horizontal: 15),
                        counterStyle: TextStyle(
                          height: double.minPositive,
                        ),
                        enabledBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(5),
                          borderSide: BorderSide(
                            color: Color.fromRGBO(226, 222, 223, 1),
                          ),
                        ),
                        label: Text('تاريخ من')),
                  ),
                  SizedBox(
                    height: 15,
                  ),
                  TextFormField(
                    validator: (val) {
                      if (val!.isEmpty || val.trim().length == 0) {
                        return 'Please Enter the date';
                      }
                      return null;
                    },
                    keyboardType: TextInputType.datetime,
                    controller: _toDateController,
                    key: Key("toDate"),
                    decoration: InputDecoration(
                        filled: true,
                        suffixIcon: GestureDetector(
                          onTap: () {

                            _selectToDate(context);
                          },
                          child: Container(
                            decoration: BoxDecoration(
                              color: Colors.blue,
                              borderRadius: BorderRadius.circular(5),
                            ),
                            child: Padding(
                              padding: EdgeInsets.only(top: 10),
                              child: Text(
                                'هـ',
                                style: TextStyle(color: Colors.white),
                                textAlign: TextAlign.center,
                              ),
                            ),
                          ),
                        ),
                        fillColor: Colors.white,
                        contentPadding: const EdgeInsets.symmetric(
                            vertical: 10.0, horizontal: 15),
                        counterStyle: TextStyle(
                          height: double.minPositive,
                        ),
                        enabledBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(5),
                          borderSide: BorderSide(
                            color: Color.fromRGBO(226, 222, 223, 1),
                          ),
                        ),
                        label: Text('تاريخ إلى')),
                  ),
                  SizedBox(
                    height: 15,
                  ),
                  SizedBox(
                    width: double.infinity,
                    child: ElevatedButton(
                      onPressed: () {
                        FocusScope.of(context).unfocus();
                        mode = AutovalidateMode.always;
                        final form = _formKey.currentState as FormState;
                        if (form.validate()) {
                          print('ok');
                        }
                      },
                      child: Text('بحث'),
                    ),
                  ),
                ],
              ),
            )),
      ),
    );
  }

  Future<Null> _selectFromDate(BuildContext context) async {
    final HijriCalendar? picked = await showHijriDatePicker(
      context: context,
      initialDate: selectedDate,
      lastDate:new HijriCalendar.now(),
      firstDate: new HijriCalendar()
        ..hYear = 1442
        ..hMonth = 12
        ..hDay = 25,
      initialDatePickerMode: DatePickerMode.day,
    );
    if (picked != null)
      setState(() {
        selectedDate = picked;
        _fromDateController.text = selectedDate.toString();


      });
  }

  Future<Null> _selectToDate(BuildContext context) async {
    final HijriCalendar? picked = await showHijriDatePicker(
      context: context,
      initialDate: selectedDate,
      lastDate:new HijriCalendar.now(),
      firstDate: selectedDate,
      initialDatePickerMode: DatePickerMode.day,
    );
    if (picked != null)
      setState(() {
        selectedDate = picked;
        _toDateController.text = selectedDate.toString();


      });
  }
}
