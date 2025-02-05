import 'package:file_picker/file_picker.dart';
import 'package:flutter/material.dart';

class Hospital extends StatefulWidget {
  const Hospital({super.key});

  @override
  State<Hospital> createState() => _HospitalState();
}

class _HospitalState extends State<Hospital> {
  final List<String> districts = [
    'Thiruvananthapuram',
    'Kollam',
    'Pathanamthitta',
    'Alappuzha',
    'Kottayam',
    'Idukki',
    'Ernakulam',
    'Thrissur',
    'Palakkad',
    'Malappuram',
    'Kozhikode',
    'Wayanad',
    'Kannur',
    'Kasaragod',
  ];

  String? selectedDistrict;
  final _formKey = GlobalKey<FormState>();

  String? pdfFileName;

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
      // User canceled the picker
      setState(() {
        pdfFileName = null;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
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
            Icon(
              Icons.bloodtype,
              color: Colors.red,
            ),
            SizedBox(width: 8),
            Text(
              'Blood Data',
              style: TextStyle(
                color: Colors.black,
                fontWeight: FontWeight.bold,
              ),
            ),
          ],
        ),
        centerTitle: true,
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Form(
          key: _formKey,
          child: SingleChildScrollView(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const Text(
                  'Hospital Details',
                  style: TextStyle(
                    color: Colors.black,
                    fontWeight: FontWeight.bold,
                    fontSize: 18,
                  ),
                ),
                const SizedBox(height: 20),

                // Hospital Name
                const Text(
                  'Hospital Name',
                  style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
                ),
                const SizedBox(height: 10),
                TextFormField(
                  decoration: InputDecoration(
                    fillColor: Colors.white,
                    filled: true,
                    hintText: 'Enter hospital name',
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(10),
                    ),
                  ),
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return 'Please enter hospital name';
                    }
                    return null;
                  },
                ),
                const SizedBox(height: 20),

                // District
                const Text(
                  'District',
                  style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
                ),
                const SizedBox(height: 10),
                DropdownButtonFormField<String>(
                  decoration: InputDecoration(
                    fillColor: Colors.white,
                    filled: true,
                    hintText: 'Select a district',
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(10),
                    ),
                  ),
                  value: selectedDistrict,
                  items: districts.map((district) => DropdownMenuItem(
                            value: district,
                            child: Text(district),
                          ))
                      .toList(),
                  onChanged: (value) {
                    setState(() {
                      selectedDistrict = value;
                    });
                  },
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return 'Please select a district';
                    }
                    return null;
                  },
                ),
                const SizedBox(height: 20),

                // Description
                const Text(
                  'Description',
                  style: TextStyle(
                    color: Colors.black,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                const SizedBox(height: 10),
                TextFormField(
                  decoration: InputDecoration(
                    fillColor: Colors.white,
                    filled: true,
                    contentPadding:
                        const EdgeInsets.symmetric(vertical: 50, horizontal: 10),
                    hintText: 'Add description',
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(10),
                    ),
                  ),
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return 'Please add a description';
                    }
                    return null;
                  },
                  maxLines: null,
                ),
                const SizedBox(height: 20),

                // Upload Logo
                const Text(
                  'Upload Logo',
                  style: TextStyle(
                    color: Colors.black,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                const SizedBox(height: 10),
                Container(
                  color: Colors.white,
                  width: double.infinity,
                  height: 80,
                  child: Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Row(
                      children: [
                        ElevatedButton(
                          style: ElevatedButton.styleFrom(
                            backgroundColor: Colors.red,
                          ),
                          onPressed: _pickPDF,
                          child: const Text(
                            'Select logo',
                            style: TextStyle(
                              color: Colors.black,
                            ),
                          ),
                        ),
                        const SizedBox(width: 10),
                        Expanded(
                          child: Text(
                            pdfFileName ?? 'No logo selected',
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
                ),
                const SizedBox(height: 20),

                // Submit Button
                Center(
                  child: ElevatedButton(
                    onPressed: () {
                      if (_formKey.currentState!.validate()) {
                        // Add submission logic here
                      }
                    },
                    style: ElevatedButton.styleFrom(
                      padding: const EdgeInsets.symmetric(
                          vertical: 14, horizontal: 24),
                      backgroundColor: Colors.red,
                    ),
                    child: const Text(
                      'Submit',
                      style: TextStyle(
                        color: Colors.black,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
