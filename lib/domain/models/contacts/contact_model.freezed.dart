// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'contact_model.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;
/// @nodoc
mixin _$ContactModel {

 DateTime get since; UserModel get user;
/// Create a copy of ContactModel
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$ContactModelCopyWith<ContactModel> get copyWith => _$ContactModelCopyWithImpl<ContactModel>(this as ContactModel, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is ContactModel&&(identical(other.since, since) || other.since == since)&&(identical(other.user, user) || other.user == user));
}


@override
int get hashCode => Object.hash(runtimeType,since,user);

@override
String toString() {
  return 'ContactModel(since: $since, user: $user)';
}


}

/// @nodoc
abstract mixin class $ContactModelCopyWith<$Res>  {
  factory $ContactModelCopyWith(ContactModel value, $Res Function(ContactModel) _then) = _$ContactModelCopyWithImpl;
@useResult
$Res call({
 DateTime since, UserModel user
});


$UserModelCopyWith<$Res> get user;

}
/// @nodoc
class _$ContactModelCopyWithImpl<$Res>
    implements $ContactModelCopyWith<$Res> {
  _$ContactModelCopyWithImpl(this._self, this._then);

  final ContactModel _self;
  final $Res Function(ContactModel) _then;

/// Create a copy of ContactModel
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? since = null,Object? user = null,}) {
  return _then(_self.copyWith(
since: null == since ? _self.since : since // ignore: cast_nullable_to_non_nullable
as DateTime,user: null == user ? _self.user : user // ignore: cast_nullable_to_non_nullable
as UserModel,
  ));
}
/// Create a copy of ContactModel
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$UserModelCopyWith<$Res> get user {
  
  return $UserModelCopyWith<$Res>(_self.user, (value) {
    return _then(_self.copyWith(user: value));
  });
}
}


/// Adds pattern-matching-related methods to [ContactModel].
extension ContactModelPatterns on ContactModel {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _ContactModel value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _ContactModel() when $default != null:
return $default(_that);case _:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _ContactModel value)  $default,){
final _that = this;
switch (_that) {
case _ContactModel():
return $default(_that);case _:
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _ContactModel value)?  $default,){
final _that = this;
switch (_that) {
case _ContactModel() when $default != null:
return $default(_that);case _:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( DateTime since,  UserModel user)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _ContactModel() when $default != null:
return $default(_that.since,_that.user);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( DateTime since,  UserModel user)  $default,) {final _that = this;
switch (_that) {
case _ContactModel():
return $default(_that.since,_that.user);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( DateTime since,  UserModel user)?  $default,) {final _that = this;
switch (_that) {
case _ContactModel() when $default != null:
return $default(_that.since,_that.user);case _:
  return null;

}
}

}

/// @nodoc


class _ContactModel implements ContactModel {
  const _ContactModel({required this.since, required this.user});
  

@override final  DateTime since;
@override final  UserModel user;

/// Create a copy of ContactModel
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$ContactModelCopyWith<_ContactModel> get copyWith => __$ContactModelCopyWithImpl<_ContactModel>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _ContactModel&&(identical(other.since, since) || other.since == since)&&(identical(other.user, user) || other.user == user));
}


@override
int get hashCode => Object.hash(runtimeType,since,user);

@override
String toString() {
  return 'ContactModel(since: $since, user: $user)';
}


}

/// @nodoc
abstract mixin class _$ContactModelCopyWith<$Res> implements $ContactModelCopyWith<$Res> {
  factory _$ContactModelCopyWith(_ContactModel value, $Res Function(_ContactModel) _then) = __$ContactModelCopyWithImpl;
@override @useResult
$Res call({
 DateTime since, UserModel user
});


@override $UserModelCopyWith<$Res> get user;

}
/// @nodoc
class __$ContactModelCopyWithImpl<$Res>
    implements _$ContactModelCopyWith<$Res> {
  __$ContactModelCopyWithImpl(this._self, this._then);

  final _ContactModel _self;
  final $Res Function(_ContactModel) _then;

/// Create a copy of ContactModel
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? since = null,Object? user = null,}) {
  return _then(_ContactModel(
since: null == since ? _self.since : since // ignore: cast_nullable_to_non_nullable
as DateTime,user: null == user ? _self.user : user // ignore: cast_nullable_to_non_nullable
as UserModel,
  ));
}

/// Create a copy of ContactModel
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$UserModelCopyWith<$Res> get user {
  
  return $UserModelCopyWith<$Res>(_self.user, (value) {
    return _then(_self.copyWith(user: value));
  });
}
}

// dart format on
