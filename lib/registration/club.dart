import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:image_picker/image_picker.dart';

class ClubRegister extends StatefulWidget {
  const ClubRegister({super.key});

  @override
  State<ClubRegister> createState() => _ClubRegisterState();
}

class _ClubRegisterState extends State<ClubRegister> {

 String? selectedDistrict;
  String? selectedCategory;
  String? selectedType;
  final ImagePicker _picker = ImagePicker();
  File? _imageFile;
  bool isChecked = false;

  final List<String> dropdownItems = [
    'Kasargod',
    'Kannur',
    'Wayanad',
    'Calicut',
    'Malappuram',
    'Palakkad',
    'Thrissur',
    'Ernakulam',
    'Idukki',
    'Kottayam',
    'Alappuza',
    'Pathanamthitta',
    'Kollam',
    'Trivandram'
  ];

  final List<String> dropdownItems2 = [
    'A',
    'B',
    'C',
    'D',
  ];

  final List<String> dropdownItems3 = [
    'H1',
    'H2',
    'H3',
    'H4',
    'H5',
  ];

 // Controllers for form fields
  final _usernameController = TextEditingController();
  final _officeController = TextEditingController();
  final _phoneController = TextEditingController();
  final _regnumberController = TextEditingController();
  final _coordinator1Controller = TextEditingController(); 
  final _coordinator2Controller = TextEditingController(); 
  final _coordinatorName1controller = TextEditingController();
  final _coordinatorName2controller = TextEditingController();


  Future<void> _pickImage() async {
    final XFile? image = await _picker.pickImage(source: ImageSource.gallery);
    if (image != null) {
      setState(() {
        _imageFile = File(image.path);
      });
    }
  }

  @override
  void dispose() {
    // Dispose controllers to free resources
    _usernameController.dispose();
    _officeController.dispose();
    _phoneController.dispose();
    _regnumberController.dispose();
    _coordinator1Controller.dispose();
    _coordinator2Controller.dispose();
    super.dispose();
  }


  @override
  Widget build(BuildContext context) {
     final formKey = GlobalKey<FormState>();
    return Scaffold(
      backgroundColor: Colors.grey[300],
      appBar: AppBar(
        leading: IconButton(
          onPressed: () {
            Navigator.of(context).pop();
          },
          icon: const Icon(Icons.arrow_back),
        ),
        backgroundColor: Colors.white,
        title: Row(
          children: [
            Icon(Icons.bloodtype,color: Colors.red,),
            SizedBox(width: 10,),
            const Text(
              'Club Register',
              style: TextStyle(color: Colors.black,fontWeight: FontWeight.bold),
            ),
          ],
        ),
        centerTitle: true,
      ),
      body: Form(
        key: formKey,
        child: SingleChildScrollView(
          padding: const EdgeInsets.all(16.0),
          child: Center(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                const Text(
                  'Club Register',
                  style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
                ),
                const SizedBox(height: 20),

                // Image Upload Field
                SizedBox(
                  width: 300,
                  child: Card(
                    child: Column(
                      children: [
                        _imageFile != null
                            ? Image.file(
                                _imageFile!,
                                width: 300,
                                height: 300,
                                fit: BoxFit.cover,
                              )
                            : const Text('No image selected', style: TextStyle(fontSize: 18)),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: [
                            CircleAvatar(
                              backgroundColor: Colors.red.shade100,
                              radius: 35,
                              child: IconButton(
                                onPressed: _pickImage,
                                icon: const Icon(Icons.cloud_upload, color: Colors.black),
                              ),
                            ),
                            const SizedBox(width: 10),
                            const Text('Upload the Photo')
                          ],
                        ),
                      ],
                    ),
                  ),
                ),
                const SizedBox(height: 20),

                // Name Field
                buildInputField('Name', 'Enter', _usernameController),

                // Address Field
                buildInputField('Office Address', 'Enter', _officeController),

                // Phone Number Field
                buildInputField(
                  'Phone Number',
                  'Enter',
                  _phoneController,
                  keyboardType: TextInputType.number,
                  inputFormatters: [FilteringTextInputFormatter.digitsOnly],
                ),

                // Dropdown 1: Select District
                buildDropdownField('Select District', dropdownItems, selectedDistrict, (value) {
                  setState(() {
                    selectedDistrict = value;
                  });
                }),

                // Dropdown 2: Select Panchayat
                buildDropdownField('Select Panchayat', dropdownItems2, selectedCategory, (value) {
                  setState(() {
                    selectedCategory = value;
                  });
                }),

                // Dropdown 3: Select Home Town
                buildDropdownField('Select Home Town', dropdownItems3, selectedType, (value) {
                  setState(() {
                    selectedType = value;
                  });
                }),

                // Club Register Number Field
                buildInputField(
                  'Club Register Number',
                  'number',
                  _regnumberController,
                  keyboardType: TextInputType.number,
                  inputFormatters: [FilteringTextInputFormatter.digitsOnly],
                ),

                // Checkbox and Conditional TextFormFields
                Row(
                  children: [
                    Checkbox(
                      value: isChecked,
                      onChanged: (bool? value) {
                        setState(() {
                          isChecked = value!;
                        });
                      },
                    ),
                    const Text(
                      'Add Coordinator Number',
                      style: TextStyle(fontSize: 16),
                    ),
                  ],
                ),

                if (isChecked) ...[
                  

                    //
                        Container(width: 300,
                          color: Colors.grey[600],
                          child: Padding(
                           padding: const EdgeInsets.all(8.0),
                           
                            child: buildInputField('Coordinator Name 1', 'Enter Coordinator Name 1',
                                                  //_coordinator1Controller,
                                                  _coordinatorName1controller,
                                                  keyboardType: TextInputType.text,
                                                  //inputFormatters: [FilteringTextInputFormatter.digitsOnly]
                                                  ),
                          ),
                        ),
                        
                    //
                    Container(width: 300,color: Colors.grey[600],
                      child: Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: buildInputField('Coordinator Number 1', 'Enter Coordinator Number 1',
                          _coordinator1Controller,
                          keyboardType: TextInputType.number,
                          inputFormatters: [FilteringTextInputFormatter.digitsOnly]),
                      ),
                    ),
                    const SizedBox(height: 20,),
                       //
                        Container(width: 300,color: Colors.grey[600],
                          child: Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: buildInputField('Coordinator Name 2', 'Enter Coordinator Name 2',
                                                  //_coordinator1Controller,
                                                  _coordinatorName2controller,
                                                  keyboardType: TextInputType.text,
                                                  //inputFormatters: [FilteringTextInputFormatter.digitsOnly],
                                                  ),
                          ),
                        ),
                    //

                  Container(width: 300,color: Colors.grey[600],
                    child: Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: buildInputField('Coordinator Number 2', 'Enter Coordinator Number 2',
                          _coordinator2Controller,
                          keyboardType: TextInputType.number,
                          inputFormatters: [FilteringTextInputFormatter.digitsOnly]),
                    ),
                  ),
                     
                ],

                const SizedBox(height: 20),

                // Submit Button
                SizedBox(
                  width: 200,
                  child: ElevatedButton(
                    style: ElevatedButton.styleFrom(
                      backgroundColor: const Color.fromARGB(255, 224, 70, 59),
                    ),
                    onPressed: () {
                      if (formKey.currentState!.validate()) {
                        // Navigator.of(context).pushNamed('clubprofile', arguments: _usernameController.text);
                         Navigator.of(context).pushNamed('NewClub', arguments: _usernameController.text);
                      }
                    },
                    child: const Text(
                      'Submit',
                      style: TextStyle(color: Colors.white),
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

// Helper Widget for Input Fields
  Widget buildInputField(String label, String hint, TextEditingController controller,
      {TextInputType keyboardType = TextInputType.text, List<TextInputFormatter>? inputFormatters}) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(label, style: const TextStyle(fontWeight: FontWeight.bold)),
        SizedBox(
          width: 300,
          child: TextFormField(
            controller: controller,
            keyboardType: keyboardType,
            inputFormatters: inputFormatters,
            validator: (value) {
              if (value == null || value.isEmpty) {
                return 'This field is empty';
              }
              return null;
            },
            decoration: InputDecoration(
              fillColor: Colors.white,
              filled: true,
              hintText: hint,
              border: OutlineInputBorder(borderRadius: BorderRadius.circular(10)),
            ),
          ),
        ),
        const SizedBox(height: 20),
      ],
    );
  }

  // Helper Widget for Dropdown Fields
  Widget buildDropdownField(String label, List<String> items, String? selectedValue, ValueChanged<String?> onChanged) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(label, style: const TextStyle(fontWeight: FontWeight.bold)),
        SizedBox(
          width: 300,
          child: DropdownButtonFormField<String>(
            value: selectedValue,
            hint: const Text('Select'),
            decoration: InputDecoration(
              fillColor: Colors.white,
              filled: true,
              border: OutlineInputBorder(borderRadius: BorderRadius.circular(10)),
            ),
            items: items.map((String item) {
              return DropdownMenuItem<String>(
                value: item,
                child: Text(item),
              );
            }).toList(),
            onChanged: onChanged,
            validator: (value) {
              if (value == null || value.isEmpty) {
                return 'Please select an option';
              }
              return null;
            },
          ),
        ),
        const SizedBox(height: 20),
      ],
    );
  }


}