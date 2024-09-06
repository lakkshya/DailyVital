import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

class Details extends StatefulWidget {
  const Details({super.key});

  @override
  State<Details> createState() => _DetailsState();
}

class _DetailsState extends State<Details> {
  final _formKey = GlobalKey<FormState>();

  String name = '';
  String gender = 'Select';
  String mobileNumber = '';
  String dateOfBirth = '';
  String address = '';

  final List<String> genderOptions = ['Select', 'Male', 'Female', 'Other'];
  TextEditingController dateController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: SingleChildScrollView(
        padding: const EdgeInsets.fromLTRB(30.0, 100.0, 30.0, 0.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Text(
              'Complete your Profile',
              style: TextStyle(
                fontSize: 24.0,
                fontWeight: FontWeight.bold,
                color: Color.fromARGB(255, 0, 87, 228),
              ),
            ),
            const SizedBox(
              height: 10.0,
            ),
            Text(
              'Welcome to DailyVital! Let\'s get you set up with your personal details.',
              style: TextStyle(
                fontSize: 16.0,
                color: Colors.grey[700],
              ),
            ),
            const SizedBox(
              height: 40.0,
            ),
            Form(
              key: _formKey,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: [
                  const Text(
                    'What is your name?',
                    style: TextStyle(
                      fontSize: 18.0,
                    ),
                  ),
                  const SizedBox(
                    height: 10.0,
                  ),
                  TextFormField(
                    decoration: const InputDecoration(
                      labelText: 'Name',
                      border: OutlineInputBorder(),
                      prefixIcon: Icon(Icons.person),
                    ),
                    keyboardType: TextInputType.text,
                    validator: (val) =>
                        val!.isEmpty ? 'Please enter your name' : null,
                    onChanged: (val) {
                      setState(() => name = val);
                    },
                  ),
                  const SizedBox(
                    height: 20.0,
                  ),
                  const Text(
                    'Choose your gender',
                    style: TextStyle(
                      fontSize: 18.0,
                    ),
                  ),
                  const SizedBox(
                    height: 10.0,
                  ),
                  DropdownButtonFormField<String>(
                    value: gender,
                    decoration: const InputDecoration(
                        labelText: 'Gender',
                        border: OutlineInputBorder(),
                        prefixIcon: Icon(Icons.person_search)),
                    onChanged: (val) {
                      setState(() => gender = val!);
                    },
                    validator: (val) =>
                        val == 'Select' ? 'Please select your gender' : null,
                    items: genderOptions
                        .map((gender) => DropdownMenuItem(
                              value: gender,
                              child: Text(gender),
                            ))
                        .toList(),
                  ),
                  const SizedBox(
                    height: 20.0,
                  ),
                  const Text(
                    'When were you born?',
                    style: TextStyle(
                      fontSize: 18.0,
                    ),
                  ),
                  const SizedBox(
                    height: 10.0,
                  ),
                  TextFormField(
                    controller: dateController,
                    decoration: const InputDecoration(
                      labelText: 'Date of Birth',
                      border: OutlineInputBorder(),
                      prefixIcon: Icon(Icons.calendar_today),
                    ),
                    readOnly: true,
                    onTap: () async {
                      DateTime? pickedDate = await showDatePicker(
                        context: context,
                        initialDate: DateTime(2000),
                        firstDate: DateTime(1900),
                        lastDate: DateTime.now(),
                        builder: (context, child) {
                          return Theme(
                            data: Theme.of(context).copyWith(
                              colorScheme: const ColorScheme.light(
                                primary: Colors
                                    .blueAccent,
                                onPrimary: Colors.white, 
                                onSurface: Colors
                                    .blueAccent, 
                              ),
                              textButtonTheme: TextButtonThemeData(
                                style: TextButton.styleFrom(
                                  foregroundColor: Colors.blueAccent,
                                ),
                              ),
                            ),
                            child: child!,
                          );
                        },
                      );

                      if (pickedDate != null) {
                        setState(() {
                          dateOfBirth =
                              DateFormat('dd/MM/yyyy').format(pickedDate);
                          dateController.text = dateOfBirth;
                        });
                      }
                    },
                    validator: (val) => val!.isEmpty
                        ? 'Please select your date of birth'
                        : null,
                  ),
                  const SizedBox(
                    height: 20.0,
                  ),
                  const Text(
                    'Enter your mobile number',
                    style: TextStyle(
                      fontSize: 18.0,
                    ),
                  ),
                  const SizedBox(
                    height: 10.0,
                  ),
                  TextFormField(
                    decoration: const InputDecoration(
                        labelText: 'Mobile Number',
                        border: OutlineInputBorder(),
                        prefixIcon: Icon(Icons.call)),
                    keyboardType: TextInputType.phone,
                    validator: (val) => val!.length != 10
                        ? 'Enter a valid 10-digit mobile number'
                        : null,
                    onChanged: (val) {
                      setState(() => mobileNumber = val);
                    },
                  ),
                  const SizedBox(
                    height: 50.0,
                  ),
                  ElevatedButton(
                    onPressed: () {
                      if (_formKey.currentState!.validate()) {
                        Navigator.pushReplacementNamed(context, '/home');
                      }
                    },
                    child: const Text(
                      'Continue',
                      style: TextStyle(
                        fontSize: 16.0,
                        color: Colors.white,
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
