import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../models/usernodel.dart';
import '../../shared/Cubit/Shop_cubit.dart';
import '../../shared/Cubit/Shop_state.dart';

class S2 extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<Shop_cubit, Shop_state>(
      listener: (context, state) => {},
      builder: (context, state) {
        Shop_cubit cubit = Shop_cubit.get(context);
        return Scaffold(
          appBar: AppBar(),
          body: Padding(
            padding: const EdgeInsets.all(15.0),
            child: Container(
              child: ListView.separated(
                  scrollDirection: Axis.vertical,
                  itemBuilder: (context, index) => BuildCatogry(Datum:cubit.catogerymodel?.data?.data![index]),
                  separatorBuilder: (context, index) => SizedBox(
                        height: 20,
                      ),
                  itemCount: cubit.catogerymodel?.data?.data?.length ?? 0,
              ),
            ),
          ),
        );
      },
    );
  }
}

Widget BuildCatogry({required Datum? Datum}) => Container(
      width: double.infinity,
      color: Colors.blueGrey[100],
      child: Row(
        children: [
          Image(
            image: NetworkImage('${Datum?.image}'),
            fit: BoxFit.cover,
            width: 120,
            height: 120,
          ),
         SizedBox(width: 30,),
          Text(

            '${Datum?.name}',textAlign: TextAlign.start,
            style: TextStyle(fontWeight: FontWeight.w900, fontSize: 20),
          ),
          Spacer(),
          IconButton(onPressed: () {}, icon: Icon(Icons.arrow_forward_ios)),
        ],
      ),
    );
