sealed class Result<T> {
  const Result();

  const factory Result.ok(T value) = Ok._;
  const factory Result.error(Exception error) = Error._;

  bool get isOk => this is Ok<T>;
  bool get isError => this is Error<T>;

  T? get valueOrNull => switch (this) {
    Ok<T>(:final value) => value,
    Error<T>() => null,
  };

  Exception? get errorOrNull => switch (this) {
    Ok<T>() => null,
    Error<T>(:final error) => error,
  };

  R when<R>({
    required R Function(T value) ok,
    required R Function(Exception error) onError,
  }) => switch (this) {
    Ok<T>(:final value) => ok(value),
    Error<T>(:final error) => onError(error),
  };
}

final class Ok<T> extends Result<T> {
  const Ok._(this.value);

  final T value;

  @override
  String toString() => 'Result<$T>.ok($value)';
}

final class Error<T> extends Result<T> {
  const Error._(this.error);

  final Exception error;

  @override
  String toString() => 'Result<$T>.error($error)';
}
