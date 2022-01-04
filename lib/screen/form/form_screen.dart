import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:providerbasis/screen/form/provider/form_provider.dart';
import 'package:providerbasis/screen/form/widget/InputFieldSuffixIcon.dart';
import 'package:providerbasis/screen/form/widget/inputfield_widget.dart';
import '../listview/listview_screen.dart';
import 'component/form_body.dart';

class FormScreen extends StatelessWidget {
 FormScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider<FormProvider>(
        create: (_) => FormProvider(),
        child: DDD(),
    );
  }
}


class DDD extends StatelessWidget {

  final _formKey = GlobalKey<FormState>();
  @override
  Widget build(BuildContext context) {
  final formProvider = Provider.of<FormProvider>(context);
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        leading: GestureDetector(
            onTap: (){
              Navigator.of(context).pop();
            },
            child: Icon(Icons.arrow_back,color: Colors.black,)
        ),
        centerTitle: true,
        title: Text("Form",style: TextStyle(color: Colors.black),),
      ),
      body:SafeArea(
        child: SingleChildScrollView(
          child: Container(
            width: double.infinity,
            height: MediaQuery.of(context).size.height,
            padding: const EdgeInsets.symmetric(horizontal: 20),
            child: Column(
              children: [
                const SizedBox(height: 30,),
                Text("Login Form", style: const TextStyle(fontSize: 30),),
                const Spacer(flex: 3,),
                Form(
                  key: _formKey,
                  autovalidateMode: AutovalidateMode.onUserInteraction,
                  child: Column(
                    children: [
                      InputFieldWidget(
                        initialValue: "Haseeb",
                        hintText: "YourName",
                        labelText: "Name",
                        validate:formProvider.validateUsername,
                        onSaved: formProvider.onSaveUsername,
                        prefixIcon:const Icon(Icons.person),
                      ),
                      InputFieldSuffixIcon(
                        initialValue: "12345678",
                        hintText: "Your Password",
                        labelText: "Password",
                        validate:formProvider.validatePassword,
                        onSaved: formProvider.onSavedPassword,
                        onChanged:formProvider.onChancedPassword ,
                        prefixIcon:const Icon(Icons.person),
                        isPassword: true,
                        // isPassword: true,
                      ),
                      InputFieldSuffixIcon(

                        initialValue: "12345678",
                        hintText: "Confirm Password",
                        labelText: "Confirm Password",
                        validate:formProvider.validateConfirmPassword,
                        onChanged: formProvider.onChangedConfirmPassword,
                        onSaved:formProvider.onSaveConfirmPassword,
                        isPassword: true,
                        prefixIcon:const Icon(Icons.person),
                      ),
                      const SizedBox(height: 20,),
                      const SizedBox(height: 20,),
                      const SizedBox(height: 30,),
                      InkWell(
                        onTap: () {
                          if (_formKey.currentState!.validate()) {
                            _formKey.currentState!.save();
                            formProvider.onSubmit();
                            ScaffoldMessenger.of(context).showSnackBar(
                                const SnackBar(
                                    content: Text('VALIDATION PASSED'))
                            );
                          } else {
                            ScaffoldMessenger.of(context).showSnackBar(
                                const SnackBar(content: Text('VALIDATION ERROR')));
                          }
                          Navigator.of(context).push(MaterialPageRoute(builder: (context) => ListViewScreen(),));
                        },
                        child: Container(
                          padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
                          decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(10),
                              color: Colors.blue),
                          child: const Text("Login", style: TextStyle(fontSize: 24, color: Colors.white),),
                        ),
                      ),
                    ],
                  ),
                ),
                const Spacer(flex: 4,),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
