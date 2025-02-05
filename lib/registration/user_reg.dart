import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:image_picker/image_picker.dart';
import 'package:intl/intl.dart';

class ScreenThree extends StatefulWidget {
  const ScreenThree({super.key});

  @override
  State<ScreenThree> createState() => _ScreenThreeState();
}

class _ScreenThreeState extends State<ScreenThree> {

File? _imageFile;

  String? selectedGender;
  String? selectedBlood;
  String? selectedOptions;
  List<String> selectedClubs = [];
  bool buttonVisibilty = false;
  bool isCheck = false;

  final List<String> genderOptions = ['Male', 'Female', 'Other'];
  final List<String> bloodGroup = ['A+','B+','O+','A-','B-','AB+','AB-','O-'];
  final List<String> clubOptions = [' Club1', ' Club2', ' Club3', ' Club4', ' Club5',];
  final ImagePicker _picker = ImagePicker();
  //'club6','club7','club8','club9','club10'
 TextEditingController _date = TextEditingController();
  TextEditingController _dateSecond = TextEditingController();
  TextEditingController _dateThird = TextEditingController();

//controllers
final _nameController = TextEditingController();
final _phoneController = TextEditingController();
final _emailController = TextEditingController();
final  _genderController = TextEditingController();
final _bloodController = TextEditingController();

@override
 void dispose(){
  _nameController.dispose();
  _phoneController.dispose();
  _emailController.dispose();
  _genderController.dispose();
  _bloodController.dispose();
  super.dispose();
 } 
 



  @override
  Widget build(BuildContext context) {
    final formKey = GlobalKey<FormState>();
    return Scaffold(
      backgroundColor: Colors.grey[300],
      appBar: AppBar(
        backgroundColor: Colors.white,
        leading: IconButton(
          onPressed: () {
            Navigator.of(context).pop();
          },
          icon: const Icon(Icons.arrow_back),
        ),
        title: const Row(
          children: [
            Icon(Icons.bloodtype,color: Colors.red,),
            SizedBox(width: 10,),
            Text('Create Account',style: TextStyle(color: Colors.black,fontWeight: FontWeight.bold),),
          ],
        ),
        centerTitle: true,
      ),
      body: Container(
        // decoration: const BoxDecoration(
        //   image: DecorationImage(
        //     image: AssetImage('assets/front2.jpg'),
        //     fit: BoxFit.fill,
        //   ),
        // ),
        width: double.infinity,
        child: Form(
          key: formKey,
          child: SingleChildScrollView(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
             mainAxisAlignment: MainAxisAlignment.start,
              
              children: [
             const   Text('User Register',style: TextStyle(fontWeight: FontWeight.bold,fontSize:24 ),),
                const SizedBox(height: 20),
                SizedBox(

          //name field   
                  width: 300,
                  child: TextFormField(
                  controller: _nameController,
                    validator: (value) {
                      if(value!.isEmpty){
                        return " this field is empty";
                      }
                      return null;
                    },
                    decoration: InputDecoration(fillColor: Colors.white,filled: true,
                      hintText: 'Name',
                      errorBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(10.0),
                      ),
                      enabledBorder: OutlineInputBorder(borderRadius: BorderRadius.circular(10.0),),
                      focusedBorder: OutlineInputBorder(borderRadius: BorderRadius.circular(10.0),),
                      focusedErrorBorder: OutlineInputBorder(borderRadius: BorderRadius.circular(10.0),),
                      errorStyle: const TextStyle(color: Color.fromARGB(255, 189, 42, 32))
                    ),
                  ),
                ),
                const SizedBox(height: 30),
                    
                // Gender Dropdown
                Container(
                  color: Colors.transparent,
                  height: 70,
                  width: 300,
                  child: DropdownButtonFormField<String>(
                    decoration: InputDecoration(fillColor: Colors.white,filled: true,
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(10.0),
                      ),
                    ),
                    hint: const Text('Gender'),
                    //value: selectedGender,
                    value: _genderController.text.isNotEmpty
                    ? _genderController.text
                    : null,
                    onChanged: (newValue) {
                      setState(() {
                        //selectedGender = newValue;
                        _genderController.text = newValue ?? '';
                      });
                    },
                    items: genderOptions.map((gender) {
                      return DropdownMenuItem(
                        value: gender,
                        child: Text(gender),
                      );
                    }).toList(),
                    validator: (value){
                      if(value == null || value.isEmpty){
                        return 'select gender';
                      }
                      return null;
                    },
                  ),
                ),
                const SizedBox(height: 10),
                    
                // Club Multiple Selection Field
                SizedBox(
                  height: 50,
                  width: 300,
                  child: ElevatedButton(
                    
                    onPressed: () {
                      _showClubSelectionDialog();
                    },
                    child: Text(
                      selectedClubs.isEmpty ? 'Select Clubs' : selectedClubs.join(', '),
                      maxLines: 1,
                      overflow: TextOverflow.ellipsis,
                    ),
                    
                  ),
                ),
                const SizedBox(height: 30),
                    
     //blood group   
                 SizedBox(
                  width: 300,
                  child: DropdownButtonFormField<String>(
                    decoration: InputDecoration(fillColor: Colors.white,filled: true,
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(10.0),
                      ),
                    ),
                    hint: const Text('Blood Group'),
                   // value: selectedBlood,
                   value: _bloodController.text.isNotEmpty
                   ? _bloodController.text
                   : null,
                    onChanged: (newValue) {
                      setState(() {
                        //selectedBlood = newValue;
                        _bloodController.text = newValue ?? '';
                      });
                    },
                    items: bloodGroup.map((blood) {
                      return DropdownMenuItem(
                        value: blood,
                        child: Text(blood),
                      );
                    }).toList(),
                    validator: (value){
                      if(value==null || value.isEmpty){
                        return 'please select blood group';
                      }
                      return null;
                    },
                  ),
                ),
                const SizedBox(height: 30),
                    
                //date
                SizedBox(
                  width: 300,
                  // height: 50,
                  child: TextFormField(
                validator: (value){
                  if(value==null||value.isEmpty){
                    return 'select date';
                  }
                  return null;
                },
                    controller: _date,
                    decoration:  InputDecoration(
                      suffixIcon: const Icon(Icons.calendar_today_rounded),
                      fillColor: Colors.white,filled: true,
                      border: OutlineInputBorder(borderRadius:BorderRadius.circular(10.0) ),
                      
                      labelText: 'Last donated date'
                    
                    ),
                    onTap: () async{
                      DateTime? pickeddate = await showDatePicker(
                        context: context,
                         firstDate: DateTime(2000), 
                        lastDate: DateTime.now(),
                        initialDate: DateTime.now(),
                        ); 
                        if(pickeddate!=null){
                          setState(() {
                            _date.text = DateFormat('yyyy-MM-dd').format(pickeddate);
                          });
                        }
                    },
                  ),
                ),     
             const SizedBox(height: 30,),   
          //phone number   
                SizedBox(
                  width: 300,
                  child: TextFormField(
                    controller: _phoneController,
                  keyboardType: TextInputType.number,
                  inputFormatters:[ FilteringTextInputFormatter.digitsOnly],
                    validator: (value) {
                      if(value!.isEmpty){
                        return " this field is empty";
                      }
                      if(value.length<10){
                        return 'atleast 10 digits';
                      }
                      return null;
                    },
                    decoration: InputDecoration(fillColor: Colors.white,filled: true,
                      hintText: 'Contact Number',
                      enabledBorder: OutlineInputBorder(borderRadius: BorderRadius.circular(10.0)),
                      errorBorder: OutlineInputBorder(borderRadius: BorderRadius.circular(10.0)),
                      focusedBorder: OutlineInputBorder(borderRadius: BorderRadius.circular(10.0)),
                      focusedErrorBorder: OutlineInputBorder(borderRadius: BorderRadius.circular(10.0)),
                      errorStyle: const TextStyle(color: Colors.red)
                    ),
                  ),
                ),
                const SizedBox(height: 30),
            
                //private
                SizedBox(
                  height: 50,
                  width: 300,
                  child: ElevatedButton(onPressed: (){
                    setState(() {
                      buttonVisibilty = !buttonVisibilty;
                    });
                  }, child:const Text('Private')),
                ),
               const SizedBox(height: 20,),
            
                Visibility( visible: buttonVisibilty,   child: Align(alignment: Alignment.center,

                  child: Center(
                    child: SizedBox(width: 300,
                    
                      child: Card(
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: [
                        Center(
                          child: RadioListTile(value: 'Coordinator only contact', title:const Text('Coordinator only contact'),
                          groupValue: selectedOptions, 
                          onChanged: (value){
                            setState(() {
                              selectedOptions=value!;
                            });
                          }),
                        ),
                        
                        RadioListTile(value: 'No one should call me for a few days', title:const Text('No one should call me for a few days'),
                        groupValue: selectedOptions, 
                        onChanged: (value){
                          
                          setState(() {
                            selectedOptions=value!;
                          });
                          if(value=='No one should call me for a few days'){
                            showDialog(context: context, builder: (context)=>
                              AlertDialog(
                                title:const Text('select date'),
                                content:SizedBox(
                                  
                        // width: 300,height: 50,
                        child: SingleChildScrollView(
                          child: Column(
                            children: [
                              TextFormField(
                                controller: _dateThird,
                                decoration:  InputDecoration(
                                  suffixIcon: const Icon(Icons.calendar_today_rounded),
                                  border: OutlineInputBorder(borderRadius:BorderRadius.circular(10.0) ),
                                  // icon: const Icon(Icons.calendar_today_rounded),
                                  labelText: 'Start date'
                                
                                ),
                                onTap: () async{
                                  DateTime? pickeddate = await showDatePicker(
                                    context: context,
                                     firstDate: DateTime(2000), 
                                    // lastDate: DateTime(2030) 
                                    lastDate: DateTime.now()
                                    );
                                    
                                    if(pickeddate!=null){
                                      setState(() {
                                        _dateThird.text = DateFormat('yyyy-mm-dd').format(pickeddate);
                                      });
                                    }
                                
                                },
                              ),
                             const SizedBox(height: 30,),
                              //second date
                              TextFormField(
                                controller: _dateSecond,
                                decoration:  InputDecoration(
                                  suffixIcon:const Icon(Icons.calendar_today_outlined),
                                  fillColor: Colors.white,filled: true,
                                  border: OutlineInputBorder(borderRadius:BorderRadius.circular(10.0) ),
                                  // icon:const Icon(Icons.calendar_today_rounded),
                                  labelText: 'End date'
                                
                                ),
                                onTap: () async{
                                  DateTime? pickeddate = await showDatePicker(
                                    context: context, 
                                    firstDate: DateTime(2000), 
                                    // lastDate: DateTime(2030)
                                    lastDate: DateTime.now()
                                    );
                                    
                                    if(pickeddate!=null){
                                      setState(() {
                                        _dateSecond.text = DateFormat('yyyy-mm-dd').format(pickeddate);
                                      });
                                    }
                                
                                },
                              )
                            ],
                          ),
                        ),
                         ),
                                actions: [
                                  TextButton(onPressed: (){
                                    Navigator.of(context).pop();
                                  }, child: const Text('ok'))
                                ],
                              )
                            
                            );
                          }//end of if
                        
                        }),
                        
                        
                        
                        RadioListTile(value: 'Any One Call Me', title:const Text('Any One Call Me'),
                        groupValue: selectedOptions, 
                        onChanged: (value){
                          setState(() {
                            selectedOptions=value!;
                          });
                        }),
                                      
                        ],
                        
                        ),
                      ),
                    ),
                  ),
                )),
            
               const SizedBox(height: 30,),   
            
                //imageoption
                SizedBox(
                
                  width: 338,
                  child: Card(
                    child: Padding(
                      padding: const EdgeInsets.all(8.0),
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
                                backgroundColor: Colors.red.shade200,
                                radius: 25,
                                child: IconButton(onPressed: 
                                  _pickImage, icon: const Icon(Icons.cloud_upload,color: Colors.black,), 
                                  ),
                              ),
                              const SizedBox(width: 10,),
                                const Text('choose the file from gallery')
                            ],
                          
                          ),
                        ],
                      ),
                    ),
                  ),
                  
                ),
              const   SizedBox(height: 35,),
            
            
                SizedBox(
  width: 300,
 // height: 50,
  child: TextFormField(
    controller: _emailController,
    validator: (value) {
      if (value == null || value.isEmpty) {
        return 'Please enter an email';
      }
      // Regular expression for email validation
      final emailRegex = RegExp(r'^[\w-\.]+@([\w-]+\.)+[\w-]{2,4}$');
      if (!emailRegex.hasMatch(value)) {
        return 'Please enter a valid email';
      }
      return null;
    },
    decoration: InputDecoration(
      fillColor: Colors.white,
      filled: true,
      hintText: 'Email',
      border: OutlineInputBorder(
        borderRadius: BorderRadius.circular(10.0), 
      ),
      errorBorder: OutlineInputBorder(
        borderRadius: BorderRadius.circular(10.0)
      ),
      enabledBorder: OutlineInputBorder(
        borderRadius: BorderRadius.circular(10.0)
      ),
      focusedBorder: OutlineInputBorder(
        borderRadius: BorderRadius.circular(10.0)
      ),
      focusedErrorBorder: OutlineInputBorder(
        borderRadius: BorderRadius.circular(10.0)
      )
    ),
  ),
),
const SizedBox(height: 30),

                   //checkbox
                SizedBox(
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      Checkbox(value: isCheck,
                       onChanged: (value){
                            setState(() {
                              isCheck=value!;
                            });
                       }
                       
                       ),
                     const  Text('You are above 18 and not alcoholic')
                    ],
                  ),
                   
                ),
            
           const SizedBox(height:35 ,),
                    
                SizedBox(
                  height: 35,
                  width: 150,
                  child: ElevatedButton( style: ElevatedButton.styleFrom(
    backgroundColor: const Color.fromARGB(255, 224, 70, 59), // Set background color directly
  ),
                    onPressed: () {
                     
                      if(formKey.currentState!.validate()&& isCheck){
                        ScaffoldMessenger.of(context).showSnackBar(
                          const SnackBar(content: Text('Profile created'))
                        );
                        Navigator.of(context).pushNamed('Userpage',
                        // arguments: {
                        //   'name':_nameController.text,
                        //   // 'gender':_genderController,
                        //   'blood':_bloodController.text,
                        // }
                        arguments: _nameController.text
                        );
                      }else if(!isCheck){
                        ScaffoldMessenger.of(context).showSnackBar(
                          const SnackBar(
                            behavior: SnackBarBehavior.floating,
                            margin: EdgeInsets.all(10),
                            content: Text('please confirm you are alcoholic or 18 above'))
                        );
                      }
                     
                      
                      
                    },
                    child: const Text('Create',style:TextStyle(color: Colors.white),),
                  ),
                ),
              const  SizedBox(height: 200,)
              ],
            ),
          ),
        ),
      ),
    );
  }

// Function to show the club selection dialog
  void _showClubSelectionDialog() {
    showDialog(
      context: context,
      builder: (context) {
        return AlertDialog(
          title: const Text('Select Clubs (Choose at least 3)'),
          content: StatefulBuilder(
            builder: (context, setState) {
              return Column(
                mainAxisSize: MainAxisSize.min,
                children: clubOptions.map((club) {
                  return CheckboxListTile(
                    title: Text(club),
                    value: selectedClubs.contains(club),
                    onChanged: (isChecked) {
                      setState(() {
                        if (isChecked ?? false) {
                          selectedClubs.add(club);
                        } else {
                          selectedClubs.remove(club);
                        }
                      });
                    },
                  );
                }).toList(),
              );
            },
          ),
          actions: [
            ElevatedButton(
              onPressed: () {
                if (selectedClubs.length >= 3) {
                  Navigator.of(context).pop();
                } else {
                  ScaffoldMessenger.of(context).showSnackBar(
                    const SnackBar(content: Text('Please select at least 3 clubs.')),
                  );
                }
              },
              child: const Text('OK'),
            ),
          ],
        );
      },
    );
  }

 
  //image
Future<void> _pickImage() async{
  final XFile? image = await _picker.pickImage(source: ImageSource.gallery);
  if(image!=null){
    setState(() {
      _imageFile= File(image.path);
      
    });
  }
}
  
 

}