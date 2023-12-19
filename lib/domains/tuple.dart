class Tuple<T1, T2> {
  late T1 hasError;
  late T2 error;

  Tuple();

  void setValues(T1 _hasError, T2 _error) {
    hasError = _hasError;
    error = _error;
  }
}
