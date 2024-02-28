import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../../models/user/shop_model/user/LoginShopModel.dart';
import '../../../../../shared/components/constants.dart';
import '../../../ShopHome/Cubit/Shop_cubit.dart';

class SettingsScreen extends StatelessWidget {
  const SettingsScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return  BlocConsumer<ShopCubit, ShopState>(
        listener: (context, state) {
        },
        builder: (context, state) {
          var nameController=TextEditingController();
          var emailController=TextEditingController();
          var phoneController=TextEditingController();

          ShopCubit cubit=ShopCubit.get(context);
          var userprofile=cubit.userData;
          nameController.text=userprofile!.data!.name!;
          emailController.text=userprofile!.data!.email!;
          phoneController.text=userprofile!.data!.phone!;

          return Scaffold(
            appBar: AppBar(title: Text('User Settings'),),
            body: Container(
              child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: Column(
                  children: [
                    TextFormField(
                      controller: nameController,
                      keyboardType:TextInputType.emailAddress,
                      validator: (value) {
                        if (value!.isEmpty) {
                          return 'Name can\'t be empty';
                        }
                        return null;
                      },
                      decoration: InputDecoration(
                        labelText:'User Name',
                        prefixIcon:Icon(Icons.person,),
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
                        prefixIcon:Icon(Icons.email,),
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
                      controller: phoneController,
                      keyboardType:TextInputType.emailAddress,
                      validator: (value) {
                        if (value!.isEmpty) {
                          return 'phone can\'t be empty';
                        }
                        return null;
                      },
                      decoration: InputDecoration(
                        labelText:'Phone',
                        prefixIcon:Icon(Icons.person,),
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
                    InkWell(
                      onTap: () {

                        cubit.update_fun(
                          name: nameController.text,
                          email: emailController.text,
                          phone: phoneController.text,
                          token: Token,
                        );

                      },
                      child: Container(
                        width: double.infinity,
                        height: 55,
                        decoration: BoxDecoration(
                          color: Colors.blue,
                        ),
                        child: Center(
                          child: Text(
                            'Update',
                            style: TextStyle(
                              fontSize: 24,
                              color: Colors.grey[300],
                              fontWeight: FontWeight.w800,
                            ),
                          ),
                        ),
                      ),
                    ),
                    SizedBox(
                      height: 15,
                    ),
                     Container(
                        width: double.infinity,
                        height: 55,
                        color: Colors.blue,
                        child: TextButton(onPressed:(){

                          LogoOut(context);
                        }, child: Text('Logout',
                        style: TextStyle(
                          fontSize: 24,
                          color: Colors.white,
                          fontWeight: FontWeight.w800,
                        ),
                        )),
                      ),
                    SizedBox(
                      height: 20,
                    ),

                  ],
                ),
              ),
            ),
          );
        });
  }
}
