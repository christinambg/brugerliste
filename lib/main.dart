import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:brugerliste/Bruger.dart';
import 'package:brugerliste/Loading.dart';

void main() {
  runApp(new MaterialApp(
    initialRoute: '/Loading',

    routes: {
      '/Loading': (context) => LoadingScreen(),
      '/home': (context) => Home(),
      '/adminIndstillinger': (context) => AdminIndstillinger(),
    },
  ));
}

class Home extends StatefulWidget {
  const Home({Key? key}) : super(key: key);

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {

  final _formKey = GlobalKey<FormState>();
  final _codeKey1 = GlobalKey<FormState>();
  final _codeKey2 = GlobalKey<FormState>();
  final _codeKey3 = GlobalKey<FormState>();
  final myController1 = TextEditingController();
  final myController2 = TextEditingController();
  final myController3 = TextEditingController();
  var admin = "Press to add admin";
  var kode ;
  var firstTimeLoggingIn=0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(

      backgroundColor: Colors.green[100],
      appBar: AppBar(
        title: Text('List over residents'),
        backgroundColor: Colors.green[200],
      ),

      body: Row(

        mainAxisAlignment: MainAxisAlignment.center,

        children: [
          SizedBox(
            height: 100,
          ),

          FlatButton(
            onPressed: () {
              if (firstTimeLoggingIn==0) {
                showDialog(context: context, builder: (BuildContext) {
                  return AlertDialog(
                    content: Stack(
                      clipBehavior: Clip.none, children: <Widget>[
                      Positioned(
                        top: -35.0,
                        right: 235.0,
                        child: InkResponse(
                          onTap: () {
                            Navigator.of(context).pop();
                          },
                          child: CircleAvatar(
                            child: Icon(
                              Icons.close,
                              color: Colors.green[100],
                            ),
                            backgroundColor: Colors.green[300],
                          ),
                        ),
                      ),
                      Form(
                        key: _formKey,
                        child: Column(
                          mainAxisSize: MainAxisSize.min,
                          children: <Widget>[
                            Padding(
                              padding: EdgeInsets.all(8.0),
                              child: Text('Create a 4-digit code:'),
                            ),
                            Padding(
                              padding: EdgeInsets.all(8.0),
                              child: TextFormField(
                                key: _codeKey1,
                                controller: myController1,
                                decoration: InputDecoration(
                                    labelText: 'Enter code'),
                                keyboardType: TextInputType.number,
                                inputFormatters: [
                                  FilteringTextInputFormatter.digitsOnly
                                ],
                              ),
                            ),
                            Padding(
                              padding: EdgeInsets.all(8.0),
                              child: TextFormField(
                                key: _codeKey2,
                                controller: myController2,
                                decoration: InputDecoration(
                                    labelText: 'Enter code again'),
                                keyboardType: TextInputType.number,
                                inputFormatters: [
                                  FilteringTextInputFormatter.digitsOnly
                                ],

                              ),
                            ),
                            Padding(
                              padding: const EdgeInsets.all(8.0),
                              child: RaisedButton(
                                  child: Text(
                                    "Done",
                                    style: TextStyle(
                                        color: Colors.green[900]
                                    ),
                                  ),
                                  color: Colors.green[100],
                                  onPressed: () {
                                    if (myController1.text ==
                                        myController2.text) {

                                      //navigér til næste viindue
                                      //ellers så kom med en "hov koden var ikke den samme" besked
                                      admin = "Admin-profile";
                                      firstTimeLoggingIn+=1;
                                      kode = myController1.text;
                                      print('kode' + kode);
                                      myController1.clear();
                                      myController2.clear();
                                      Navigator.pushNamed(
                                          context, '/adminIndstillinger');
                                    }
                                  }
                              ),
                            ),

                          ],
                        ),
                      ),
                    ],
                    ),
                  );
                });
              }
              else{
                showDialog(context: context, builder: (BuildContext) {
                  return AlertDialog(
                    content: Stack(
                      clipBehavior: Clip.none, children: <Widget>[
                      Positioned(
                        top: -35.0,
                        right: 235.0,
                        child: InkResponse(
                          onTap: () {
                            Navigator.of(context).pop();
                          },
                          child: CircleAvatar(
                            child: Icon(
                              Icons.close,
                              color: Colors.green[100],
                            ),
                            backgroundColor: Colors.green[300],
                          ),
                        ),
                      ),
                      Form(
                        key: _formKey,
                        child: Column(
                          mainAxisSize: MainAxisSize.min,
                          children: <Widget>[
                            Padding(
                              padding: EdgeInsets.all(8.0),
                              child: Text('Enter admin-code'),
                            ),
                            Padding(
                              padding: EdgeInsets.all(8.0),
                              child: TextFormField(
                                key: _codeKey3,
                                controller: myController3,
                                decoration: InputDecoration(
                                    labelText: 'Enter code'),
                                keyboardType: TextInputType.number,
                                inputFormatters: [
                                  FilteringTextInputFormatter.digitsOnly
                                ],
                              ),
                            ),

                            Padding(
                              padding: const EdgeInsets.all(8.0),
                              child: RaisedButton(
                                  child: Text(
                                    "Done",
                                    style: TextStyle(
                                        color: Colors.green[900]
                                    ),
                                  ),
                                  color: Colors.green[100],
                                  onPressed: () {
                                    if (myController3.text ==
                                        kode) {

                                      myController3.clear();
                                      //navigér til næste viindue
                                      //ellers så kom med en "hov koden var ikke den samme" besked
                                      Navigator.pushNamed(
                                          context, '/adminIndstillinger');
                                    }
                                    else{
                                      print('con3: '+ myController3.text + ' kode: ' + kode);
                                    }
                                  }
                              ),
                            ),

                          ],
                        ),
                      ),
                    ],
                    ),
                  );
                });

              }

            },

            child: Text(
              admin,
            ),
            minWidth: 350,
            height: 70,
            color: Colors.green[300],

          ),
        ],
      ),
    );
  }

}

class AdminIndstillinger extends StatefulWidget {
  const AdminIndstillinger({Key? key}) : super(key: key);



  @override
  State<AdminIndstillinger> createState() => _AdminIndstillingerState();
}

class _AdminIndstillingerState extends State<AdminIndstillinger> {

  final _formKeyAdmin = GlobalKey<FormState>();
  final _codeKeyAdmin1 = GlobalKey<FormState>();
  final _codeKeyAdmin2 = GlobalKey<FormState>();
  final myControllerAdmin1 = TextEditingController();
  final myControllerAdmin2 = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(

      backgroundColor: Colors.green[100],
      appBar: AppBar(
        title: Text('Admin-instillinger'),
        backgroundColor: Colors.green[200],


      ),
      body: Row(

          mainAxisAlignment: MainAxisAlignment.center,

          children: [
            SizedBox(
              height: 100,
            ),

            FlatButton(
              onPressed: () {},
              child: Text(
                  'Add a resident'
              ),
              minWidth: 350,
              height: 70,
              color: Colors.green[300],

            ),
          ]
      ),
    );
  }
}






