import 'package:flutter/material.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'dart:math';
class login extends StatelessWidget {
  //const MyWidget({Key? key}) : super(key: key);
   var emaailcontroler=TextEditingController();
   var passcontroler=TextEditingController();
   var formKey=GlobalKey<FormState>();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: Icon(Icons.menu) ,
      ),
body:Padding(
        padding:const EdgeInsets.all(20), 
      child:Center(
      child:SingleChildScrollView(
      child:

      Form(
        key: formKey,
        child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
           crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text('login',
              style: TextStyle(
                fontSize: 40,
                fontWeight: FontWeight.bold,
              ),
              ),
              SizedBox(
               height: 40,
              ),
              TextFormField(
                controller: emaailcontroler,
                keyboardType:TextInputType.emailAddress ,
                decoration: InputDecoration(
                 // hintText: 'email adress',
                  labelText: 'Email Adress',
                  prefixIcon: Icon(
                    Icons.email,
                    ),
                  border: OutlineInputBorder(),
        
                ),
                onFieldSubmitted: ( value) {
                 print(value); 
                },
                 onChanged: (value) {
                  print(value);
                },
               validator: (value) {
                  if(value!.isEmpty)
                  {
                    return 'email address shouldnt be empty';
                  }
                  else
                  {
                     return null;
                  }
                },
              
              ),
              SizedBox(
                height: 15,
              ),
              TextFormField(
                controller:passcontroler,
               // keyboardType:TextInputType.emailAddress ,
                obscureText: true,//to hide the text in password label
                decoration: InputDecoration(
                 // hintText: 'email adress',
                  labelText: 'Your Password',
                  prefixIcon: Icon(
                    Icons.lock,
                    ),
                    suffixIcon:Icon(
                      Icons.remove_red_eye,
                    ),
                  border: OutlineInputBorder(),
        
                ),
                onFieldSubmitted: (value) {
                 print(value); 
                },
                validator: (value) {
                  if(value!.isEmpty){
                    return 'empty password';
                  }
                  else{
                  return null;
                  }
                },
               onChanged: (value) {
                  print(value);
                }
             ),
              SizedBox(
                height: 20,
              ),
/*       defaultButton(
                function:  (){
                if(formKey.currentState!.validate())
                {
                 print(emaailcontroler.text);
                 print(passcontroler.text);
                }
              },
             text: 'LOGIN', 
            ),*/
            
            Container(
                width: double.infinity,
                color:Colors.blue,
                child:
                 MaterialButton(onPressed: (){
                  print(emaailcontroler.text);
                  print(passcontroler.text);
                 },
                child: Text('LOGIN',
                 style: TextStyle(
                  color:Colors.white,
                 ),
                ),
                ),
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children:[
                  Text('don\'t have an email'),
                  TextButton(onPressed: (){},
                   child:
                   Text('register now'), 
                  ),
                ],
              ),
            ],
          ),
      ),
      ),
      ),
      ),
    );
    
  }
}

//the reusable component its provide:
//timing 
//refactor
//quality