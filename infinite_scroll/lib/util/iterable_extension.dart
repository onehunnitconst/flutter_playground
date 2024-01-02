extension IterableExtension<E> on Iterable<E> {
  Iterable<T> mapIndex<T>(T Function(E value, int index) toElement) {
    return toList().asMap().entries.map((e) => toElement(e.value, e.key));
  }
}
