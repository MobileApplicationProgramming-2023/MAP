import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:restaurant_reservation/view/local_restaurants_page.dart'; // Assuming LocalRestaurant is the correct class
import 'package:restaurant_reservation/viewmodel/reserve_table_viewmodel.dart';
import 'select_payment_method.dart';

class ReserveTablePage extends StatelessWidget {


  @override
  Widget build(BuildContext context) {
    final ReserveTableViewModel viewModel =
        Provider.of<ReserveTableViewModel>(context, listen: false);

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
                    style: TextStyle(
                      fontSize: 18,
                    ),
                  ),
                  ElevatedButton(
                    onPressed: () => viewModel.selectDate(context),
                    style: ElevatedButton.styleFrom(
                        backgroundColor: Colors.blueGrey),
                    child: Text(
                      viewModel.selectedDate.value != null
                          ? '${viewModel.selectedDate.value!.day}/${viewModel.selectedDate.value!.month}/${viewModel.selectedDate.value!.year}'
                          : 'Select Date',
                      style: TextStyle(
                          color: Colors.black,
                          fontWeight: FontWeight.bold),
                    ),
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
                    style: ElevatedButton.styleFrom(
                        backgroundColor: Colors.blueGrey),
                    onPressed: () => viewModel.selectTime(context),
                    child: Text(
                        viewModel.selectedTime.value != null
                            ? '${viewModel.selectedTime.value!.hour}:${viewModel.selectedTime.value!.minute}'
                            : 'Select Time',
                        style: TextStyle(
                            color: Colors.black,
                            fontWeight: FontWeight.bold)),
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
                          viewModel.decrementGuests();
                        },
                        icon: const Icon(Icons.remove),
                      ),
                      Text('${viewModel.numberOfGuests.value}'),
                      IconButton(
                        onPressed: () {
                          viewModel.incrementGuests();
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
                      Checkbox(
                          value: viewModel.insideChecked.value,
                          onChanged: (newBool1) {
                            viewModel.insideChecked.value = newBool1!;
                          }),
                      const Text('Inside'),
                      Checkbox(
                          value: viewModel.eventZoneChecked.value,
                          onChanged: (newBool2) {
                            viewModel.eventZoneChecked.value = newBool2!;
                          }),
                      const Text('Event Zone'),
                      Checkbox(
                          value: viewModel.outsideChecked.value,
                          onChanged: (newBool3) {
                            viewModel.outsideChecked.value = newBool3!;
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
              const Text('(Optional)',
                  style: TextStyle(fontSize: 16)),
              TextFormField(
                maxLines: 3,
                onChanged: (value) {
                  viewModel.specialRequest.value = value;
                },
              ),
              const SizedBox(height: 70),
              ElevatedButton(
                onPressed: () {
                  viewModel.reserveTable();
                  Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) => SelectPaymentMethod()));
                },
                style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.blueGrey,
                ),
                child: const Align(
                  alignment: Alignment.center,
                  child: Text('Reserve Table',
                      style: TextStyle(
                          color: Colors.black,
                          fontWeight: FontWeight.bold,
                          fontSize: 16)),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
