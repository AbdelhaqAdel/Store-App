abstract class Shop_state {}


class NavBar_state extends Shop_state{}
class product_ini_state extends Shop_state{}

class product_loading_state extends Shop_state{}
class product_success_state extends Shop_state{}
class product_error_state extends Shop_state{
  String? error;
  product_error_state(this.error);
}

class favoo_loading_state extends Shop_state{}
class favoo_success_state extends Shop_state{}
class favoo_error_state extends Shop_state{
  String? error;
  favoo_error_state(this.error);
}

class category_loading_state extends Shop_state{}
class category_success_state extends Shop_state{}
class category_error_state extends Shop_state{
  String? error;
  category_error_state(this.error);
}


class fav_loading_state extends Shop_state{}
class fav_success_state extends Shop_state{}
class fav_error_state extends Shop_state{
  String? error;
  fav_error_state(this.error);
}


class profile_loading_state extends Shop_state{}
class profile_success_state extends Shop_state{}
class profile_error_state extends Shop_state{
  String? error;
  profile_error_state(this.error);
}


class search_loading_state extends Shop_state{}
class search_success_state extends Shop_state{}
class search_error_state extends Shop_state{
  String? error;
  search_error_state(this.error);
}


class update_loading_state extends Shop_state{}
class update_success_state extends Shop_state{}
class update_error_state extends Shop_state{
  String? error;
  update_error_state(this.error);
}