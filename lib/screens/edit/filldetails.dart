import 'package:flutter/material.dart';
// import 'package:flutter_form_builder/flutter_form_builder.dart';

class FillDetails extends StatefulWidget {
  static const routeName = './filldetails';
  @override
  _FillDetailsState createState() => _FillDetailsState();
}

class _FillDetailsState extends State<FillDetails> {
  var _isLoading = false;
  final _pass = FocusNode();
  final _form = GlobalKey<FormState>();
  // final GlobalKey<FormBuilderState> _fbKey = GlobalKey<FormBuilderState>();
  String _email='';
  String _password = '';
  List<dynamic> myList;
  List<String> myNewList;

   @override
  void dispose() {
    _pass.dispose();
    super.dispose();
  }

  
  void _saveForm() async{    
    final isValid = _form.currentState.validate();
    FocusScope.of(context).unfocus();
    if(isValid){  
      _form.currentState.save();
      print(_email);
      print(_password);
    }
  }


  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body:
        //   body: SingleChildScrollView(
        //   child: Form(
        //       key: _form,
        //       child: Container(
        //       padding: EdgeInsets.symmetric(horizontal: 40),
        //       width: double.infinity,
        //       child: Column(
        //         mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        //         children: <Widget>[
        //           Column(
        //             children: <Widget>[
                      
        //               SizedBox(height: 30,),
                      
        //               Container(
        //                 child: Column(
        //                   crossAxisAlignment: CrossAxisAlignment.start,
        //                   children: <Widget>[
        //                     Text('Email', style: TextStyle(
        //                       fontSize: 15,
        //                       fontWeight: FontWeight.w400,
        //                       color: Colors.black87
        //                     ),),
        //                     SizedBox(height: 5,),
        //                     TextFormField(
        //                       validator: (value){
        //                         if(value.isEmpty || !value.contains('@') || !value.contains('.com') || value.length <10){
        //                           return "Enter valid Email";
        //                         }
        //                         return null;
        //                       },
        //                       textInputAction: TextInputAction.next,
        //                       decoration: InputDecoration(
        //                         contentPadding: EdgeInsets.symmetric(vertical: 0, horizontal: 10),
        //                         enabledBorder: OutlineInputBorder(
        //                           borderSide: BorderSide(color: Colors.grey[400])
        //                         ),
        //                         border: OutlineInputBorder(
        //                           borderSide: BorderSide(color: Colors.grey[400])
        //                         ),
        //                       ),
        //                       onFieldSubmitted: (_){
        //                         FocusScope.of(context).requestFocus(_pass);
        //                       },
        //                       onSaved: (value){
        //                         _email=value;
        //                       },
        //                     ),
        //                     SizedBox(height: 30,),
        //                   ],
        //                 ),
        //               ),
        //               Container(
        //                 child: Column(
        //                   crossAxisAlignment: CrossAxisAlignment.start,
        //                   children: <Widget>[
        //                     Text('Password', style: TextStyle(
        //                       fontSize: 15,
        //                       fontWeight: FontWeight.w400,
        //                       color: Colors.black87
        //                     ),),
        //                     SizedBox(height: 5,),
        //                     TextFormField(
        //                       validator: (value){
        //                         if(value.isEmpty || value.length<6){
        //                           return "Enter atleast 6 Characters";
        //                         }
        //                         return null;
        //                       },
        //                       focusNode: _pass,
        //                       textInputAction: TextInputAction.done,
        //                       decoration: InputDecoration(
        //                         contentPadding: EdgeInsets.symmetric(vertical: 0, horizontal: 10),
        //                         enabledBorder: OutlineInputBorder(
        //                           borderSide: BorderSide(color: Colors.grey[400])
        //                         ),
        //                         border: OutlineInputBorder(
        //                           borderSide: BorderSide(color: Colors.grey[400])
        //                         ),
        //                       ),
        //                       onFieldSubmitted: (_){
        //                         FocusScope.of(context).unfocus();
        //                       },
        //                       onSaved: (value){
        //                         _password=value;
        //                       },
        //                     ),
        //                     SizedBox(height: 60,),
        //                   ],
        //                 ),
        //               ),
        //               _isLoading ? Center(child:CircularProgressIndicator(backgroundColor: Colors.greenAccent)) :
        //               Container(
        //                 padding: EdgeInsets.only(top: 3, left: 3),
        //                 decoration: BoxDecoration(
        //                   borderRadius: BorderRadius.circular(50),
        //                   border: Border(
        //                     bottom: BorderSide(color: Colors.black),
        //                     top: BorderSide(color: Colors.black),
        //                     left: BorderSide(color: Colors.black),
        //                     right: BorderSide(color: Colors.black),
        //                   )
        //                 ),
        //                 child: MaterialButton(
        //                   minWidth: double.infinity,
        //                   height: 60,
        //                   onPressed: () {
        //                       _saveForm();
                              
        //                   },
        //                   color: Colors.greenAccent,
        //                   elevation: 0,
        //                   shape: RoundedRectangleBorder(
        //                     borderRadius: BorderRadius.circular(50)
        //                   ),
        //                   child: Text("Login", style: TextStyle(
        //                     fontWeight: FontWeight.w600, 
        //                     fontSize: 18
        //                   ),),
        //                 ),
        //               ),           
        //              ],
        //           ),
        //         ],
        //       ),
        //     ),
        //   ),
        // ),

 Container()
// Column(
//   children: <Widget>[
//     FormBuilder(
//       key: _fbKey,
//       initialValue: {
//         'date': DateTime.now(),
//         'accept_terms': false,
//       },
//       autovalidate: true,
//       child: Column(
//         children: <Widget>[
          
//           FormBuilderSlider(
//             attribute: "slider",
//             validators: [FormBuilderValidators.min(6)],
//             min: 0.0,
//             max: 10.0,
//             initialValue: 1.0,
//             divisions: 20,
//             decoration:
//                 InputDecoration(labelText: "Number of things"),
//           ),
//           FormBuilderCheckbox(
//             attribute: 'accept_terms',
//             label: Text(
//                 "I have read and agree to the terms and conditions"),
//             validators: [
//               FormBuilderValidators.requiredTrue(
//                 errorText:
//                     "You must accept terms and conditions to continue",
//               ),
//             ],
//           ),
//           FormBuilderDropdown(
//             attribute: "gender",
//             decoration: InputDecoration(labelText: "Gender"),
//             // initialValue: 'Male',
//             hint: Text('Select Gender'),
//             validators: [FormBuilderValidators.required()],
//             items: ['Male', 'Female', 'Other']
//               .map((gender) => DropdownMenuItem(
//                  value: gender,
//                  child: Text("$gender")
//             )).toList(),
//           ),
//           FormBuilderTextField(
//             attribute: "age",
//             decoration: InputDecoration(labelText: "Age"),
//             validators: [
//               FormBuilderValidators.numeric(),
//               FormBuilderValidators.max(70),
//             ],
//           ),
//           FormBuilderSegmentedControl(
//             decoration:
//                 InputDecoration(labelText: "Movie Rating (Archer)"),
//             attribute: "movie_rating",
//             options: List.generate(5, (i) => i + 1)
//                 .map(
//                     (number) => FormBuilderFieldOption(value: number))
//                 .toList(),
//           ),
//           FormBuilderSwitch(
//             label: Text('I Accept the tems and conditions'),
//             attribute: "accept_terms_switch",
//             initialValue: true,
//           ),
//           FormBuilderTouchSpin(
//             decoration: InputDecoration(labelText: "Stepper"),
//             attribute: "stepper",
//             initialValue: 10,
//             step: 1,
//           ),
//           FormBuilderRate(
//             decoration: InputDecoration(labelText: "Rate this form"),
//             attribute: "rate",
//             iconSize: 32.0,
//             initialValue: 1,
//             max: 5,
//           ),
//           FormBuilderCheckboxList(
//             decoration:
//             InputDecoration(labelText: "The language of my people"),
//             attribute: "languages",
//             initialValue: ["Dart"],
//             options: [
//               FormBuilderFieldOption(value: "Dart"),
//               FormBuilderFieldOption(value: "Kotlin"),
//               FormBuilderFieldOption(value: "Java"),
//               FormBuilderFieldOption(value: "Swift"),
//               FormBuilderFieldOption(value: "Objective-C"),
//             ],
//           ),
//           FormBuilderChoiceChip(
//             attribute: "favorite_ice_cream",
//             options: [
//               FormBuilderFieldOption(
//                 child: Text("Vanilla"),
//                 value: "vanilla"
//               ),
//               FormBuilderFieldOption(
//                 child: Text("Chocolate"),
//                 value: "chocolate"
//               ),
//               FormBuilderFieldOption(
//                 child: Text("Strawberry"),
//                 value: "strawberry"
//               ),
//               FormBuilderFieldOption(
//                 child: Text("Peach"),
//                 value: "peach"
//               ),
//             ],
//           ),
//           FormBuilderFilterChip(
//               attribute: "pets",
//               options: [
//                 FormBuilderFieldOption(
//                   child: Text("Cats"),
//                   value: "cats"
//                 ),
//                 FormBuilderFieldOption(
//                   child: Text("Dogs"),
//                   value: "dogs"
//                 ),
//                 FormBuilderFieldOption(
//                   child: Text("Rodents"),
//                   value: "rodents"
//                 ),
//                 FormBuilderFieldOption(
//                   child: Text("Birds"),
//                   value: "birds"
//                 ),
//               ],
//           ),
//           FormBuilderSignaturePad(
//             decoration: InputDecoration(labelText: "Signature"),
//             attribute: "signature",
//             height: 100,
//           ),
//         ],
//       ),
//     ),
//     Row(
//       children: <Widget>[
//         MaterialButton(
//           child: Text("Submit"),
//           onPressed: () {
//             if (_fbKey.currentState.saveAndValidate()) {
//               print(_fbKey.currentState.value);
//             }
//           },
//         ),
//         MaterialButton(
//           child: Text("Reset"),
//           onPressed: () {
//             _fbKey.currentState.reset();
//           },
//         ),
//       ],
//     )
//   ],
// )


    );
  }
}

