// import 'package:flutter/material.dart';
//
// import '../provider/form_provider.dart';
// import '../widget/InputFieldSuffixIcon.dart';
// import '../widget/inputfield_widget.dart';
//
//
// class FormScreenBody extends StatelessWidget {
//    FormProvider formProvider;
//    FormScreenBody({Key? key, required this.formProvider}) : super(key: key);
//
//
//   bool isHiddenPassword = true;
//
//
//   @override
//   Widget build(BuildContext context) {
//
//     return SafeArea(
//       child: SingleChildScrollView(
//         child: Container(
//           width: double.infinity,
//           height: MediaQuery.of(context).size.height,
//           padding: const EdgeInsets.symmetric(horizontal: 20),
//           child: Column(
//             children: [
//               const SizedBox(height: 30,),
//               Text("Login Form", style: const TextStyle(fontSize: 30),),
//               const Spacer(flex: 3,),
//               Form(
//                 key: _formKey,
//                 // autovalidateMode: AutovalidateMode.always,
//                 child: Column(
//                   children: [
//                     InputFieldWidget(
//                       initialValue: "Haseeb",
//                       hintText: "YourName",
//                       labelText: "Name",
//                       validate:formProvider.validateUsername,
//                       onSaved: formProvider.onSaveUsername,
//                       prefixIcon:const Icon(Icons.person),
//                     ),
//                     InputFieldSuffixIcon(
//                       initialValue: "123456",
//                       hintText: "Your Password",
//                       labelText: "Password",
//                       validate:formProvider.validatePassword,
//                       onSaved: formProvider.onSavedPassword,
//                       onChanged:formProvider.onChancedPassword ,
//                       prefixIcon:const Icon(Icons.person),
//                       isPassword: true,
//                       // isPassword: true,
//                     ),
//                     InputFieldSuffixIcon(
//
//                       initialValue: "123456",
//                       hintText: "Confirm Password",
//                       labelText: "Confirm Password",
//                       validate:formProvider.validateConfirmPassword,
//                       onChanged: formProvider.onChangedConfirmPassword,
//                       onSaved:formProvider.onSaveConfirmPassword,
//                       isPassword: true,
//                       prefixIcon:const Icon(Icons.person),
//                     ),
//                     const SizedBox(height: 20,),
//                     const SizedBox(height: 20,),
//                     const SizedBox(height: 30,),
//                     InkWell(
//                       onTap: () {
//                         if (_formKey.currentState!.validate()) {
//                           _formKey.currentState!.save();
//                           // print("{$formProvider.userName,$formProvider.password,$formProvider.confirmPassword}");
//                           ScaffoldMessenger.of(context).showSnackBar(
//                               const SnackBar(
//                                   content: Text('VALIDATION PASSED'))
//                           );
//                         } else {
//                           ScaffoldMessenger.of(context).showSnackBar(
//                               const SnackBar(content: Text('VALIDATION ERROR')));
//                         }
//                       },
//                       child: Container(
//                         padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
//                         decoration: BoxDecoration(
//                             borderRadius: BorderRadius.circular(10),
//                             color: Colors.blue),
//                         child: const Text("Login", style: TextStyle(fontSize: 24, color: Colors.white),),
//                       ),
//                     ),
//                   ],
//                 ),
//               ),
//               const Spacer(flex: 4,),
//             ],
//           ),
//         ),
//       ),
//     );
//   }
//
//
//
// }
