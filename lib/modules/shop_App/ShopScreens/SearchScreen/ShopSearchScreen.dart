import 'package:conditional_builder_null_safety/conditional_builder_null_safety.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:new_app/models/user/shop_model/SearchModel.dart';
import 'package:new_app/modules/shop_App/ShopHome/Cubit/Shop_cubit.dart';
import 'package:new_app/shared/components/constants.dart';

import '../../../../models/Seachmodel.dart';
import 'Cubit/cubit/search_cubit.dart';
class ShopSearchScreen extends StatelessWidget {
  var searchcotroller = TextEditingController();

  @override
  Widget build(BuildContext context) {

    return BlocProvider(
      create: (BuildContext context) => SearchCubit() ,
      child: BlocConsumer<SearchCubit, SearchState>(
    listener: (context, state) => {},
    builder: (context, state) {
      SearchCubit cubit = SearchCubit.get(context);
      return Scaffold(

        body: SafeArea(
          child: Padding(
            padding: const EdgeInsets.all(15.0),
            child: Column(
              children: [
                Row(
                  children: [
                    IconButton(onPressed: (){
                      Navigator.pop(context);
                      cubit.searchModel=null;
                    }, icon: Icon(CupertinoIcons.back)),
                    Spacer(),
                  ],
                ),
                Container(
                  child: TextField(
                    maxLines: 1,
                    decoration: InputDecoration(
                      label: Text('Search'),
                      prefixIcon: Icon(Icons.search),
                    ),
                    controller: searchcotroller,
                    onSubmitted: (value){
                      searchcotroller.text=value;
                      cubit.SearchProduct(Text: value);
                    },
                  ),
                ),
                SizedBox(
                  height: 20,
                ),
                ConditionalBuilder(
                  condition: state is! shopSearchLoadingState,
                  builder: (context) =>  Expanded(
                    child: GridView.count(
                      shrinkWrap: true,
                     //physics:  NeverScrollableScrollPhysics(),
                      crossAxisCount: 2,
                      mainAxisSpacing: 10.0,
                      crossAxisSpacing: 10,
                      childAspectRatio: 1 / 1.36,

                      children: List.generate(
                        cubit.searchModel?.data?.data?.length ?? 0,
                            (index) => buildsearch(
                          product: cubit.searchModel!.data!.data![index],
                          context: context,
                        ),
                      ), // List.generate
                    ),
                  ),
                  fallback:(context) => Center(child: LinearProgressIndicator()),
                ),

              ],
            ),
          ),
        ),
      );
    }),
    );


  }
}

Widget buildsearch({
  required datum_search product,
  required context,
}) =>
    Container(
      color: Colors.white,
      child: Column(
        children: [
          Stack(
            alignment: Alignment.bottomLeft,
            children: [
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Image(
                  image: NetworkImage('${product?.image}'),
                  height: 160,
                  width: double.infinity,
                  fit: BoxFit.fill,
                ),
              ),

            ],
          ),
          const SizedBox(
            height: 10,
          ),
          Expanded(
              child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 10.0),
                child: Text(
                  '${product?.name}',
                  textAlign: TextAlign.start,
                  maxLines: 1,
                  overflow: TextOverflow.ellipsis,
                  style: const TextStyle(
                    fontSize: 17,
                    fontWeight: FontWeight.w700,
                  ),
                ),
              )),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 4.0),
            child: Row(
              children: [
                const SizedBox(width: 8),
                Text(
                  '${product?.price} E',
                  style: const TextStyle(
                    fontSize: 17,
                    fontWeight: FontWeight.w600,
                    color: Colors.cyan,
                  ),
                ),
                const SizedBox(
                  width: 10,
                ),
                const Spacer(),
                // IconButton(
                //     onPressed: () {
                //       ShopCubit.get(context).ChangeFav(productId: product?.id);
                //     },
                //     icon: Icon(
                //       Icons.favorite_border,
                //       color:
                //       ShopCubit.get(context).favoraties?[product?.id] == true
                //           ? Colors.red
                //           : Colors.black,
                //     )),
              ],
            ),
          ),
        ],
      ),
    );




// import 'package:conditional_builder_null_safety/conditional_builder_null_safety.dart';
// import 'package:flutter/cupertino.dart';
// import 'package:flutter/material.dart';
// import 'package:flutter_bloc/flutter_bloc.dart';
//
// import '../../../../models/user/shop_model/GetFavoritesModel.dart';
// import '../../ShopHome/Cubit/Shop_cubit.dart';
//
// class ShopSearchScreen extends StatelessWidget {
//   var searchController=TextEditingController();
//  var formKey=GlobalKey<FormState>();
//   @override
//   Widget build(context) {
//     return  BlocConsumer<ShopCubit, ShopState>(
//       listener: (context, state) => {},
//       builder: (context, state) {
//         ShopCubit cubit = ShopCubit.get(context);
//         return Scaffold(
//           appBar: AppBar(),
//           body:SafeArea(
//             child: Form(
//               key: formKey,
//               child: Column(
//                 children: [
//                   Padding(
//                     padding: const EdgeInsets.all(8.0),
//                     child: TextFormField(
//                       controller: searchController,
//                       keyboardType:TextInputType.text,
//                       validator: (value) {
//                         if (value!.isEmpty) {
//                           return 'search';
//                         }
//                         return null;
//                       },
//                       decoration: InputDecoration(
//                         labelText:'Search here',
//                         prefixIcon:Icon(Icons.search,),
//                         suffixIcon: Icons.search !=null ? IconButton(onPressed: (){
//                         },
//                           icon: Icon(Icons.search,),
//                         ):null,
//                         border: OutlineInputBorder(),
//                       ),
//                       onFieldSubmitted:(text){
//                         searchController.text=text;
//                         cubit.SearchProduct(Text: text);
//                       },
//                     ),
//                   ),
//
//                 ],
//               ),
//             ),
//           )
//           // SingleChildScrollView(
//           //   child: ConditionalBuilder(
//           //     condition: state is !shopGetFavLoadingState,
//           //
//           //     builder:(context)=> GridView.count(
//           //       shrinkWrap: true,
//           //       physics: const NeverScrollableScrollPhysics(),
//           //
//           //       crossAxisCount: 2,
//           //       mainAxisSpacing:1,
//           //       crossAxisSpacing:1,
//           //       childAspectRatio: 1/1.5,
//           //       children: List.generate(
//           //         cubit.getFavoritesModel?.data?.data?.length??0,
//           //             (index) =>
//           //             BuildProductGrid(cubit.getFavoritesModel?.data?.data?[index].product,context),
//           //       ), // List.generate
//           //     ),
//           //     fallback:(context)=> Center(child:CircularProgressIndicator() ,),
//           //   ),
//           // ),
//
//         );
//       },
//     );
//   }
//
//   // Widget BuildProductGrid(Product? product,context)=>Container(
//   //
//   //   decoration: BoxDecoration(
//   //     color: Colors.white,
//   //   ),
//   //   width: 200,
//   //   child: Padding(
//   //     padding: const EdgeInsets.all(8.0),
//   //     child: Column(
//   //       children: [
//   //         Stack(
//   //             alignment: AlignmentDirectional.bottomStart,
//   //             children:[
//   //               Container(
//   //                 height: 180,
//   //                 width: 180,
//   //                 // decoration: BoxDecoration(
//   //                 //color: Colors.grey,
//   //                 // ),
//   //                 child: Image.network('${product?.image}',
//   //                   fit: BoxFit.fill,
//   //
//   //                 ),
//   //               ),
//   //               if(product?.discount!=0)
//   //                 Container(
//   //                   decoration: BoxDecoration(
//   //                     color: Colors.red,
//   //                   ),
//   //                   child: Text('Discount',
//   //
//   //                     style: TextStyle(
//   //                       color: Colors.white,
//   //                       fontSize: 13,
//   //
//   //                     ),
//   //                   ),
//   //                 ),
//   //             ]
//   //         ),
//   //         SizedBox(height: 10,),
//   //         Container(
//   //           width: double.infinity,
//   //           height: 30,
//   //           child: Text('${product?.name}',
//   //             overflow: TextOverflow.ellipsis,
//   //             maxLines: 2,
//   //           ),
//   //         ),
//   //         SizedBox(height: 5,),
//   //         Container(
//   //           child: Row(
//   //             children: [
//   //               Text('${product?.price}',
//   //                 style: TextStyle(
//   //                     color: Colors.blue,
//   //                     fontWeight: FontWeight.bold
//   //                 ),
//   //               ),
//   //               SizedBox(width: 5,),
//   //               Container(
//   //                 child: (product?.discount!=0)?
//   //                 Text('${product?.oldPrice}',
//   //                   style: TextStyle(
//   //                     color: Colors.grey,
//   //                     fontSize: 12,
//   //                     decoration: TextDecoration.lineThrough,
//   //                   ),
//   //                 )
//   //                     :SizedBox(),
//   //               ),
//   //               Spacer(),
//   //               Container(
//   //                 decoration: BoxDecoration(
//   //                   borderRadius: BorderRadius.circular(40),
//   //                   color:  ShopCubit.get(context).favoraties[product?.id] == true ? Colors.blue : Colors.grey,
//   //                 ),
//   //                 child: IconButton(onPressed: (){
//   //                   ShopCubit.get(context).ChangeFav(productId: product?.id);
//   //                 },
//   //                   icon: Icon(Icons.favorite_border),
//   //                   color:Colors.white,
//   //                 ),
//   //               )
//   //
//   //             ],
//   //           ),
//   //         ),
//   //       ],
//   //     ),
//   //   ),
//   // );
//
// }
