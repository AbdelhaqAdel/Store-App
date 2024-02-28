

import '../../../models/user/shop_model/user/registermodel.dart';

abstract class register_state {}



class register_ini_state extends register_state{}

class register_loading_state extends register_state{}
class register_success_state extends register_state{
  final registermodel registmodel;

  register_success_state(this.registmodel);
}
class register_error_state extends register_state{
  String? error;
  register_error_state(this.error);
}

class register_changevisible_state extends register_state{}