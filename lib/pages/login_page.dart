import 'package:flutter/material.dart';

class LoginPage extends StatelessWidget {
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
    return Container(
      padding: EdgeInsets.all(16),
      child: ListView(
        children: <Widget>[
          TextFormField(
            style: TextStyle(
              fontSize: 25,
              color: Colors.blue,
            ),
            decoration: InputDecoration(
                labelText: "Login",
                labelStyle: TextStyle(
                  fontSize: 25,
                  color: Colors.grey,
                ),
                hintText: "Digite o login",
                hintStyle: TextStyle(
                  fontSize: 16,
                )),
          ),
          SizedBox(
            height: 10,
          ),
          TextFormField(
            style: TextStyle(
              fontSize: 25,
              color: Colors.blue,
            ),
            decoration: InputDecoration(
                labelText: "Senha",
                labelStyle: TextStyle(
                  fontSize: 25,
                  color: Colors.grey,
                ),
                hintText: "Digite a senha",
                hintStyle: TextStyle(
                  fontSize: 16,
                )),
            obscureText: true,
          ),
          SizedBox(
            height: 20,
          ),
          Container(
            height: 46,
            child: RaisedButton(
              color: Colors.blue,
              child: Text(
                "Login",
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 22,
                ),
              ),
              onPressed: () {},
            ),
          )
        ],
      ),
    );
  }
}
