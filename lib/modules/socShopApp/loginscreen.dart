import 'package:conditional_builder_null_safety/conditional_builder_null_safety.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:fluttertoast/fluttertoast.dart';

import '../../network/local/SharedPreferences.dart';
import '../shop_App/Layout/LayoutScreen.dart';
import 'Registerscreen.dart';
import 'loginCubit.dart';
import 'loginState.dart';

class LoginScreen extends StatelessWidget {
  var emailcontroller = TextEditingController();
  var passwordcontroller = TextEditingController();
  var formkey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => login_cubit(),
      child: BlocConsumer<login_cubit, login_state>(
        listener: (context, state) {

          if(state is login_success_state)
            {
              if(state.loginmodel!.status!){
                print(state.loginmodel?.message);
                print(state.loginmodel?.data?.token);
                print("________________________________________________");
                CachHelper.saveData(key: 'token', value: state.loginmodel?.data?.token);

                Navigator.pushAndRemoveUntil(context, MaterialPageRoute(builder: (context) => Shoplayout(),), (route) => false);
              }
              else
                {
                  print(state.loginmodel?.message);
                  print("________________________________________________");

                  Fluttertoast.showToast(
                      msg: '${state.loginmodel?.message}',
                      toastLength: Toast.LENGTH_LONG,
                      gravity: ToastGravity.BOTTOM,
                      timeInSecForIosWeb: 5,
                      backgroundColor: Colors.red,
                      textColor: Colors.black,
                      fontSize: 16.0
                  );
                }
            }

        },
        builder: (context, state) {
          login_cubit cubit = login_cubit.get(context);
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
                          'Login',
                          style: TextStyle(
                            fontSize: 35,
                            fontWeight: FontWeight.w800,
                          ),
                        ),
                        SizedBox(
                          height: 10,
                        ),
                        Text(
                          'Login now to browse our hot offers',
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
                          controller: passwordcontroller,
                          keyboardType: TextInputType.text,
                          obscureText: cubit.isvisible?false: true,
                          decoration: InputDecoration(
                            label: Text('password'),
                            prefixIcon: Icon(
                              Icons.lock,
                              color: Colors.cyan,
                            ),

                            suffixIcon: IconButton(
                              icon: Icon(
                                cubit.isvisible?Icons.visibility_off:Icons.visibility,
                                color: Colors.cyan,
                              ),
                              onPressed: () {
                                cubit.changevisible();
                              },
                            ),
                          ),
                          onFieldSubmitted: (value) {
                            if (formkey.currentState!.validate()) {
                              cubit.login(
                                  email: emailcontroller.text,
                                  password: passwordcontroller.text,context: context);
                            }
                          },
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
                          condition: state is! login_loading_state,
                          builder: (context) => InkWell(
                            onTap: () {
                              if (formkey.currentState!.validate()) {
                                cubit.login(
                                    email: emailcontroller.text,
                                    password: passwordcontroller.text,context: context);
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
                                  'Login',
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
                              'Do not have an account ?',
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

                                Navigator.push(
                                    context,
                                    MaterialPageRoute(
                                      builder: (context) => Registerscreen(),
                                    ));
                              },
                              child: Text(
                                'Register',
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
