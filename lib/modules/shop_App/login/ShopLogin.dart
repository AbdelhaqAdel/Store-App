import 'package:conditional_builder_null_safety/conditional_builder_null_safety.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:fluttertoast/fluttertoast.dart';

import '../../../shared/components/components.dart';
import '../../../shared/components/constants.dart';
import '../Register/Registerscreen.dart';
import '../Layout/LayoutScreen.dart';
import 'cubit/cubit/login_cubit.dart';

class ShopLogin extends StatelessWidget {
  var emailController = TextEditingController();
  var passwordController = TextEditingController();
  var formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (BuildContext context) => LoginCubit(),
      child: BlocConsumer<LoginCubit, ShopLoginState>(
          listener: (context, state) {
            if(state is shopLoginSuccessState){
              if(state.loginmodel.status!){
                  Token = state.loginmodel.data!.token!;
                  NavigationAndFinish(context, Shoplayout());
              }
              else{
                print(state.loginmodel.message);
              }
            }
          },
          builder: (context, state) {
            return Scaffold(
              appBar: AppBar(),
              body: Center(
                child: SingleChildScrollView(
                  child: Padding(
                    padding: const EdgeInsets.all(20.0),
                    child: Form(
                      key: formKey,
                      child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              'Login',
                              style: Theme.of(context)
                                  .textTheme
                                  .headline4
                                  ?.copyWith(color: Colors.black),
                            ),
                            SizedBox(
                              height: 20,
                            ),
                            Text(
                              'Login now to browse a hot offers',
                              style: Theme.of(context)
                                  .textTheme
                                  .bodyText1
                                  ?.copyWith(
                                    color: Colors.grey,
                                  ),
                            ),
                            SizedBox(
                              height: 40,
                            ),
                            TextFormField(
                              controller: emailController,
                              keyboardType:TextInputType.emailAddress,
                              validator: (value) {
                                if (value!.isEmpty) {
                                  return 'Email can\'t be empty';
                                }
                                return null;
                              },
                              decoration: InputDecoration(
                                labelText:'Email Address',
                                prefixIcon:Icon(Icons.email_outlined,),
                                suffixIcon: Icons.email_outlined !=null ? IconButton(onPressed: (){
                                },
                                  icon: Icon(Icons.email_outlined,),
                                ):null,
                                border: OutlineInputBorder(),
                              ),
                            ),
                            SizedBox(
                              height: 15,
                            ),
                            TextFormField(
                              controller: passwordController,
                              keyboardType:TextInputType.emailAddress,
                              obscureText: LoginCubit.get(context).ispassowrdShown,
                              validator: (value) {
                                if (value!.isEmpty) {
                                  return 'Password can\'t be empty';
                                } else
                                  return null;
                              },
                              decoration: InputDecoration(
                                labelText:'Password',
                                prefixIcon:Icon(LoginCubit.get(context).suffix,),
                                suffixIcon: LoginCubit.get(context).suffix !=null ? IconButton(onPressed: (){
                                  LoginCubit.get(context)
                                      .changePasswordVisibility();
                                },
                                  icon: Icon(LoginCubit.get(context).suffix,),
                                ):null,
                                border: OutlineInputBorder(),
                              ),
                              // onSubmit: (value) {
                              //   if (_formKey.currentState!.validate()) {
                              //     LoginCubit.get(context).UserLogin(
                              //       email: emailController.text,
                              //       password: passwordController.text,
                              //     );
                              //   }
                              // },
                            ),
                            SizedBox(
                              height: 30,
                            ),

                            ConditionalBuilder(
                              condition: state is! shopLoginLoadingState,
                              builder: (context) => defaultButton(
                                function: () {
                                  if (formKey.currentState!.validate()) {
                                    LoginCubit.get(context).UserLogin(
                                        email: emailController.text,
                                        password: passwordController.text);
                                  }
                                },
                                text: 'login',
                                isUPpercase: true,
                              ),
                              fallback: (context) =>
                                  Center(child: CircularProgressIndicator()),
                            ),
                            SizedBox(
                              height: 15,
                            ),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Text(
                                  'Don\'t have an account?',
                                ),
                                defaultTextButton(
                                    function: () {
                                      NavigateTo(context, Registerscreen());
                                    },
                                    text: 'register now'),
                              ],
                            ),
                          ]),
                    ),
                  ),
                ),
              ),
            );
          }),
    );
  }
}
