import 'package:flutter/material.dart';
import'select_payment_method.dart';

class ReserveTablePage extends StatefulWidget {
  @override
  _ReserveTablePageState createState() => _ReserveTablePageState();
}

class _ReserveTablePageState extends State<ReserveTablePage> {
  DateTime? _selectedDate;
  TimeOfDay? _selectedTime;
  int _numberOfGuests = 1;
  bool _insideisChecked=false;
  bool _eventzoneisChecked=false;
  bool _outsideisChecked=false;
  Future<void> _selectDate(BuildContext context) async {
    final DateTime? pickedDate = await showDatePicker(
      context: context,
      initialDate: DateTime.now(),
      firstDate: DateTime.now(),
      lastDate: DateTime(2101),
    );
    if (pickedDate != null && pickedDate != _selectedDate) {
      setState(() {
        _selectedDate = pickedDate;
      });
    }
  }

  Future<void> _selectTime(BuildContext context) async {
    final TimeOfDay? pickedTime = await showTimePicker(
      context: context,
      initialTime: TimeOfDay.now(),
    );
    if (pickedTime != null && pickedTime != _selectedTime) {
      setState(() {
        _selectedTime = pickedTime;
      });
    }
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.blueGrey,
        title: const Text('Reserve Your Table'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  const Text(
                    'Date:',
                    style: TextStyle(fontSize: 18,),
                  ),
                  ElevatedButton(
                    onPressed: () => _selectDate(context),
                    style: ElevatedButton.styleFrom(
                      backgroundColor: Colors.blueGrey
                    ),
                    child: Text(_selectedDate != null
                        ? '${_selectedDate!.day}/${_selectedDate!.month}/${_selectedDate!.year}'
                        : 'Select Date',style: TextStyle(color: Colors.black,fontWeight: FontWeight.bold),),
                  ),
                ],
              ),
              const SizedBox(height: 16),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  const Text(
                    'Time:',
                    style: TextStyle(fontSize: 18),
                  ),
                  ElevatedButton(
                    style: ElevatedButton.styleFrom(backgroundColor: Colors.blueGrey),
                    onPressed: () => _selectTime(context),
                    child: Text(_selectedTime != null
                        ? '${_selectedTime!.hour}:${_selectedTime!.minute}'
                        : 'Select Time',style: TextStyle(color: Colors.black,fontWeight: FontWeight.bold)),
                  ),
                ],
              ),
              const SizedBox(height: 16),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  const Text(
                    'Number of Guests:',
                    style: TextStyle(fontSize: 18),
                  ),
                  Row(
                    children: [
                      IconButton(
                        onPressed: () {
                          if (_numberOfGuests > 1) {
                            setState(() {
                              _numberOfGuests--;
                            });
                          }
                        },
                        icon: const Icon(Icons.remove),
                      ),
                      Text('$_numberOfGuests'),
                      IconButton(
                        onPressed: () {
                          setState(() {
                            _numberOfGuests++;
                          });
                        },
                        icon: const Icon(Icons.add),
                      ),
                    ],
                  ),
                ],
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  const Text('(Optional)', style: TextStyle(fontSize: 16)),
                  Row(
                    children: [
                      Checkbox(value: _insideisChecked, onChanged: (newBool1) {setState(() {
                        _insideisChecked=newBool1!;
                      });}),
                      const Text('Inside'),
                      Checkbox(value: _eventzoneisChecked, onChanged: (newBool2) {
                        setState(() {
                          _eventzoneisChecked=newBool2!;
                        });
                      }),
                      const Text('Event Zone'),
                      Checkbox(value: _outsideisChecked, onChanged: (newBool3) {
                        setState(() {
                          _outsideisChecked=newBool3!;
                        });
                      }),
                      const Text('Outside'),
                    ],
                  ),
                ],
              ),
              const SizedBox(height: 66),
              const Text(
                'Special Requests:',
                style: TextStyle(fontSize: 18),
              ),
              const Text('(Optional)',style: TextStyle(fontSize: 16)),
              TextFormField(
                maxLines: 3,
              ),
              const SizedBox(height: 70),
              ElevatedButton(
                onPressed: () {
                  Navigator.push(context, MaterialPageRoute(builder: (context) => SelectPaymentMethod()));              },
                style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.blueGrey,
                ),
                child: const Align(
                  alignment: Alignment.center,
                child: Text('Reserve Table',style: TextStyle(color: Colors.black,fontWeight: FontWeight.bold,fontSize: 16),),
                ),
                ),
            ],
          ),
        ),
      ),
    );
  }
}
