// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'signup_cubit.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;
/// @nodoc
mixin _$SignupState {





@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is SignupState);
}


@override
int get hashCode => runtimeType.hashCode;

@override
String toString() {
  return 'SignupState()';
}


}

/// @nodoc
class $SignupStateCopyWith<$Res>  {
$SignupStateCopyWith(SignupState _, $Res Function(SignupState) __);
}


/// Adds pattern-matching-related methods to [SignupState].
extension SignupStatePatterns on SignupState {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>({TResult Function( SignupStateInitial value)?  initial,TResult Function( SignupStateLoading value)?  loading,TResult Function( SignupStateLoaded value)?  loaded,TResult Function( SignupStateError value)?  error,required TResult orElse(),}){
final _that = this;
switch (_that) {
case SignupStateInitial() when initial != null:
return initial(_that);case SignupStateLoading() when loading != null:
return loading(_that);case SignupStateLoaded() when loaded != null:
return loaded(_that);case SignupStateError() when error != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>({required TResult Function( SignupStateInitial value)  initial,required TResult Function( SignupStateLoading value)  loading,required TResult Function( SignupStateLoaded value)  loaded,required TResult Function( SignupStateError value)  error,}){
final _that = this;
switch (_that) {
case SignupStateInitial():
return initial(_that);case SignupStateLoading():
return loading(_that);case SignupStateLoaded():
return loaded(_that);case SignupStateError():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>({TResult? Function( SignupStateInitial value)?  initial,TResult? Function( SignupStateLoading value)?  loading,TResult? Function( SignupStateLoaded value)?  loaded,TResult? Function( SignupStateError value)?  error,}){
final _that = this;
switch (_that) {
case SignupStateInitial() when initial != null:
return initial(_that);case SignupStateLoading() when loading != null:
return loading(_that);case SignupStateLoaded() when loaded != null:
return loaded(_that);case SignupStateError() when error != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>({TResult Function()?  initial,TResult Function()?  loading,TResult Function( UserModel user)?  loaded,TResult Function( String errorMessage)?  error,required TResult orElse(),}) {final _that = this;
switch (_that) {
case SignupStateInitial() when initial != null:
return initial();case SignupStateLoading() when loading != null:
return loading();case SignupStateLoaded() when loaded != null:
return loaded(_that.user);case SignupStateError() when error != null:
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

@optionalTypeArgs TResult when<TResult extends Object?>({required TResult Function()  initial,required TResult Function()  loading,required TResult Function( UserModel user)  loaded,required TResult Function( String errorMessage)  error,}) {final _that = this;
switch (_that) {
case SignupStateInitial():
return initial();case SignupStateLoading():
return loading();case SignupStateLoaded():
return loaded(_that.user);case SignupStateError():
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>({TResult? Function()?  initial,TResult? Function()?  loading,TResult? Function( UserModel user)?  loaded,TResult? Function( String errorMessage)?  error,}) {final _that = this;
switch (_that) {
case SignupStateInitial() when initial != null:
return initial();case SignupStateLoading() when loading != null:
return loading();case SignupStateLoaded() when loaded != null:
return loaded(_that.user);case SignupStateError() when error != null:
return error(_that.errorMessage);case _:
  return null;

}
}

}

/// @nodoc


class SignupStateInitial implements SignupState {
  const SignupStateInitial();
  






@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is SignupStateInitial);
}


@override
int get hashCode => runtimeType.hashCode;

@override
String toString() {
  return 'SignupState.initial()';
}


}




/// @nodoc


class SignupStateLoading implements SignupState {
  const SignupStateLoading();
  






@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is SignupStateLoading);
}


@override
int get hashCode => runtimeType.hashCode;

@override
String toString() {
  return 'SignupState.loading()';
}


}




/// @nodoc


class SignupStateLoaded implements SignupState {
  const SignupStateLoaded(this.user);
  

 final  UserModel user;

/// Create a copy of SignupState
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$SignupStateLoadedCopyWith<SignupStateLoaded> get copyWith => _$SignupStateLoadedCopyWithImpl<SignupStateLoaded>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is SignupStateLoaded&&(identical(other.user, user) || other.user == user));
}


@override
int get hashCode => Object.hash(runtimeType,user);

@override
String toString() {
  return 'SignupState.loaded(user: $user)';
}


}

/// @nodoc
abstract mixin class $SignupStateLoadedCopyWith<$Res> implements $SignupStateCopyWith<$Res> {
  factory $SignupStateLoadedCopyWith(SignupStateLoaded value, $Res Function(SignupStateLoaded) _then) = _$SignupStateLoadedCopyWithImpl;
@useResult
$Res call({
 UserModel user
});


$UserModelCopyWith<$Res> get user;

}
/// @nodoc
class _$SignupStateLoadedCopyWithImpl<$Res>
    implements $SignupStateLoadedCopyWith<$Res> {
  _$SignupStateLoadedCopyWithImpl(this._self, this._then);

  final SignupStateLoaded _self;
  final $Res Function(SignupStateLoaded) _then;

/// Create a copy of SignupState
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') $Res call({Object? user = null,}) {
  return _then(SignupStateLoaded(
null == user ? _self.user : user // ignore: cast_nullable_to_non_nullable
as UserModel,
  ));
}

/// Create a copy of SignupState
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$UserModelCopyWith<$Res> get user {
  
  return $UserModelCopyWith<$Res>(_self.user, (value) {
    return _then(_self.copyWith(user: value));
  });
}
}

/// @nodoc


class SignupStateError implements SignupState {
  const SignupStateError(this.errorMessage);
  

 final  String errorMessage;

/// Create a copy of SignupState
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$SignupStateErrorCopyWith<SignupStateError> get copyWith => _$SignupStateErrorCopyWithImpl<SignupStateError>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is SignupStateError&&(identical(other.errorMessage, errorMessage) || other.errorMessage == errorMessage));
}


@override
int get hashCode => Object.hash(runtimeType,errorMessage);

@override
String toString() {
  return 'SignupState.error(errorMessage: $errorMessage)';
}


}

/// @nodoc
abstract mixin class $SignupStateErrorCopyWith<$Res> implements $SignupStateCopyWith<$Res> {
  factory $SignupStateErrorCopyWith(SignupStateError value, $Res Function(SignupStateError) _then) = _$SignupStateErrorCopyWithImpl;
@useResult
$Res call({
 String errorMessage
});




}
/// @nodoc
class _$SignupStateErrorCopyWithImpl<$Res>
    implements $SignupStateErrorCopyWith<$Res> {
  _$SignupStateErrorCopyWithImpl(this._self, this._then);

  final SignupStateError _self;
  final $Res Function(SignupStateError) _then;

/// Create a copy of SignupState
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') $Res call({Object? errorMessage = null,}) {
  return _then(SignupStateError(
null == errorMessage ? _self.errorMessage : errorMessage // ignore: cast_nullable_to_non_nullable
as String,
  ));
}


}

// dart format on
