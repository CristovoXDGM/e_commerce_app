import 'package:flutter/material.dart';
import 'package:loja_virtual_app/models/user_model.dart';
import 'package:loja_virtual_app/screens/signup_screen.dart';
import 'package:scoped_model/scoped_model.dart';

class Login_Screen extends StatelessWidget {
  // const Login_Screen({Key key}) : super(key: key);
  final _formkey = GlobalKey<FormState>();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Entrar"),
        centerTitle: true,
        actions: <Widget>[
          FlatButton(
            child: Text(
              "Criar conta",
              style: TextStyle(fontSize: 15),
            ),
            textColor: Colors.white,
            onPressed: () {
              Navigator.of(context).pushReplacement(
                  MaterialPageRoute(builder: (context) => SignUpScreen()));
            },
          )
        ],
      ),
      body: ScopedModelDescendant<UserModel>(
        builder: (contex, child, model) {
          if (model.isLoading)
            return Center(
              child: CircularProgressIndicator(),
            );
          return Form(
            key: _formkey,
            child: ListView(
              padding: EdgeInsets.all(16),
              children: <Widget>[
                TextFormField(
                  decoration: InputDecoration(hintText: "E-mail"),
                  keyboardType: TextInputType.emailAddress,
                  validator: (text) {
                    if (text == "" || !text.contains("@")) {
                      return "E-mail inválido";
                    }
                  },
                ),
                SizedBox(
                  height: 16,
                ),
                TextFormField(
                  obscureText: true,
                  decoration: InputDecoration(
                    hintText: "Senha",
                  ),
                  validator: (text) {
                    if (text == "" || text.length < 6) {
                      return "Senha inválida";
                    }
                  },
                ),
                Align(
                  alignment: Alignment.centerRight,
                  child: FlatButton(
                    padding: EdgeInsets.zero,
                    child: Text(
                      "Esqueci minha senha",
                      textAlign: TextAlign.right,
                    ),
                    onPressed: () {},
                  ),
                ),
                SizedBox(
                  height: 16,
                ),
                SizedBox(
                  height: 44,
                  child: RaisedButton(
                    child: Text(
                      "Entrar",
                      style: TextStyle(
                        fontSize: 18,
                      ),
                    ),
                    textColor: Colors.white,
                    color: Theme.of(context).primaryColor,
                    onPressed: () {
                      if (_formkey.currentState.validate()) {}
                    },
                  ),
                )
              ],
            ),
          );
        },
      ),
    );
  }
}