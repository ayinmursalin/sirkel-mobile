import 'package:either_dart/either.dart';
import 'package:sirkel/src/domain/models/error_dto.dart';
import 'package:sirkel/src/domain/models/error_type.dart';

typedef EitherError<T> = Either<ErrorDto, T>;

typedef FutureOrError<T> = Future<EitherError<T>>;

typedef IntCallback = void Function(int);

typedef StringCallback = void Function(String);

typedef IntStringCallback = void Function(int, String);

typedef BooleanCallback = void Function(bool);

typedef NullableBooleanCallback = void Function(bool?);

typedef NullableStringCallback = void Function(String?);

typedef NullableIntCallback = void Function(int?);

typedef ErrorTypeCallback = void Function(ErrorType?);

typedef ResponseData = Map<String, dynamic>;
