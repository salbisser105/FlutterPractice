import 'package:flutter/material.dart';
import 'package:flutter_components/widgets/widgets.dart';

class InputsScreen extends StatelessWidget {
  const InputsScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final GlobalKey<FormState> myFormKey = GlobalKey();

    final Map<String, String> formValues = {
      'first_name': 'Santiago',
      'last_name': 'Albisser',
      'email': 'Santiago@hotmail.com',
      'password': '123456',
      'role': 'Admin',
    };

    return Scaffold(
      appBar: AppBar(
        title: const Text('Inputs and Fonts'),
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20.0, vertical: 10.0),
          child: Form(
            key: myFormKey,
            child: Column(children: [
              CustomInputField(
                labelText: 'Name',
                helperText: '5 letters minimum',
                hintText: 'Name of the user',
                formProperty: 'first_name',
                formValues: formValues,
              ),
              const SizedBox(height: 30),
              CustomInputField(
                labelText: 'Last name',
                helperText: '5 letters minimum',
                hintText: 'Last name of the user',
                formValues: formValues,
                formProperty: 'last_name',
              ),
              const SizedBox(height: 30),
              CustomInputField(
                labelText: 'Email',
                helperText: '5 letters minimum',
                hintText: 'Email of the user',
                textInputType: TextInputType.emailAddress,
                formProperty: 'email',
                formValues: formValues,
              ),
              const SizedBox(height: 30),
              CustomInputField(
                labelText: 'Password',
                helperText: '5 letters minimum',
                hintText: 'Password of the user',
                obscureText: true,
                textInputType: TextInputType.emailAddress,
                formProperty: 'password',
                formValues: formValues,
              ),
              const SizedBox(height: 30),
              DropdownButtonFormField<String>(
                value: 'Admin',
                items: const [
                  DropdownMenuItem(
                    child: Text('Superuser'),
                    value: 'Superuser',
                  ),
                  DropdownMenuItem(
                    child: Text('Developer'),
                    value: 'Developer',
                  ),
                  DropdownMenuItem(
                    child: Text('Jr Developer'),
                    value: 'Jr Developer',
                  ),
                ],
                onChanged: (value) {
                  print(value);
                  formValues['role'] = value ?? 'Admin';
                },
              ),
              ElevatedButton(
                  onPressed: () {
                    FocusScope.of(context).requestFocus(FocusNode());
                    if (!myFormKey.currentState!.validate()) {
                      print('form not valid');
                      return;
                    }
                    print(formValues);
                  },
                  child: const SizedBox(
                    width: double.infinity,
                    child: Center(
                      child: Text('Save data'),
                    ),
                  ))
            ]),
          ),
        ),
      ),
    );
  }
}
