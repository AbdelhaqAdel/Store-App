import 'package:conditional_builder_null_safety/conditional_builder_null_safety.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../network/local/SharedPreferences.dart';
import '../../shared/Const.dart';
import '../../shared/Cubit/Shop_cubit.dart';
import '../../shared/Cubit/Shop_state.dart';
import '../login/loginscreen.dart';

class S4 extends StatelessWidget {
  TextEditingController? emailcontroller = TextEditingController();
  TextEditingController? namecontroller = TextEditingController();
  TextEditingController? phonecontroller = TextEditingController();
  var x;

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<Shop_cubit, Shop_state>(
      listener: (context, state) => {},
      builder: (context, state) {
        Shop_cubit cubit = Shop_cubit.get(context);

        if(cubit.profilemodelo?.data !=null){
          x = cubit.profilemodelo?.data?.email;
          emailcontroller?.text = x;
          x = cubit.profilemodelo?.data?.name;
          namecontroller?.text = x;
          x = cubit.profilemodelo?.data?.phone;
          phonecontroller?.text = x;
        }

        return ConditionalBuilder(
          condition: cubit.profilemodelo != null,
          builder: (context) => Scaffold(
            appBar: AppBar(),
            body: Padding(
              padding: const EdgeInsets.all(15.0),
              child: Column(
                children: [
                  TextFormField(
                    controller: namecontroller,
                    decoration: InputDecoration(
                      label: Text('name'),
                      prefixIcon: Icon(
                        Icons.person,
                        color: Colors.cyan,
                      ),
                    ),
                  ),
                  SizedBox(
                    height: 20,
                  ),
                  TextFormField(
                    controller: emailcontroller,
                    decoration: InputDecoration(
                      label: Text('email'),
                      prefixIcon: Icon(
                        Icons.email,
                        color: Colors.cyan,
                      ),
                    ),
                  ),
                  SizedBox(
                    height: 20,
                  ),
                  TextFormField(
                    controller: phonecontroller,
                    decoration: InputDecoration(
                      label: Text('phone'),
                      prefixIcon: Icon(
                        Icons.phone,
                        color: Colors.cyan,
                      ),
                    ),
                  ),
                  SizedBox(
                    height: 20,
                  ),
                  InkWell(
                    onTap: () {

                      cubit.update_fun(
                          name: namecontroller?.text,
                          email: emailcontroller?.text,
                          phone: phonecontroller?.text,
                        token: token,
                      );

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
                          'Update',
                          style: TextStyle(
                            fontSize: 25,
                            color: Colors.grey[300],
                            fontWeight: FontWeight.w800,
                          ),
                        ),
                      ),
                    ),
                  ),
                  SizedBox(
                    height: 20,
                  ),
                  InkWell(
                    onTap: () {


                      CachHelper.removedata(key: 'token').then((value) {
                        Navigator.pushAndRemoveUntil(
                            context,
                            MaterialPageRoute(
                              builder: (context) => LoginScreen(),
                            ),
                            (route) => false);

                      });
                      token=null;
                      cubit.favorites={};
                      cubit.favoomoodel=null;
                      cubit.homedata=null;
                      cubit.favmoodel=null;
                      cubit.catogerymodel=null;
                      cubit.NavBar_index=0;







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
                          'Sign Out',
                          style: TextStyle(
                            fontSize: 25,
                            color: Colors.grey[300],
                            fontWeight: FontWeight.w800,
                          ),
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
          fallback: (context) => Center(child: CircularProgressIndicator()),
        );
      },
    );
  }
}
