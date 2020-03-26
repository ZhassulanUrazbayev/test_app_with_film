import 'package:appforusetesting/bloc/bloc.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {

  test('should assert if null', () {
    expect(
          () => PopularMoviesBloc(repository: null),
      throwsA(isAssertionError),
    );
  });

}