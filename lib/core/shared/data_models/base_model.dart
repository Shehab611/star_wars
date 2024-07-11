final class BaseModel<T> {
  final bool canLoadMore;
  final T data;

  const BaseModel({required this.canLoadMore, required this.data});
}
