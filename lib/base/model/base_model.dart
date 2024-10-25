abstract class BaseModel {
  bool _searching = false;

  void setSearchState(bool state) {
    _searching = state;
  }

  bool getSearchState() {
    return _searching;
  }
}
