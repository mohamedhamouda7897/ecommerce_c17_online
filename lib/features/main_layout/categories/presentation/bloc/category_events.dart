abstract class CategoryEvents {}

class GetCategoriesEvent extends CategoryEvents {
  GetCategoriesEvent();
}

class ChangeSelectedIndex extends CategoryEvents {
  int index;

  ChangeSelectedIndex(this.index);
}


class GetSubCategoriesEvent extends CategoryEvents {
  GetSubCategoriesEvent();
}
