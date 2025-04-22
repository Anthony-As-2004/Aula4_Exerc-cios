import 'package:flutter/material.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Exercício Formulário',
      home: FormPage(),
    );
  }
}

class FormPage extends StatefulWidget {
  @override
  State<FormPage> createState() => _FormPageState();
}

class _FormPageState extends State<FormPage> {
  final _formKey = GlobalKey<FormState>();
  String _nome = '';
  String _email = '';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Formulário')),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Form(
          key: _formKey,
          child: Column(
            children: [
              Row(
                children: [
                  Expanded(
                    child: TextFormField(
                      decoration: const InputDecoration(
                        labelText: 'Nome',
                      ),
                      onSaved: (value) => _nome = value ?? '',
                      validator: (value) {
                        if (value == null || value.isEmpty) {
                          return 'Insira seu nome';
                        }
                        return null;
                      },
                    ),
                  ),
                  const SizedBox(width: 16),
                  Expanded(
                    child: TextFormField(
                      decoration: const InputDecoration(
                        labelText: 'Email',
                      ),
                      onSaved: (value) => _email = value ?? '',
                      validator: (value) {
                        if (value == null || value.isEmpty) {
                          return 'Insira seu email';
                        }
                        return null;
                      },
                    ),
                  ),
                ],
              ),
              const SizedBox(height: 20),
              ElevatedButton(
                onPressed: () {
                  final form = _formKey.currentState!;
                  if (form.validate()) {
                    form.save();
                    ScaffoldMessenger.of(context).showSnackBar(
                      SnackBar(
                        content: Text('Nome: $_nome\nEmail: $_email'),
                      ),
                    );
                  }
                },
                child: const Text('Submit'),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
