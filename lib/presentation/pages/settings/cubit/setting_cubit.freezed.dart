// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'setting_cubit.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;
/// @nodoc
mixin _$SettingState {





@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is SettingState);
}


@override
int get hashCode => runtimeType.hashCode;

@override
String toString() {
  return 'SettingState()';
}


}

/// @nodoc
class $SettingStateCopyWith<$Res>  {
$SettingStateCopyWith(SettingState _, $Res Function(SettingState) __);
}


/// Adds pattern-matching-related methods to [SettingState].
extension SettingStatePatterns on SettingState {
/// A variant of `map` that fallback to returning `orElse`.
///
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case final Subclass value:
///     return ...;
///   case _:
///     return orElse();
/// }
/// ```

@optionalTypeArgs TResult maybeMap<TResult extends Object?>({TResult Function( SettingStateInitial value)?  initial,TResult Function( SettingStateLoading value)?  loading,TResult Function( SettingStateLoaded value)?  loaded,TResult Function( SettingStateError value)?  error,required TResult orElse(),}){
final _that = this;
switch (_that) {
case SettingStateInitial() when initial != null:
return initial(_that);case SettingStateLoading() when loading != null:
return loading(_that);case SettingStateLoaded() when loaded != null:
return loaded(_that);case SettingStateError() when error != null:
return error(_that);case _:
  return orElse();

}
}
/// A `switch`-like method, using callbacks.
///
/// Callbacks receives the raw object, upcasted.
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case final Subclass value:
///     return ...;
///   case final Subclass2 value:
///     return ...;
/// }
/// ```

@optionalTypeArgs TResult map<TResult extends Object?>({required TResult Function( SettingStateInitial value)  initial,required TResult Function( SettingStateLoading value)  loading,required TResult Function( SettingStateLoaded value)  loaded,required TResult Function( SettingStateError value)  error,}){
final _that = this;
switch (_that) {
case SettingStateInitial():
return initial(_that);case SettingStateLoading():
return loading(_that);case SettingStateLoaded():
return loaded(_that);case SettingStateError():
return error(_that);case _:
  throw StateError('Unexpected subclass');

}
}
/// A variant of `map` that fallback to returning `null`.
///
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case final Subclass value:
///     return ...;
///   case _:
///     return null;
/// }
/// ```

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>({TResult? Function( SettingStateInitial value)?  initial,TResult? Function( SettingStateLoading value)?  loading,TResult? Function( SettingStateLoaded value)?  loaded,TResult? Function( SettingStateError value)?  error,}){
final _that = this;
switch (_that) {
case SettingStateInitial() when initial != null:
return initial(_that);case SettingStateLoading() when loading != null:
return loading(_that);case SettingStateLoaded() when loaded != null:
return loaded(_that);case SettingStateError() when error != null:
return error(_that);case _:
  return null;

}
}
/// A variant of `when` that fallback to an `orElse` callback.
///
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case Subclass(:final field):
///     return ...;
///   case _:
///     return orElse();
/// }
/// ```

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>({TResult Function()?  initial,TResult Function()?  loading,TResult Function( UserModel userModel,  String? transientError)?  loaded,TResult Function( String errorMessage)?  error,required TResult orElse(),}) {final _that = this;
switch (_that) {
case SettingStateInitial() when initial != null:
return initial();case SettingStateLoading() when loading != null:
return loading();case SettingStateLoaded() when loaded != null:
return loaded(_that.userModel,_that.transientError);case SettingStateError() when error != null:
return error(_that.errorMessage);case _:
  return orElse();

}
}
/// A `switch`-like method, using callbacks.
///
/// As opposed to `map`, this offers destructuring.
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case Subclass(:final field):
///     return ...;
///   case Subclass2(:final field2):
///     return ...;
/// }
/// ```

@optionalTypeArgs TResult when<TResult extends Object?>({required TResult Function()  initial,required TResult Function()  loading,required TResult Function( UserModel userModel,  String? transientError)  loaded,required TResult Function( String errorMessage)  error,}) {final _that = this;
switch (_that) {
case SettingStateInitial():
return initial();case SettingStateLoading():
return loading();case SettingStateLoaded():
return loaded(_that.userModel,_that.transientError);case SettingStateError():
return error(_that.errorMessage);case _:
  throw StateError('Unexpected subclass');

}
}
/// A variant of `when` that fallback to returning `null`
///
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case Subclass(:final field):
///     return ...;
///   case _:
///     return null;
/// }
/// ```

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>({TResult? Function()?  initial,TResult? Function()?  loading,TResult? Function( UserModel userModel,  String? transientError)?  loaded,TResult? Function( String errorMessage)?  error,}) {final _that = this;
switch (_that) {
case SettingStateInitial() when initial != null:
return initial();case SettingStateLoading() when loading != null:
return loading();case SettingStateLoaded() when loaded != null:
return loaded(_that.userModel,_that.transientError);case SettingStateError() when error != null:
return error(_that.errorMessage);case _:
  return null;

}
}

}

/// @nodoc


class SettingStateInitial implements SettingState {
  const SettingStateInitial();
  






@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is SettingStateInitial);
}


@override
int get hashCode => runtimeType.hashCode;

@override
String toString() {
  return 'SettingState.initial()';
}


}




/// @nodoc


class SettingStateLoading implements SettingState {
  const SettingStateLoading();
  






@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is SettingStateLoading);
}


@override
int get hashCode => runtimeType.hashCode;

@override
String toString() {
  return 'SettingState.loading()';
}


}




/// @nodoc


class SettingStateLoaded implements SettingState {
  const SettingStateLoaded(this.userModel, {this.transientError = null});
  

 final  UserModel userModel;
@JsonKey() final  String? transientError;

/// Create a copy of SettingState
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$SettingStateLoadedCopyWith<SettingStateLoaded> get copyWith => _$SettingStateLoadedCopyWithImpl<SettingStateLoaded>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is SettingStateLoaded&&(identical(other.userModel, userModel) || other.userModel == userModel)&&(identical(other.transientError, transientError) || other.transientError == transientError));
}


@override
int get hashCode => Object.hash(runtimeType,userModel,transientError);

@override
String toString() {
  return 'SettingState.loaded(userModel: $userModel, transientError: $transientError)';
}


}

/// @nodoc
abstract mixin class $SettingStateLoadedCopyWith<$Res> implements $SettingStateCopyWith<$Res> {
  factory $SettingStateLoadedCopyWith(SettingStateLoaded value, $Res Function(SettingStateLoaded) _then) = _$SettingStateLoadedCopyWithImpl;
@useResult
$Res call({
 UserModel userModel, String? transientError
});


$UserModelCopyWith<$Res> get userModel;

}
/// @nodoc
class _$SettingStateLoadedCopyWithImpl<$Res>
    implements $SettingStateLoadedCopyWith<$Res> {
  _$SettingStateLoadedCopyWithImpl(this._self, this._then);

  final SettingStateLoaded _self;
  final $Res Function(SettingStateLoaded) _then;

/// Create a copy of SettingState
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') $Res call({Object? userModel = null,Object? transientError = freezed,}) {
  return _then(SettingStateLoaded(
null == userModel ? _self.userModel : userModel // ignore: cast_nullable_to_non_nullable
as UserModel,transientError: freezed == transientError ? _self.transientError : transientError // ignore: cast_nullable_to_non_nullable
as String?,
  ));
}

/// Create a copy of SettingState
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$UserModelCopyWith<$Res> get userModel {
  
  return $UserModelCopyWith<$Res>(_self.userModel, (value) {
    return _then(_self.copyWith(userModel: value));
  });
}
}

/// @nodoc


class SettingStateError implements SettingState {
  const SettingStateError(this.errorMessage);
  

 final  String errorMessage;

/// Create a copy of SettingState
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$SettingStateErrorCopyWith<SettingStateError> get copyWith => _$SettingStateErrorCopyWithImpl<SettingStateError>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is SettingStateError&&(identical(other.errorMessage, errorMessage) || other.errorMessage == errorMessage));
}


@override
int get hashCode => Object.hash(runtimeType,errorMessage);

@override
String toString() {
  return 'SettingState.error(errorMessage: $errorMessage)';
}


}

/// @nodoc
abstract mixin class $SettingStateErrorCopyWith<$Res> implements $SettingStateCopyWith<$Res> {
  factory $SettingStateErrorCopyWith(SettingStateError value, $Res Function(SettingStateError) _then) = _$SettingStateErrorCopyWithImpl;
@useResult
$Res call({
 String errorMessage
});




}
/// @nodoc
class _$SettingStateErrorCopyWithImpl<$Res>
    implements $SettingStateErrorCopyWith<$Res> {
  _$SettingStateErrorCopyWithImpl(this._self, this._then);

  final SettingStateError _self;
  final $Res Function(SettingStateError) _then;

/// Create a copy of SettingState
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') $Res call({Object? errorMessage = null,}) {
  return _then(SettingStateError(
null == errorMessage ? _self.errorMessage : errorMessage // ignore: cast_nullable_to_non_nullable
as String,
  ));
}


}

// dart format on
