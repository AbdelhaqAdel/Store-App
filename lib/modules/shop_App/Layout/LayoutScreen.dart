import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../../shared/components/constants.dart';
import '../../../shared/network/local/cache_helper.dart';
import '../ShopHome/Cubit/Shop_cubit.dart';
import '../ShopScreens/SearchScreen/ShopSearchScreen.dart';
class Shoplayout extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return BlocProvider(

      create: (BuildContext context) => ShopCubit()..GetHomeData(token: Token)..GetcategoriesData(token: Token)..GetFavoritesDatal(token: Token)..GetUserData(token: Token),
      child: BlocConsumer<ShopCubit, ShopState>(
          listener: (context, state) {
          },
          builder: (context, state) {
            ShopCubit cubit=ShopCubit.get(context);
            return Scaffold(

              appBar: AppBar(
                title: Text('Salla'),
                actions: [IconButton(onPressed: (){

                  Navigator.push(context, MaterialPageRoute(builder: (context) => ShopSearchScreen(),));
                  print(Token);
                   print('/////////////////////////////');
                }, icon: Icon(Icons.search))],
              ),
              bottomNavigationBar: BottomNavigationBar(
                currentIndex:cubit.NavBar_index ,
                onTap: (index){
                  cubit.NavBar_M(index: index);
                },
                items: [
                  BottomNavigationBarItem(icon: Icon(Icons.home),label: 'Home'),
                  BottomNavigationBarItem(icon: Icon(Icons.category),label: 'Category'),
                  BottomNavigationBarItem(icon: Icon(Icons.favorite),label: 'Favorites'),
                  BottomNavigationBarItem(icon: Icon(Icons.settings),label: 'Setting'),
                ],
              ),
              body: cubit.NavBar[cubit.NavBar_index],
            );
          }),
    );

  }
}
