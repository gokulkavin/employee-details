import 'package:detail/employee_details.dart';
import 'package:detail/employee_provider.dart';
import 'package:detail/sign_up.dart';
import 'package:email_validator/email_validator.dart';

import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class Login extends StatefulWidget {
  const Login({Key? key}) : super(key: key);

  @override
  State<Login> createState() => _LoginState();
}

class _LoginState extends State<Login> {
  bool _isObscure = true;

  TextEditingController lemailController = TextEditingController();
  TextEditingController lpasswordController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    final formKey1 = GlobalKey<FormState>();
    context.read<EmployeProvider>().items;
    return Consumer<EmployeProvider>(
      builder: (context, value, child) => Scaffold(
        backgroundColor: Colors.white,
        body: Form(
          key: formKey1,
          child: Padding(
            padding: const EdgeInsets.fromLTRB(40, 0, 40, 0),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                TextFormField(
                  controller: lemailController,
                  decoration: InputDecoration(
                    hintText: 'Email',
                    // prefixIcon: Icon(Icons.email, color: Colors.grey),
                    hintStyle: const TextStyle(
                      fontSize: 15.0,
                      color: Colors.black,
                      fontWeight: FontWeight.w500,
                    ),
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(25.0),
                    ),
                    focusedBorder: OutlineInputBorder(
                      borderSide: const BorderSide(
                        color: Colors.greenAccent,
                        style: BorderStyle.solid,
                        width: 1,
                      ),
                      borderRadius: BorderRadius.circular(25.0),
                    ),
                  ),
                  validator: (value) {
                    if (value == null ||
                        value.isEmpty ||
                        !EmailValidator.validate(value)) {
                      return 'Please enter valid email';
                    }
                    return null;
                  },
                ),
                const SizedBox(height: 10.0),
                TextFormField(
                  controller: lpasswordController,
                  enableInteractiveSelection: false,
                  obscureText: _isObscure,
                  decoration: InputDecoration(
                    hintText: 'Password',
                    suffixIcon: IconButton(
                      icon: Icon(
                        _isObscure
                            ? Icons.visibility_outlined
                            : Icons.visibility_off_outlined,
                        size: 12.0,
                        color: Colors.grey,
                      ),
                      onPressed: () {
                        setState(() {
                          _isObscure = !_isObscure;
                        });
                      },
                    ),
                    hintStyle: const TextStyle(
                        fontSize: 15.0,
                        color: Colors.black,
                        fontWeight: FontWeight.w500),
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(25.0),
                    ),
                    focusedBorder: OutlineInputBorder(
                      borderSide: const BorderSide(
                        color: Colors.greenAccent,
                        style: BorderStyle.solid,
                        width: 1,
                      ),
                      borderRadius: BorderRadius.circular(25.0),
                    ),
                  ),
                  validator: (value) {
                    if (value == null || value.isEmpty || value.length < 7) {
                      return 'Please enter valid password';
                    }
                    return null;
                  },
                ),
                const SizedBox(height: 30.0),
                SizedBox(
                  height: 30,
                  width: 100,
                  child: OutlinedButton(
                    onPressed: () {
                      // onSuccess(formKey1, context);

                      isExisting(formKey1, value, context);
                    },
                    style: OutlinedButton.styleFrom(
                      foregroundColor: Colors.white,
                      backgroundColor: Colors.blue,
                      // shadowColor: Colors.grey,
                      elevation: 7,
                      shape: const RoundedRectangleBorder(
                          borderRadius: BorderRadius.all(Radius.circular(25))),
                    ),
                    child: const Text('Login'),
                  ),
                ),
                const SizedBox(height: 20.0),
                TextButton(
                  onPressed: () {
                    Navigator.pop(context);
                    Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => const SignUp()));
                    // );
                  },
                  child: const Text(
                    "New User?",
                    style: TextStyle(
                        fontSize: 18.0,
                        color: Colors.black,
                        fontWeight: FontWeight.w500),
                  ),
                ),
                // NotExisting(),
              ],
            ),
          ),
        ),
      ),
    );
  }

  void isExisting(GlobalKey<FormState> formKey1, EmployeProvider value,
      BuildContext context) {
    if (formKey1.currentState!.validate()) {
      (value.showItems().any((data) {
        return (data['email'].toString()) == (lemailController.text) &&
            (data['password'].toString()) == (lpasswordController.text);
      })
          ? Navigator.pushReplacement(
              context,
              MaterialPageRoute(builder: (context) => const EmployeeDetails()),
            )
          : showDialog(
              context: context,
              builder: (BuildContext context) {
                return AlertDialog(
                  content: const Text(
                      'Please check credentials.\nIf new user please register'),
                  actions: [
                    ElevatedButton(
                      child: const Text('OK'),
                      onPressed: () {
                        Navigator.of(context).pop();
                      },
                    ),
                  ],
                );
              },
            ));
    }
  }
}
