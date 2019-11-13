import 'package:cars/pages/home_page.dart';
import 'package:cars/pages/login_api.dart';
import 'package:cars/utils/nav.dart';
import 'package:cars/widgets/app_button.dart';
import 'package:cars/widgets/app_text.dart';
import 'package:flutter/material.dart';

class LoginPage extends StatefulWidget {
  @override
  _LoginPageState createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  final _formKey = GlobalKey<FormState>();

  final _tLogin = TextEditingController();

  final _tSenha = TextEditingController();

  final _focusSenha = FocusNode();

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    var scaffold = Scaffold(
      appBar: AppBar(
        title: Text("Carros"),
        centerTitle: true,
      ),
      body: _body(),
    );
    return scaffold;
  }

  _body() {
    return Form(
      key: _formKey,
      child: Container(
        padding: EdgeInsets.all(16),
        child: ListView(
          children: <Widget>[
            AppText("Login", "Digite o login",
                controller: _tLogin,
                validator: _validatorLogin,
                keyboardType: TextInputType.emailAddress,
                textInputAction: TextInputAction.next,
                nextFocus: _focusSenha),
            SizedBox(
              height: 10,
            ),
            AppText(
              "Senha",
              "Digite a senha",
              password: true,
              controller: _tSenha,
              validator: _validatorSenha,
              keyboardType: TextInputType.number,
              focusNode: _focusSenha,
            ),
            SizedBox(
              height: 20,
            ),
            AppButton("Login", onPressed: _onClickLogin)
          ],
        ),
      ),
    );
  }

  _onClickLogin() async {
    if (!_formKey.currentState.validate()) {
      return;
    }

    String login = _tLogin.text;
    String senha = _tSenha.text;

    print("Login: $login, Senha: $senha");

    bool ok = await LoginApi.login(login, senha);

    if (ok) {
      push(context, HomePage());
    } else {
      print("Login incorreto");
    }
  }

  String _validatorLogin(String text) {
    if (text.isEmpty) {
      return "Digite o login";
    }
    return null;
  }

  String _validatorSenha(String text) {
    if (text.isEmpty) {
      return "Digite a senha";
    }
    if (text.length < 3) {
      return "A senha precisa ter no minimo 3 digitos";
    }
    return null;
  }
}
