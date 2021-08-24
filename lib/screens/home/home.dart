import 'package:email_validator/email_validator.dart';
import 'package:flutter/material.dart';
import 'package:student_registration/models/studen.dart';
import 'package:student_registration/repository/student/studentdb_repository.dart';

class Home extends StatefulWidget {
  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {
  final _registerController = TextEditingController();
  final _nameController = TextEditingController();
  final _emailController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Cadastro de Alunos"),
      ),
      body: SingleChildScrollView(
        child: Container(
          margin: EdgeInsets.all(
            16,
          ),
          child: Column(
            children: [
              TextField(
                decoration: InputDecoration(
                  labelText: "Matrícula do aluno:",
                  border: OutlineInputBorder(),
                ),
                keyboardType: TextInputType.number,
                controller: _registerController,
              ),
              SizedBox(
                height: 5,
              ),
              TextField(
                decoration: InputDecoration(
                  labelText: "Nome do aluno:",
                  border: OutlineInputBorder(),
                ),
                keyboardType: TextInputType.name,
                controller: _nameController,
              ),
              SizedBox(
                height: 5,
              ),
              TextField(
                decoration: InputDecoration(
                  labelText: "Email do aluno:",
                  border: OutlineInputBorder(),
                ),
                keyboardType: TextInputType.emailAddress,
                controller: _emailController,
              ),
              SizedBox(
                height: 20,
              ),
              ElevatedButton(
                onPressed: saveRegister,
                child: Text("Cadastrar aluno"),
              ),
            ],
          ),
        ),
      ),
    );
  }

  void saveRegister() async {
    String name = _nameController.text;
    String email = _emailController.text;
    String message;

    if (!EmailValidator.validate(email)) {
      showDialog(
        context: context,
        builder: (context) => AlertDialog(
          title: Text("Mensagem do sistema"),
          content: Text("Email inválido!!!"),
          actions: [
            TextButton(
              onPressed: () {
                Navigator.of(context).pop();
              },
              child: Text("OK"),
            ),
          ],
        ),
      );
    } else {
      var student = Student(
        name: name,
        email: email,
      );

      var repository = StudentDBRepository();

      int id = await repository.insert(student);

      if (id != 0) {
        message = "Tudo certo!!!";
      } else {
        message = "Deu ruim!!!";
      }

      showDialog(
        context: context,
        builder: (context) => AlertDialog(
          title: Text("Mensagem do sistema"),
          content: Text(message),
          actions: [
            TextButton(
              onPressed: () {
                Navigator.of(context).pop();
              },
              child: Text("OK"),
            ),
          ],
        ),
      );
    }
  }
}
