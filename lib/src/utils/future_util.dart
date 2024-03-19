import 'package:either_dart/either.dart';
import 'package:sirkel/src/domain/models/error_dto.dart';
import 'package:sirkel/src/domain/models/error_type.dart';
import 'package:sirkel/src/utils/typedef_util.dart';
import 'package:supabase_flutter/supabase_flutter.dart';

FutureOrError<T> callOrError<T>(
  Future<T> Function() block,
) async {
  try {
    return Right(await block());
  } on AuthException catch (e) {
    return Left(ErrorDto(
      message: e.message,
      errorType: ErrorType.badRequest,
    ));
  } catch (e) {
    return Left(ErrorDto(
      message: 'Unknown',
    ));
  }
}
