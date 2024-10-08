// Mocks generated by Mockito 5.4.4 from annotations
// in ca_flutter_test/test/features/product_store/data/services/product_store_service_test.dart.
// Do not manually edit this file.

// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'dart:async' as _i3;

import 'package:ca_flutter_test/src/features/product_store/interactor/entities/product_entity.dart'
    as _i5;
import 'package:ca_flutter_test/src/features/product_store/interactor/usecases/get_favorite_products_uc.dart'
    as _i4;
import 'package:ca_flutter_test/src/features/product_store/interactor/usecases/get_more_products_uc.dart'
    as _i2;
import 'package:ca_flutter_test/src/features/product_store/interactor/usecases/update_favorite_products_uc.dart'
    as _i6;
import 'package:mockito/mockito.dart' as _i1;

// ignore_for_file: type=lint
// ignore_for_file: avoid_redundant_argument_values
// ignore_for_file: avoid_setters_without_getters
// ignore_for_file: comment_references
// ignore_for_file: deprecated_member_use
// ignore_for_file: deprecated_member_use_from_same_package
// ignore_for_file: implementation_imports
// ignore_for_file: invalid_use_of_visible_for_testing_member
// ignore_for_file: prefer_const_constructors
// ignore_for_file: unnecessary_parenthesis
// ignore_for_file: camel_case_types
// ignore_for_file: subtype_of_sealed_class

/// A class which mocks [GetMoreProductsUseCase].
///
/// See the documentation for Mockito's code generation for more information.
class MockGetMoreProductsUseCase extends _i1.Mock
    implements _i2.GetMoreProductsUseCase {
  @override
  _i3.Future<dynamic> call({dynamic params}) => (super.noSuchMethod(
        Invocation.method(
          #call,
          [],
          {#params: params},
        ),
        returnValue: _i3.Future<dynamic>.value(),
        returnValueForMissingStub: _i3.Future<dynamic>.value(),
      ) as _i3.Future<dynamic>);
}

/// A class which mocks [GetFavoriteProductsUseCase].
///
/// See the documentation for Mockito's code generation for more information.
class MockGetFavoriteProductsUseCase extends _i1.Mock
    implements _i4.GetFavoriteProductsUseCase {
  @override
  _i3.Future<List<_i5.ProductEntity>> call({dynamic params}) =>
      (super.noSuchMethod(
        Invocation.method(
          #call,
          [],
          {#params: params},
        ),
        returnValue:
            _i3.Future<List<_i5.ProductEntity>>.value(<_i5.ProductEntity>[]),
        returnValueForMissingStub:
            _i3.Future<List<_i5.ProductEntity>>.value(<_i5.ProductEntity>[]),
      ) as _i3.Future<List<_i5.ProductEntity>>);
}

/// A class which mocks [UpdateFavoriteProductsUseCase].
///
/// See the documentation for Mockito's code generation for more information.
class MockUpdateFavoriteProductsUseCase extends _i1.Mock
    implements _i6.UpdateFavoriteProductsUseCase {
  @override
  _i3.Future<dynamic> call({required List<_i5.ProductEntity>? params}) =>
      (super.noSuchMethod(
        Invocation.method(
          #call,
          [],
          {#params: params},
        ),
        returnValue: _i3.Future<dynamic>.value(),
        returnValueForMissingStub: _i3.Future<dynamic>.value(),
      ) as _i3.Future<dynamic>);
}
