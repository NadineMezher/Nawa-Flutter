
abstract class UseCase<T, P> {
  // T is an output type of use case, where as P is an input type of a use case
  Future<T> call(P p);
}
