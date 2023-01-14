import 'package:detail/employee_details.dart';
import 'package:detail/employee_provider.dart';
import 'package:email_validator/email_validator.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:intl/intl.dart';
import 'login.dart';

class SignUp extends StatefulWidget {
  const SignUp({Key? key}) : super(key: key);

  @override
  State<SignUp> createState() => _SignUpState();
}

class _SignUpState extends State<SignUp> {
  bool _isObscure = true;
  DateTime? _selectedDate;
  TextEditingController nameController = TextEditingController();
  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
  TextEditingController designationController = TextEditingController();
  TextEditingController ageController = TextEditingController();
  TextEditingController dateController = TextEditingController();

  // Future<void> createItem(Map<String, dynamic> newItem) async {
  //   await Provider.of<EmployeProvider>(context).createItem(newItem);
  // }

  @override
  Widget build(BuildContext context) {
    final formKey = GlobalKey<FormState>();
    return Scaffold(
      backgroundColor: Colors.white,
      body: Form(
        key: formKey,
        child: ListView(
          padding: const EdgeInsets.fromLTRB(40, 150, 40, 0),
          children: [
            TextFormField(
              controller: nameController,
              decoration: InputDecoration(
                hintText: 'Name',
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
                if (value == null || value.isEmpty) {
                  return 'Please enter some text';
                }
                return null;
              },
            ),
            const SizedBox(height: 10.0),
            TextFormField(
              controller: emailController,
              decoration: InputDecoration(
                hintText: 'Email',
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
                final items =
                    Provider.of<EmployeProvider>(context, listen: false)
                        .showItems();

                for (final item in items) {
                  if (item['email'] == value) {
                    return 'Email already in use.';
                  }
                }

                return null;
              },
            ),
            const SizedBox(height: 10.0),
            TextFormField(
              decoration: InputDecoration(
                hintText: 'Date of birth',
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
                suffixIcon: IconButton(
                  icon: const Icon(Icons.calendar_today),
                  onPressed: () async {
                    final date = await showDatePicker(
                      context: context,
                      initialDate: _selectedDate ?? DateTime.now(),
                      firstDate: DateTime(1900),
                      lastDate: DateTime.now(),
                    );
                    if (date != null) {
                      setState(() {
                        _selectedDate = date;
                      });
                      dateController.text = DateFormat.yMd().format(date);
                    }
                  },
                ),
              ),
              validator: (value) {
                if (value == null || value.isEmpty) {
                  return 'Please enter DOB';
                }
                return null;
              },
              controller: dateController,
            ),
            const SizedBox(height: 10.0),
            TextFormField(
              controller: ageController,
              keyboardType: TextInputType.number,
              decoration: InputDecoration(
                hintText: 'Age',
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
                if (value == null || value.isEmpty) {
                  return 'Please enter correct age';
                }
                return null;
              },
            ),
            const SizedBox(height: 10.0),
            TextFormField(
              controller: designationController,
              decoration: InputDecoration(
                hintText: 'Designation',
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
                if (value == null || value.isEmpty) {
                  return 'Please enter designation';
                }
                return null;
              },
            ),
            const SizedBox(height: 10.0),
            TextFormField(
              controller: passwordController,
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
              width: 10,
              height: 30,
              child: OutlinedButton(
                onPressed: () {
                  onSuccess(formKey, context);
                },
                style: OutlinedButton.styleFrom(
                  foregroundColor: Colors.white,
                  backgroundColor: Colors.blue,
                  // shadowColor: Colors.grey,
                  elevation: 7,
                  shape: const RoundedRectangleBorder(
                      borderRadius: BorderRadius.all(Radius.circular(25))),
                ),
                child: const Text('Sign Up'),
              ),
            ),
            const SizedBox(height: 20.0),
            TextButton(
              onPressed: () {
                Navigator.pop(context);
                Navigator.push(context,
                    MaterialPageRoute(builder: (context) => const Login()));
                // );
              },
              child: const Text(
                "Already Member",
                style: TextStyle(
                    fontSize: 18.0,
                    color: Colors.black,
                    fontWeight: FontWeight.w500),
              ),
            ),
          ],
        ),
      ),
    );
  }

  void onSuccess(GlobalKey<FormState> formKey, BuildContext context) async {
    if (formKey.currentState!.validate()) {
      await Provider.of<EmployeProvider>(context, listen: false).createItem({
        "name": nameController.text,
        "email": emailController.text,
        "age": ageController.text,
        "designation": designationController.text,
        "password": passwordController.text,
        "date": dateController.text
      });
      Navigator.pushReplacement(context,
          MaterialPageRoute(builder: (context) => const EmployeeDetails()));
    }
  }
}
