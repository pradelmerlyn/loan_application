import 'package:dio/dio.dart';

abstract class DataState<T> {
  final T? data;
  final DioException? error;

  const DataState({this.data, this.error});
}

abstract class LocalDataState<T> {
  final T? data;
  final Object? error;
  final StackTrace? stackTrace;

  const LocalDataState({this.data, this.error, this.stackTrace});
}

class DataSuccess<T> extends DataState<T> {
  const DataSuccess(T data) : super(data: data);
}

class DataFailed<T> extends DataState<T> {
  const DataFailed(DioException error) : super(error: error);
}

class LocalDataSuccess<T> extends LocalDataState<T> {
  const LocalDataSuccess(T? data) : super(data: data);
}

class LocalDataFailed<T> extends LocalDataState<T> {
  const LocalDataFailed(Object error, StackTrace stackTrace)
      : super(error: error, stackTrace: stackTrace);
}
