import 'package:carousel_slider/carousel_slider.dart';
import 'package:conditional_builder_null_safety/conditional_builder_null_safety.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../models/usernodel.dart';
import '../../shared/Const.dart';
import '../../shared/Cubit/Shop_cubit.dart';
import '../../shared/Cubit/Shop_state.dart';

class S1 extends StatelessWidget {
  var carouselcontroller = CarouselController();

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<Shop_cubit, Shop_state>(
      listener: (context, state) => {},
      builder: (context, state) {
        Shop_cubit cubit = Shop_cubit.get(context);

        return ConditionalBuilder(
          condition: state is! product_loading_state,
          builder: (context) => Scaffold(
            body: SingleChildScrollView(
              child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: Column(
                  children: [
                    Container(
                      color: Colors.black,
                      child: CarouselSlider(
                        items: cubit.homedata?.data?.banners
                            ?.map(
                              (e) => Image(
                                image: NetworkImage('${e.image}'),
                                width: double.infinity,
                                fit: BoxFit.cover,
                              ),
                            )
                            .toList(), // Image
                        options: CarouselOptions(
                          height: 220.0,
                          viewportFraction: 1,
                          initialPage: 0,
                          enableInfiniteScroll: true,
                          reverse: false,
                          autoPlay: true,
                          autoPlayInterval: const Duration(seconds: 3),
                          autoPlayAnimationDuration: const Duration(seconds: 1),
                          autoPlayCurve: Curves.fastOutSlowIn,
                          scrollDirection: Axis.horizontal,
                        ),
                      ),
                    ),
                    const SizedBox(
                      height: 20,
                    ),
                    Container(
                      height: 120,
                      child: ConditionalBuilder(
                        condition: state is! category_loading_state,
                        builder: (context) => ListView.separated(
                            scrollDirection: Axis.horizontal,
                            itemBuilder: (context, index) => BuildCat(
                                Datum: cubit.catogerymodel?.data?.data![index]),
                            separatorBuilder: (context, index) => SizedBox(
                                  width: 15,
                                ),
                            itemCount:
                                cubit.catogerymodel?.data?.data?.length ?? 0),
                        fallback: (context) =>
                            Center(child: CircularProgressIndicator()),
                      ),
                    ),
                    SizedBox(
                      height: 20,
                    ),
                    GridView.count(
                      shrinkWrap: true,
                      physics: const NeverScrollableScrollPhysics(),
                      crossAxisCount: 2,
                      mainAxisSpacing: 10.0,
                      crossAxisSpacing: 10,
                      childAspectRatio: 1 / 1.36,

                      children: List.generate(
                        cubit.homedata?.data?.products?.length ?? 0,
                        (index) => buildGridProduct(
                            product: cubit.homedata?.data?.products?[index],
                            context: context,),
                      ), // List.generate
                    ),
                  ],
                ),
              ),
            ),
          ),
          fallback: (context) =>
              const Center(child: CircularProgressIndicator()),
        );
      },
    );
  }
}

Widget buildGridProduct({
  required Product? product,
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
              ConditionalBuilder(
                  condition: product?.discount != 0,
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
                ConditionalBuilder(
                    condition: product?.discount != 0,
                    builder: (context) => Text(
                          '${product?.oldPrice}',
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
                          .favorites_fun(id: product?.id, token: token);
                    },
                    icon:  Icon(
                      Icons.favorite_border,
                      color:Shop_cubit.get(context).favorites?[product?.id]==true
                          ? Colors.red
                          : Colors.black,
                    )),
              ],
            ),
          ),
        ],
      ),
    );
Widget BuildCat({required Datum? Datum}) => Container(
      width: 120,
      height: 120,
      child: Stack(
        alignment: Alignment.bottomCenter,
        children: [
          Image(
            image: NetworkImage('${Datum?.image}'),
            fit: BoxFit.cover,
            height: 120,
          ),
          Container(
              width: double.infinity,
              color: Colors.black.withOpacity(.5),
              child: Text(
                '${Datum?.name}',
                overflow: TextOverflow.ellipsis,
                maxLines: 1,
                textAlign: TextAlign.center,
                style: TextStyle(
                  fontWeight: FontWeight.w900,
                  fontSize: 20,
                  color: Colors.white,
                ),
              )),
        ],
      ),
    );
