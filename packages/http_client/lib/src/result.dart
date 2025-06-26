sealed class Result<T> {
  const Result();

  factory Result.ok(T value) => ResultOk(value);

  factory Result.error(Exception error) => ResultError(error);
}

final class ResultOk<T> extends Result<T> {
  const ResultOk(this.value);

  final T value;
}

final class ResultError<T> extends Result<T> {
  const ResultError(this.error);

  final Exception error;
}
