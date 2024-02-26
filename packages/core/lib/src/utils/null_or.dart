class NullOr<T> {
  final T? _value;

  T? get value {
    return _value;
  }

  const NullOr([T? value]) : _value = value;
}

typedef NullOrString = NullOr<String>;
typedef NullOrInt = NullOr<int>;
typedef NullOrBool = NullOr<bool>;
typedef NullOrBigInt = NullOr<BigInt>;
