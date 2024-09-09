import 'package:flutter/material.dart';

class ContactForm extends StatefulWidget {
  final Function(String name, String phone, String email) onSave;
  final String? initialName;
  final String? initialPhone;
  final String? initialEmail;

  const ContactForm({
    Key? key,
    required this.onSave,
    this.initialName,
    this.initialPhone,
    this.initialEmail,
  }) : super(key: key);

  @override
  _ContactFormState createState() => _ContactFormState();
}

class _ContactFormState extends State<ContactForm> {
  final _formKey = GlobalKey<FormState>();
  late String name;
  late String phone;
  late String email;

  @override
  void initState() {
    super.initState();
    name = widget.initialName ?? '';
    phone = widget.initialPhone ?? '';
    email = widget.initialEmail ?? '';
  }

  @override
  Widget build(BuildContext context) {
    return Form(
      key: _formKey,
      child: Column(
        children: [
          TextFormField(
            initialValue: name,
            decoration: InputDecoration(labelText: 'Name'),
            onChanged: (value) {
              setState(() {
                name = value;
              });
            },
            validator: (value) {
              if (value == null || value.isEmpty) {
                return 'Please enter a name';
              }
              return null;
            },
          ),
          TextFormField(
            initialValue: phone,
            decoration: InputDecoration(labelText: 'Phone'),
            onChanged: (value) {
              setState(() {
                phone = value;
              });
            },
            validator: (value) {
              if (value == null || value.isEmpty) {
                return 'Please enter a phone number';
              }
              return null;
            },
          ),
          TextFormField(
            initialValue: email,
            decoration: InputDecoration(labelText: 'Email'),
            onChanged: (value) {
              setState(() {
                email = value;
              });
            },
            validator: (value) {
              if (value == null || value.isEmpty) {
                return 'Please enter an email';
              }
              return null;
            },
          ),
          ElevatedButton(
            onPressed: () {
              if (_formKey.currentState!.validate()) {
                widget.onSave(name, phone, email);
              }
            },
            child: Text('Save Contact'),
          ),
        ],
      ),
    );
  }
}
