import 'package:bloc/bloc.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:meta/meta.dart';

import '../../../../../../models/user/shop_model/SearchModel.dart';
import '../../../../../../network/End_Pionts.dart';
import '../../../../../../network/remote/dio_helper.dart';
import '../../../../../../shared/components/constants.dart';

part 'search_state.dart';

class SearchCubit extends Cubit<SearchState> {
  SearchCubit() : super(SearchInitial());
  static SearchCubit get(context)=> BlocProvider.of(context);

  SearchModel? searchModel;

  void SearchProduct({
    required String Text,
  }){
    emit(shopSearchLoadingState());
    DioHelper.Postdata(
        token: Token,
        url: SEARCH,
        data:{
          'text':Text,
        }).then((value) {
      print('RegToken is from cubit in Search ${Token}');
      searchModel= SearchModel.fromJson(value?.data);
      print(value?.data);

      emit(shopSearchSuccessState(searchModel!));
    }).catchError((Error){
      print(Error.toString());
      emit(shopSearchErrorState(Error.toString()));
    });
  }

}
