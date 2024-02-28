import 'package:conditional_builder_null_safety/conditional_builder_null_safety.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:new_app/shared/components/components.dart';
import '../../../shared/components/constants.dart';
import '../Layout/LayoutScreen.dart';
import '../login/ShopLogin.dart';
import 'registercubit.dart';
import 'registerstate.dart';

class Registerscreen extends StatelessWidget {
  var emailcontroller = TextEditingController();
  var passwordcontroller = TextEditingController();
  var namecontroller = TextEditingController();
  var phonecontroller = TextEditingController();
  var formkey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => register_cubit(),
      child: BlocConsumer<register_cubit, register_state>(
        listener: (context, state) {
          if(state is register_success_state){
          if (state.registmodel.status!) {
            Token = state.registmodel.data!.token!;
            NavigationAndFinish(context, Shoplayout());
          }  else{
            print(state.registmodel.message);
          }
          }
        },
        builder: (context, state) {
          register_cubit cubit = register_cubit.get(context);
          return Scaffold(
            appBar: AppBar(),
            body: Center(
              child: SingleChildScrollView(
                child: Padding(
                  padding: const EdgeInsets.all(15.0),
                  child: Form(
                    key: formkey,
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          'register',
                          style: TextStyle(
                            fontSize: 35,
                            fontWeight: FontWeight.w800,
                          ),
                        ),
                        SizedBox(
                          height: 10,
                        ),
                        Text(
                          'register now to browse our hot offers',
                          style: TextStyle(
                            fontSize: 18,
                            fontWeight: FontWeight.w400,
                            color: Colors.blueGrey,
                          ),
                        ),
                        SizedBox(
                          height: 20,
                        ),
                        TextFormField(
                          controller: emailcontroller,
                          keyboardType: TextInputType.emailAddress,
                          decoration: InputDecoration(
                            label: Text('email'),
                            prefixIcon: Icon(
                              Icons.email,
                              color: Colors.cyan,
                            ),
                          ),
                          validator: (value) {
                            if (value!.isEmpty) {
                              return 'email can not be empity';
                            }
                            return null;
                          },
                        ),
                        SizedBox(
                          height: 20,
                        ),
                        TextFormField(
                          controller: namecontroller,
                          keyboardType: TextInputType.name,
                          decoration: InputDecoration(
                            label: Text('name'),
                            prefixIcon: Icon(
                              Icons.person,
                              color: Colors.cyan,
                            ),
                          ),
                          validator: (value) {
                            if (value!.isEmpty) {
                              return 'name can not be empity';
                            }
                            return null;
                          },
                        ),
                        SizedBox(
                          height: 20,
                        ),
                        TextFormField(
                          controller: phonecontroller,
                          keyboardType: TextInputType.phone,
                          decoration: InputDecoration(
                            label: Text('phone'),
                            prefixIcon: Icon(
                              Icons.phone,
                              color: Colors.cyan,
                            ),
                          ),
                          validator: (value) {
                            if (value!.isEmpty) {
                              return 'phone can not be empity';
                            }
                            return null;
                          },
                        ),
                        SizedBox(
                          height: 20,
                        ),
                        TextFormField(
                          controller: passwordcontroller,
                          keyboardType: TextInputType.text,
                          obscureText: cubit.isvisible ? false : true,
                          decoration: InputDecoration(
                            label: Text('password'),
                            prefixIcon: Icon(
                              Icons.lock,
                              color: Colors.cyan,
                            ),
                            suffixIcon: IconButton(
                              icon: Icon(
                                cubit.isvisible
                                    ? Icons.visibility_off
                                    : Icons.visibility,
                                color: Colors.cyan,
                              ),
                              onPressed: () {
                                cubit.changevisible();
                              },
                            ),
                          ),
                          validator: (value) {
                            if (value!.isEmpty) {
                              return 'password can not be empity';
                            }
                            return null;
                          },
                        ),
                        SizedBox(
                          height: 20,
                        ),
                        ConditionalBuilder(
                          condition: state is! register_loading_state,
                          builder: (context) => InkWell(
                            onTap: () {
                              if (formkey.currentState!.validate()) {
                                cubit.register(
                                    email: emailcontroller.text,
                                    password: passwordcontroller.text,
                                  name: namecontroller.text,
                                  phone: phonecontroller.text,
                                );
                              }
                            },
                            child: Container(
                              width: double.infinity,
                              height: 55,
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(15),
                                color: Colors.cyan,
                              ),
                              child: Center(
                                child: Text(
                                  'register',
                                  style: TextStyle(
                                    fontSize: 25,
                                    color: Colors.grey[300],
                                    fontWeight: FontWeight.w800,
                                  ),
                                ),
                              ),
                            ),
                          ),
                          fallback: (context) =>
                              Center(child: CircularProgressIndicator()),
                        ),
                        SizedBox(
                          height: 20,
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Text(
                              ' have an account ?',
                              style: TextStyle(
                                fontSize: 15,
                                color: Colors.black,
                                fontWeight: FontWeight.w600,
                              ),
                            ),
                            SizedBox(
                              width: 10,
                            ),
                            TextButton(
                              onPressed: () {
                                Navigator.pushAndRemoveUntil(
                                    context,
                                    MaterialPageRoute(
                                        builder: (context) => ShopLogin()),
                                    (route) => false);
                              },
                              child: Text(
                                'Log in',
                                style: TextStyle(
                                  fontSize: 15,
                                  color: Colors.cyan,
                                  fontWeight: FontWeight.w600,
                                ),
                              ),
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
        },
      ),
    );
  }
}
