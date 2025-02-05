import 'package:file_picker/file_picker.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

class Donation extends StatefulWidget {
  const Donation({super.key});

  @override
  State<Donation> createState() => _DonationState();
}

class _DonationState extends State<Donation> {
  final TextEditingController _dateController = TextEditingController();
  final TextEditingController nameController = TextEditingController();
  final TextEditingController hospitalController = TextEditingController();

  String? pdfFileName;

   final List<String> hospital = [
    'hospital 1',
    'hospital 2',
    'hospital 3',
    'hospital 4',
    'hospital 5',
    'hospital 6',
    
  ];
  String? selectedHospital;

  

  @override
  void dispose() {
    _dateController.dispose();
    nameController.dispose();
    hospitalController.dispose();
    super.dispose();
  }

  Future<void> _pickPDF() async {
    FilePickerResult? result = await FilePicker.platform.pickFiles(
      type: FileType.custom,
      allowedExtensions: ['pdf'],
    );

    if (result != null) {
      setState(() {
        pdfFileName = result.files.single.name;
      });
    } else {
      setState(() {
        pdfFileName = null;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    final formKey = GlobalKey<FormState>();
    return Scaffold(
      backgroundColor: Colors.grey[400],
      appBar: AppBar(
        leading: IconButton(
              onPressed: () {
                Navigator.of(context).pop();
              },
              icon: const Icon(Icons.arrow_back),
            ),
        backgroundColor: Colors.white,
        title: const Row(
          children: [
            
            Icon(Icons.bloodtype, color: Colors.red),
            SizedBox(width: 8),
            Text(
              'Blood Data',
              style: TextStyle(color: Colors.black, fontWeight: FontWeight.bold),
            ),
          ],
        ),
        centerTitle: true,
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(16.0),
        child: Form(
          key: formKey,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              const Text(
                'Donation Details',
                style: TextStyle(
                  color: Colors.black,
                  fontWeight: FontWeight.bold,
                  fontSize: 25,
                ),
              ),
              const SizedBox(height: 20),

              // Patient Name
              const Align(
                alignment: Alignment.centerLeft,
                child: Text(
                  'Patient Name',
                  style: TextStyle(fontWeight: FontWeight.w500),
                ),
              ),
              const SizedBox(height: 8),
              TextFormField(
                controller: nameController,
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'This field cannot be empty';
                  }
                  return null;
                },
                decoration: InputDecoration(
                  fillColor: Colors.white,
                  filled: true,
                  hintText: 'Enter name',
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(10.0),
                  ),
                ),
              ),
              const SizedBox(height: 20),

            const  SizedBox(height: 20,),
              const Align(alignment: Alignment.centerLeft,
                child: Text('Hospital name')),
              SizedBox(
                    child: DropdownButtonFormField<String>(
                      decoration: InputDecoration(
                        fillColor: Colors.white,
                        filled: true,
                        hintText: 'Select a hospital',
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(10),
                        ),
                      ),
                      value: selectedHospital,
                      items: hospital.map((district) => DropdownMenuItem(
                                value: district,
                                child: Text(district),
                              ))
                          .toList(),
                      onChanged: (value) {
                        setState(() {
                          selectedHospital = value;
                        });
                      },
                      validator: (value) {
                        if (value == null || value.isEmpty) {
                          return 'Please select a hospital';
                        }
                        return null;
                      },
                    ),
                  ),
              const SizedBox(height: 20),

              // Date Picker
              const Align(
                alignment: Alignment.centerLeft,
                child: Text(
                  'Date',
                  style: TextStyle(fontWeight: FontWeight.w500),
                ),
              ),
              const SizedBox(height: 8),
              TextFormField(
                controller: _dateController,
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'Please select a date';
                  }
                  return null;
                },
                decoration: InputDecoration(
                  fillColor: Colors.white,
                  filled: true,
                  suffixIcon: const Icon(Icons.calendar_today_rounded),
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(10.0),
                  ),
                  labelText: 'Date',
                ),
                onTap: () async {
                  FocusScope.of(context).requestFocus(FocusNode());
                  DateTime? pickedDate = await showDatePicker(
                    context: context,
                    firstDate: DateTime(2000),
                    lastDate: DateTime.now(),
                    initialDate: DateTime.now(),
                  );
                  if (pickedDate != null) {
                    setState(() {
                      _dateController.text =
                          DateFormat('yyyy-MM-dd').format(pickedDate);
                    });
                  }
                },
              ),
              const SizedBox(height: 20),

              // PDF File Picker
              const Align(
                alignment: Alignment.centerLeft,
                child: Text(
                  'Upload PDF File',
                  style: TextStyle(fontWeight: FontWeight.w500),
                ),
              ),
              const SizedBox(height: 8),
              Container(
                padding: const EdgeInsets.all(8.0),
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(10.0),
                  border: Border.all(color: Colors.grey),
                ),
                child: Row(
                  children: [
                    ElevatedButton(
                      style: ElevatedButton.styleFrom(
                        backgroundColor: Colors.red,
                      ),
                      onPressed: _pickPDF,
                      child: const Text(
                        'Select PDF',
                        style: TextStyle(color: Colors.black),
                      ),
                    ),
                    const SizedBox(width: 10),
                    Expanded(
                      child: Text(
                        pdfFileName ?? 'No file selected',
                        style: TextStyle(
                          fontSize: 14,
                          color: pdfFileName != null ? Colors.black : Colors.grey,
                        ),
                        overflow: TextOverflow.ellipsis,
                      ),
                    ),
                  ],
                ),
              ),
              const SizedBox(height: 25),

              // Save Button
              Center(
                child: ElevatedButton(
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Colors.red,
                  ),
                  onPressed: () {
                    if (formKey.currentState!.validate()) {
                      ScaffoldMessenger.of(context).showSnackBar(
                        const SnackBar(
                          behavior: SnackBarBehavior.floating,
                          margin: EdgeInsets.all(10),
                          content: Text('Saved successfully'),
                        ),
                      );
                    }
                  },
                  child: const Text(
                    'Save',
                    style: TextStyle(color: Colors.black),
                  ),
                ),
              ),
              const SizedBox(height: 20),

              // Generate Certificate Button
              Center(
                child: ElevatedButton(
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Colors.red,
                  ),
                  onPressed: () {
                    ScaffoldMessenger.of(context).showSnackBar(
                      const SnackBar(
                        behavior: SnackBarBehavior.floating,
                        margin: EdgeInsets.all(10),
                        content: Text('Certificate generating'),
                      ),
                    );
                  },
                  child: const Text(
                    'Generate Certificate',
                    style: TextStyle(color: Colors.black),
                  ),
                ),
              ),
            
            ],
          ),
        ),
      ),
    );
  }
}
