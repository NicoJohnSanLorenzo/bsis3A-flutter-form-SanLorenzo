import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Mini Form',
      home: const MiniForm(),
      debugShowCheckedModeBanner: false,
    );
  }
}

class MiniForm extends StatefulWidget {
  const MiniForm({super.key});

  @override
  State<MiniForm> createState() => _MiniFormState();
}

class _MiniFormState extends State<MiniForm> {
  final _formKey = GlobalKey<FormState>();

  final TextEditingController nameController = TextEditingController();
  final TextEditingController messageController = TextEditingController();

  String submittedName = '';
  String submittedMessage = '';
  bool showPreview = false;

  void _submitForm() {
    if (_formKey.currentState!.validate()) {
      setState(() {
        submittedName = nameController.text;
        submittedMessage = messageController.text;
        showPreview = true;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        backgroundColor:  Colors.grey[100],
        elevation: 1,
        title: const Text('Mini Form', style: TextStyle(color: Colors.black),
        ),
        iconTheme: const IconThemeData(color: Colors.black),
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            Form(
              key: _formKey,
              child: Column(
                children: [
                  TextFormField(
                    controller: nameController,
                    decoration: const InputDecoration(
                      labelText: 'Full Name',
                      border: OutlineInputBorder(),
                    ),
                    validator: (value) {
                      if (value == null || value.isEmpty) {
                        return 'Required';
                      }
                      return null;
                    },
                  ),
                  const SizedBox(height: 12),
                  TextFormField(
                    controller: messageController,
                    maxLines: 3,
                    decoration: const InputDecoration(
                      labelText: 'Message',
                      border: OutlineInputBorder(),
                    ),
                    validator: (value) {
                      if (value == null || value.isEmpty) {
                        return 'Required';
                      }
                      return null;
                    },
                  ),
                ],
              ),
            ),
            const SizedBox(height: 16),
            ElevatedButton(
              style: ElevatedButton.styleFrom(
                padding: const EdgeInsets.symmetric(vertical: 14),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(8),
                                            ),
                                          ),
            onPressed: _submitForm,
              child: const Text('Submit'),
            ),
            const SizedBox(height: 20),

            // Preview Area
            if (showPreview)
              Card(
                elevation: 3,
                child: Padding(
                  padding: const EdgeInsets.all(16),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      const Text(
                        'Preview',
                        style: TextStyle(
                          fontSize: 18,
                          fontWeight: FontWeight.w600,
                        ),
                      ),
                      const SizedBox(height: 8),
                      Text('Name: $submittedName'),
                      const SizedBox(height: 4),
                      Text('Message: $submittedMessage'),
                    ],
                  ),
                ),
              ),
          ],
        ),
      ),
    );
  }
}
