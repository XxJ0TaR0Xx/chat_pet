// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'user_model.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;
/// @nodoc
mixin _$UserModel {

 String get id; String get userTag; String? get avatarUrl; String? get email; String? get name; String? get address; String? get lastName; String? get number; String? get authProvider; DateTime? get createdAt; FriendEnum? get friendshipStatus;
/// Create a copy of UserModel
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$UserModelCopyWith<UserModel> get copyWith => _$UserModelCopyWithImpl<UserModel>(this as UserModel, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is UserModel&&(identical(other.id, id) || other.id == id)&&(identical(other.userTag, userTag) || other.userTag == userTag)&&(identical(other.avatarUrl, avatarUrl) || other.avatarUrl == avatarUrl)&&(identical(other.email, email) || other.email == email)&&(identical(other.name, name) || other.name == name)&&(identical(other.address, address) || other.address == address)&&(identical(other.lastName, lastName) || other.lastName == lastName)&&(identical(other.number, number) || other.number == number)&&(identical(other.authProvider, authProvider) || other.authProvider == authProvider)&&(identical(other.createdAt, createdAt) || other.createdAt == createdAt)&&(identical(other.friendshipStatus, friendshipStatus) || other.friendshipStatus == friendshipStatus));
}


@override
int get hashCode => Object.hash(runtimeType,id,userTag,avatarUrl,email,name,address,lastName,number,authProvider,createdAt,friendshipStatus);

@override
String toString() {
  return 'UserModel(id: $id, userTag: $userTag, avatarUrl: $avatarUrl, email: $email, name: $name, address: $address, lastName: $lastName, number: $number, authProvider: $authProvider, createdAt: $createdAt, friendshipStatus: $friendshipStatus)';
}


}

/// @nodoc
abstract mixin class $UserModelCopyWith<$Res>  {
  factory $UserModelCopyWith(UserModel value, $Res Function(UserModel) _then) = _$UserModelCopyWithImpl;
@useResult
$Res call({
 String id, String userTag, String? avatarUrl, String? email, String? name, String? address, String? lastName, String? number, String? authProvider, DateTime? createdAt, FriendEnum? friendshipStatus
});




}
/// @nodoc
class _$UserModelCopyWithImpl<$Res>
    implements $UserModelCopyWith<$Res> {
  _$UserModelCopyWithImpl(this._self, this._then);

  final UserModel _self;
  final $Res Function(UserModel) _then;

/// Create a copy of UserModel
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? id = null,Object? userTag = null,Object? avatarUrl = freezed,Object? email = freezed,Object? name = freezed,Object? address = freezed,Object? lastName = freezed,Object? number = freezed,Object? authProvider = freezed,Object? createdAt = freezed,Object? friendshipStatus = freezed,}) {
  return _then(_self.copyWith(
id: null == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as String,userTag: null == userTag ? _self.userTag : userTag // ignore: cast_nullable_to_non_nullable
as String,avatarUrl: freezed == avatarUrl ? _self.avatarUrl : avatarUrl // ignore: cast_nullable_to_non_nullable
as String?,email: freezed == email ? _self.email : email // ignore: cast_nullable_to_non_nullable
as String?,name: freezed == name ? _self.name : name // ignore: cast_nullable_to_non_nullable
as String?,address: freezed == address ? _self.address : address // ignore: cast_nullable_to_non_nullable
as String?,lastName: freezed == lastName ? _self.lastName : lastName // ignore: cast_nullable_to_non_nullable
as String?,number: freezed == number ? _self.number : number // ignore: cast_nullable_to_non_nullable
as String?,authProvider: freezed == authProvider ? _self.authProvider : authProvider // ignore: cast_nullable_to_non_nullable
as String?,createdAt: freezed == createdAt ? _self.createdAt : createdAt // ignore: cast_nullable_to_non_nullable
as DateTime?,friendshipStatus: freezed == friendshipStatus ? _self.friendshipStatus : friendshipStatus // ignore: cast_nullable_to_non_nullable
as FriendEnum?,
  ));
}

}


/// Adds pattern-matching-related methods to [UserModel].
extension UserModelPatterns on UserModel {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _UserModel value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _UserModel() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _UserModel value)  $default,){
final _that = this;
switch (_that) {
case _UserModel():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _UserModel value)?  $default,){
final _that = this;
switch (_that) {
case _UserModel() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( String id,  String userTag,  String? avatarUrl,  String? email,  String? name,  String? address,  String? lastName,  String? number,  String? authProvider,  DateTime? createdAt,  FriendEnum? friendshipStatus)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _UserModel() when $default != null:
return $default(_that.id,_that.userTag,_that.avatarUrl,_that.email,_that.name,_that.address,_that.lastName,_that.number,_that.authProvider,_that.createdAt,_that.friendshipStatus);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( String id,  String userTag,  String? avatarUrl,  String? email,  String? name,  String? address,  String? lastName,  String? number,  String? authProvider,  DateTime? createdAt,  FriendEnum? friendshipStatus)  $default,) {final _that = this;
switch (_that) {
case _UserModel():
return $default(_that.id,_that.userTag,_that.avatarUrl,_that.email,_that.name,_that.address,_that.lastName,_that.number,_that.authProvider,_that.createdAt,_that.friendshipStatus);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( String id,  String userTag,  String? avatarUrl,  String? email,  String? name,  String? address,  String? lastName,  String? number,  String? authProvider,  DateTime? createdAt,  FriendEnum? friendshipStatus)?  $default,) {final _that = this;
switch (_that) {
case _UserModel() when $default != null:
return $default(_that.id,_that.userTag,_that.avatarUrl,_that.email,_that.name,_that.address,_that.lastName,_that.number,_that.authProvider,_that.createdAt,_that.friendshipStatus);case _:
  return null;

}
}

}

/// @nodoc


class _UserModel extends UserModel {
  const _UserModel({required this.id, required this.userTag, this.avatarUrl, this.email, this.name, this.address, this.lastName, this.number, this.authProvider, this.createdAt, this.friendshipStatus}): super._();
  

@override final  String id;
@override final  String userTag;
@override final  String? avatarUrl;
@override final  String? email;
@override final  String? name;
@override final  String? address;
@override final  String? lastName;
@override final  String? number;
@override final  String? authProvider;
@override final  DateTime? createdAt;
@override final  FriendEnum? friendshipStatus;

/// Create a copy of UserModel
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$UserModelCopyWith<_UserModel> get copyWith => __$UserModelCopyWithImpl<_UserModel>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _UserModel&&(identical(other.id, id) || other.id == id)&&(identical(other.userTag, userTag) || other.userTag == userTag)&&(identical(other.avatarUrl, avatarUrl) || other.avatarUrl == avatarUrl)&&(identical(other.email, email) || other.email == email)&&(identical(other.name, name) || other.name == name)&&(identical(other.address, address) || other.address == address)&&(identical(other.lastName, lastName) || other.lastName == lastName)&&(identical(other.number, number) || other.number == number)&&(identical(other.authProvider, authProvider) || other.authProvider == authProvider)&&(identical(other.createdAt, createdAt) || other.createdAt == createdAt)&&(identical(other.friendshipStatus, friendshipStatus) || other.friendshipStatus == friendshipStatus));
}


@override
int get hashCode => Object.hash(runtimeType,id,userTag,avatarUrl,email,name,address,lastName,number,authProvider,createdAt,friendshipStatus);

@override
String toString() {
  return 'UserModel(id: $id, userTag: $userTag, avatarUrl: $avatarUrl, email: $email, name: $name, address: $address, lastName: $lastName, number: $number, authProvider: $authProvider, createdAt: $createdAt, friendshipStatus: $friendshipStatus)';
}


}

/// @nodoc
abstract mixin class _$UserModelCopyWith<$Res> implements $UserModelCopyWith<$Res> {
  factory _$UserModelCopyWith(_UserModel value, $Res Function(_UserModel) _then) = __$UserModelCopyWithImpl;
@override @useResult
$Res call({
 String id, String userTag, String? avatarUrl, String? email, String? name, String? address, String? lastName, String? number, String? authProvider, DateTime? createdAt, FriendEnum? friendshipStatus
});




}
/// @nodoc
class __$UserModelCopyWithImpl<$Res>
    implements _$UserModelCopyWith<$Res> {
  __$UserModelCopyWithImpl(this._self, this._then);

  final _UserModel _self;
  final $Res Function(_UserModel) _then;

/// Create a copy of UserModel
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? id = null,Object? userTag = null,Object? avatarUrl = freezed,Object? email = freezed,Object? name = freezed,Object? address = freezed,Object? lastName = freezed,Object? number = freezed,Object? authProvider = freezed,Object? createdAt = freezed,Object? friendshipStatus = freezed,}) {
  return _then(_UserModel(
id: null == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as String,userTag: null == userTag ? _self.userTag : userTag // ignore: cast_nullable_to_non_nullable
as String,avatarUrl: freezed == avatarUrl ? _self.avatarUrl : avatarUrl // ignore: cast_nullable_to_non_nullable
as String?,email: freezed == email ? _self.email : email // ignore: cast_nullable_to_non_nullable
as String?,name: freezed == name ? _self.name : name // ignore: cast_nullable_to_non_nullable
as String?,address: freezed == address ? _self.address : address // ignore: cast_nullable_to_non_nullable
as String?,lastName: freezed == lastName ? _self.lastName : lastName // ignore: cast_nullable_to_non_nullable
as String?,number: freezed == number ? _self.number : number // ignore: cast_nullable_to_non_nullable
as String?,authProvider: freezed == authProvider ? _self.authProvider : authProvider // ignore: cast_nullable_to_non_nullable
as String?,createdAt: freezed == createdAt ? _self.createdAt : createdAt // ignore: cast_nullable_to_non_nullable
as DateTime?,friendshipStatus: freezed == friendshipStatus ? _self.friendshipStatus : friendshipStatus // ignore: cast_nullable_to_non_nullable
as FriendEnum?,
  ));
}


}

// dart format on
