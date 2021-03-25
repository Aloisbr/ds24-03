import 'package:dwm14/components/drawer.dart';
import 'package:flutter/material.dart';

class Connect extends StatelessWidget{

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('connect'),
      ),
      drawer: DrawerMenu(),
      body: SafeArea(
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              ConstrainedBox(
                constraints: BoxConstraints.tightFor(width: 200, height: 60),
                child: ElevatedButton(
                  onPressed: (){
                    Navigator.pushReplacementNamed(context, '/login');
                  },
                  style: ElevatedButton.styleFrom(
                    primary: Colors.purple,
                    textStyle: TextStyle(
                      fontSize: 25,
                    ),
                  ),
                  child: Text('Login'),
                ),
              ),
              SizedBox(
                height: 50,
              ),
              ConstrainedBox(
                constraints: BoxConstraints.tightFor(width: 200, height: 60),
                child: ElevatedButton(
                  onPressed: (){
                    Navigator.pushReplacementNamed(context, '/register');
                  },
                  style: ElevatedButton.styleFrom(
                    primary: Colors.purple,
                    textStyle: TextStyle(
                      fontSize: 25,
                    ),
                  ),
                  child: Text('Register'),
                ),
              ),

              SizedBox(
                height: 100,
              ),
            ],
          ),
        ),
      )
    );
  }
}
