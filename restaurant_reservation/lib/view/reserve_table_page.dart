import 'package:flutter/material.dart';
import 'select_payment_method.dart';
import '../viewmodel/reserve_table_viewmodel.dart';

class ReserveTablePage extends StatelessWidget {
  final ReserveTableViewModel _viewModel = ReserveTableViewModel();

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
                    onPressed: () => _viewModel.selectDate(context),
                    style: ElevatedButton.styleFrom(
                      backgroundColor: Colors.blueGrey
                    ),
                    child: Text(_viewModel.selectedDate.value != null
                        ? '${_viewModel.selectedDate.value!.day}/${_viewModel.selectedDate.value!.month}/${_viewModel.selectedDate.value!.year}'
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
                    onPressed: () => _viewModel.selectTime(context),
                    child: Text(_viewModel.selectedTime.value != null
                        ? '${_viewModel.selectedTime.value!.hour}:${_viewModel.selectedTime.value!.minute}'
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
                          _viewModel.decrementGuests();
                        },
                        icon: const Icon(Icons.remove),
                      ),
                      Text('${_viewModel.numberOfGuests.value}'),
                      IconButton(
                        onPressed: () {
                          _viewModel.incrementGuests();
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
                      Checkbox(value: _viewModel.insideChecked.value, onChanged: (newBool1) {
                        _viewModel.insideChecked.value = newBool1!;
                      }),
                      const Text('Inside'),
                      Checkbox(value: _viewModel.eventZoneChecked.value, onChanged: (newBool2) {
                        _viewModel.eventZoneChecked.value = newBool2!;
                      }),
                      const Text('Event Zone'),
                      Checkbox(value: _viewModel.outsideChecked.value, onChanged: (newBool3) {
                        _viewModel.outsideChecked.value = newBool3!;
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
