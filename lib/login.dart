import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return new MaterialApp(
      theme: new ThemeData(primaryColor: Colors.green),
      home: Scaffold(
        body: new LoginHomePage(),
      ),
    );
  }
}

class LoginHomePage extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return _LoginHomePageState();
  }
}

class _LoginHomePageState extends State<LoginHomePage> {
  @override
  Widget build(BuildContext context) {
    return Stack(
      children: <Widget>[
        Column(
          mainAxisSize: MainAxisSize.max,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: <Widget>[
            Container(
              color: Colors.white,
              alignment: Alignment.center,
              padding: EdgeInsets.only(top: 200.0, left: 30.0, right: 30.0),
              child: new Container(
                child: buildFrom(context),
              ),
            )
          ],
        )
      ],
    );
  }
}

TextEditingController nameController = new TextEditingController();
TextEditingController pwdController = new TextEditingController();
GlobalKey formKey = new GlobalKey<FormState>();

Widget buildFrom(BuildContext context) {
  return Form(
    key: formKey,
    autovalidate: true,
    child: Column(
      children: <Widget>[
        TextFormField(
          autofocus: false,
          keyboardType: TextInputType.number,
          textInputAction: TextInputAction.next,
          controller: nameController,
          decoration: InputDecoration(
              //labelText: "用户名或邮箱",
              hintText: "用户名或邮箱",
              icon: Icon(Icons.person)),
          validator: (v) {
            return v.trim().length > 0 ? null : "用户名不能为空";
          },
        ),
        TextFormField(
          autofocus: false,
          controller: pwdController,
          decoration: InputDecoration(
              //abelText: "密码",
              hintText: "您的登录密码",
              icon: Icon(Icons.lock)),
          obscureText: true,
          validator: (v) {
            return v.trim().length > 5 ? null : "密码不能少于5位";
          },
        ),
        Padding(
          padding: const EdgeInsets.only(top: 28.0),
          child: Row(
            children: <Widget>[
              Expanded(
                  child: RaisedButton(
                padding: EdgeInsets.all(15.0),
                child: Text("登录"),
                color: Theme.of(context).primaryColor,
                textColor: Colors.white,
                onPressed: () {
                  if ((formKey.currentState as FormState).validate()) {
                    Navigator.push(context, MaterialPageRoute(builder: (_) {
                      return HomePage();
                    }));
                  }
                },
              ))
            ],
          ),
        ),
      ],
    ),
  );
}

class HomePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Scaffold(
      appBar: AppBar(
        title: Text('Home Page'),
      ),
      body: Container(
        color: Colors.white,
        child: Center(
          child: Text('This Home Pahe'),
        ),
      ),
    );
  }
}
