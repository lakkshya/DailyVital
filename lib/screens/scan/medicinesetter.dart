import 'package:flutter/material.dart';
import 'package:daily_vital/models/medicine.dart';

class MedicineSetter extends StatefulWidget {
  final List<Medicine> medicines;

  const MedicineSetter({super.key, required this.medicines});

  @override
  _MedicineSetterState createState() => _MedicineSetterState();
}

class _MedicineSetterState extends State<MedicineSetter> {
  late List<Medicine> _medicines;

  @override
  void initState() {
    super.initState();
    _medicines = widget.medicines;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Medicine Details'),
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(30.0),
        child: Column(
          children: [
            ..._medicines.map((medicine) {
              int index = _medicines.indexOf(medicine);
              return Card(
                margin: const EdgeInsets.symmetric(vertical: 8.0),
                color: Color(0xfff0ead2),
                child: Padding(
                  padding: const EdgeInsets.all(16.0),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      TextField(
                        controller: TextEditingController(text: medicine.name),
                        decoration: const InputDecoration(
                          labelText: 'Medicine Name',
                        ),
                        onChanged: (value) => _medicines[index].name = value,
                      ),
                      const SizedBox(height: 8.0),
                      TextField(
                        controller: TextEditingController(text: medicine.doses),
                        decoration: const InputDecoration(
                          labelText: 'Doses',
                        ),
                        onChanged: (value) => _medicines[index].doses = value,
                      ),
                      const SizedBox(height: 8.0),
                      TextField(
                        controller: TextEditingController(text: medicine.time),
                        decoration: const InputDecoration(
                          labelText: 'Time',
                        ),
                        onChanged: (value) => _medicines[index].time = value,
                      ),
                    ],
                  ),
                ),
              );
            }).toList(),
            const SizedBox(height: 16.0),
            SizedBox(
              width: double.infinity,
              child: ElevatedButton(
                onPressed: _setAlarms,
                style: ElevatedButton.styleFrom(
                  padding: const EdgeInsets.symmetric(vertical: 12.0),
                ),
                child: const Text('Set Alarms'),
              ),
            ),
          ],
        ),
      ),
    );
  }

  void _setAlarms() {
    for (var medicine in _medicines) {
      // Implement the alarm-setting logic for each medicine
      print('Setting alarm for ${medicine.name} at ${medicine.time}');
    }
    ScaffoldMessenger.of(context).showSnackBar(
      const SnackBar(content: Text('Alarms set successfully!')),
    );
  }
}
