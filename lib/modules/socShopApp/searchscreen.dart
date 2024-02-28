import 'package:conditional_builder_null_safety/conditional_builder_null_safety.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../models/Seachmodel.dart';
import '../models/usernodel.dart';
import '../shared/Const.dart';
import '../shared/Cubit/Shop_cubit.dart';
import '../shared/Cubit/Shop_state.dart';

class searchsceen extends StatelessWidget {
  var searchcotroller = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<Shop_cubit, Shop_state>(
        listener: (context, state) => {},
        builder: (context, state) {
          Shop_cubit cubit = Shop_cubit.get(context);
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
                          cubit.searchmodel_o=null;
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
                          cubit.search_fun(text: value);
                        },
                      ),
                    ),
                    SizedBox(
                      height: 20,
                    ),
                    ConditionalBuilder(
                        condition: state is! search_loading_state,
                        builder: (context) =>  Expanded(
                          child: GridView.count(
                      shrinkWrap: true,
                      physics:  NeverScrollableScrollPhysics(),
                      crossAxisCount: 2,
                      mainAxisSpacing: 10.0,
                      crossAxisSpacing: 10,
                      childAspectRatio: 1 / 1.36,

                      children: List.generate(
                          cubit.searchmodel_o?.data?.data?.length ?? 0,
                              (index) => buildsearch(
                            product: cubit.searchmodel_o?.data?.data?[index],
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
        });
  }
}

Widget buildsearch({
  required Datum_search? product,
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
                  height: 180,
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
              maxLines: 2,
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
                IconButton(
                    onPressed: () {
                      Shop_cubit.get(context)
                          .favorites_fun(id: product?.id, token: token);
                    },
                    icon: Icon(
                      Icons.favorite_border,
                      color:
                          Shop_cubit.get(context).favorites?[product?.id] == true
                              ? Colors.red
                              : Colors.black,
                    )),
              ],
            ),
          ),
        ],
      ),
    );
