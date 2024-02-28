import 'package:conditional_builder_null_safety/conditional_builder_null_safety.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../models/usernodel.dart';
import '../../shared/Const.dart';
import '../../shared/Cubit/Shop_cubit.dart';
import '../../shared/Cubit/Shop_state.dart';


class S3 extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<Shop_cubit, Shop_state>(

      listener: (context, state) => {},
      builder: (context, state) {
        Shop_cubit cubit=Shop_cubit.get(context);
        return Scaffold(
          appBar: AppBar(),
          body:  Padding(
            padding: const EdgeInsets.all(15.0),
            child: GridView.count(
              shrinkWrap: true,
              physics: const NeverScrollableScrollPhysics(),
              crossAxisCount: 2,
              mainAxisSpacing: 10.0,
              crossAxisSpacing: 10,
              childAspectRatio: 1 / 1.36,

              children: List.generate(
                cubit.favoomoodel?.data?.data?.length??0,
                    (index) => buildGridProduct(
                       context: context,favooproduct: cubit.favoomoodel?.data?.data![index].product),
              ), // List.generate
            ),
          ),
        );
      },
    );
  }
}

Widget buildGridProduct({required favooProduct? favooproduct,required context}) => Container(
  color: Colors.white,
  child: Column(
    children: [
      Stack(
        alignment: Alignment.bottomLeft,
        children: [
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Image(
              image: NetworkImage('${favooproduct?.image}'),
              height: 180,
              width: double.infinity,
              fit: BoxFit.fill,
            ),
          ),
          ConditionalBuilder(
              condition: favooproduct?.discount != 0,
              builder: (context) => Container(
                color: Colors.red,
                child: const Padding(
                  padding: EdgeInsets.all(3.0),
                  child: Text(
                    'Discount',
                    textAlign: TextAlign.start,
                    style: TextStyle(
                      fontSize: 15,
                      fontWeight: FontWeight.w600,
                      color: Colors.white,
                    ),
                  ),
                ),
              ),
              fallback: null)
        ],
      ),
      const SizedBox(
        height: 10,
      ),
      Expanded(
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 10.0),
            child: Text(
              '${favooproduct?.name}',
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
              '${favooproduct?.price} E',
              style: const TextStyle(
                fontSize: 17,
                fontWeight: FontWeight.w600,
                color: Colors.cyan,
              ),
            ),
            const SizedBox(
              width: 10,
            ),
            ConditionalBuilder(
                condition: favooproduct?.discount != 0,
                builder: (context) => Text(
                  '${favooproduct?.oldPrice}',
                  style: const TextStyle(
                    fontSize: 14,
                    fontWeight: FontWeight.w500,
                    color: Colors.blueGrey,
                    decoration: TextDecoration.lineThrough,
                  ),
                ),
                fallback: null),
            const Spacer(),
            IconButton(
                onPressed: () {
                  Shop_cubit.get(context)
                      .favorites_fun(id: favooproduct?.id, token: token);
                },
                icon:  Icon(
                  Icons.favorite_border,
                  color:Shop_cubit.get(context).favorites?[favooproduct?.id]==true
                      ? Colors.red
                      : Colors.black,
                )),
          ],
        ),
      ),
    ],
  ),
);