// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'chat_member_model.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;
/// @nodoc
mixin _$ChatMemberModel {

 UserModel get user; DateTime? get lastReadAt;
/// Create a copy of ChatMemberModel
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$ChatMemberModelCopyWith<ChatMemberModel> get copyWith => _$ChatMemberModelCopyWithImpl<ChatMemberModel>(this as ChatMemberModel, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is ChatMemberModel&&(identical(other.user, user) || other.user == user)&&(identical(other.lastReadAt, lastReadAt) || other.lastReadAt == lastReadAt));
}


@override
int get hashCode => Object.hash(runtimeType,user,lastReadAt);

@override
String toString() {
  return 'ChatMemberModel(user: $user, lastReadAt: $lastReadAt)';
}


}

/// @nodoc
abstract mixin class $ChatMemberModelCopyWith<$Res>  {
  factory $ChatMemberModelCopyWith(ChatMemberModel value, $Res Function(ChatMemberModel) _then) = _$ChatMemberModelCopyWithImpl;
@useResult
$Res call({
 UserModel user, DateTime? lastReadAt
});


$UserModelCopyWith<$Res> get user;

}
/// @nodoc
class _$ChatMemberModelCopyWithImpl<$Res>
    implements $ChatMemberModelCopyWith<$Res> {
  _$ChatMemberModelCopyWithImpl(this._self, this._then);

  final ChatMemberModel _self;
  final $Res Function(ChatMemberModel) _then;

/// Create a copy of ChatMemberModel
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? user = null,Object? lastReadAt = freezed,}) {
  return _then(_self.copyWith(
user: null == user ? _self.user : user // ignore: cast_nullable_to_non_nullable
as UserModel,lastReadAt: freezed == lastReadAt ? _self.lastReadAt : lastReadAt // ignore: cast_nullable_to_non_nullable
as DateTime?,
  ));
}
/// Create a copy of ChatMemberModel
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$UserModelCopyWith<$Res> get user {
  
  return $UserModelCopyWith<$Res>(_self.user, (value) {
    return _then(_self.copyWith(user: value));
  });
}
}


/// Adds pattern-matching-related methods to [ChatMemberModel].
extension ChatMemberModelPatterns on ChatMemberModel {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _ChatMemberModel value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _ChatMemberModel() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _ChatMemberModel value)  $default,){
final _that = this;
switch (_that) {
case _ChatMemberModel():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _ChatMemberModel value)?  $default,){
final _that = this;
switch (_that) {
case _ChatMemberModel() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( UserModel user,  DateTime? lastReadAt)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _ChatMemberModel() when $default != null:
return $default(_that.user,_that.lastReadAt);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( UserModel user,  DateTime? lastReadAt)  $default,) {final _that = this;
switch (_that) {
case _ChatMemberModel():
return $default(_that.user,_that.lastReadAt);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( UserModel user,  DateTime? lastReadAt)?  $default,) {final _that = this;
switch (_that) {
case _ChatMemberModel() when $default != null:
return $default(_that.user,_that.lastReadAt);case _:
  return null;

}
}

}

/// @nodoc


class _ChatMemberModel extends ChatMemberModel {
  const _ChatMemberModel({required this.user, this.lastReadAt}): super._();
  

@override final  UserModel user;
@override final  DateTime? lastReadAt;

/// Create a copy of ChatMemberModel
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$ChatMemberModelCopyWith<_ChatMemberModel> get copyWith => __$ChatMemberModelCopyWithImpl<_ChatMemberModel>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _ChatMemberModel&&(identical(other.user, user) || other.user == user)&&(identical(other.lastReadAt, lastReadAt) || other.lastReadAt == lastReadAt));
}


@override
int get hashCode => Object.hash(runtimeType,user,lastReadAt);

@override
String toString() {
  return 'ChatMemberModel(user: $user, lastReadAt: $lastReadAt)';
}


}

/// @nodoc
abstract mixin class _$ChatMemberModelCopyWith<$Res> implements $ChatMemberModelCopyWith<$Res> {
  factory _$ChatMemberModelCopyWith(_ChatMemberModel value, $Res Function(_ChatMemberModel) _then) = __$ChatMemberModelCopyWithImpl;
@override @useResult
$Res call({
 UserModel user, DateTime? lastReadAt
});


@override $UserModelCopyWith<$Res> get user;

}
/// @nodoc
class __$ChatMemberModelCopyWithImpl<$Res>
    implements _$ChatMemberModelCopyWith<$Res> {
  __$ChatMemberModelCopyWithImpl(this._self, this._then);

  final _ChatMemberModel _self;
  final $Res Function(_ChatMemberModel) _then;

/// Create a copy of ChatMemberModel
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? user = null,Object? lastReadAt = freezed,}) {
  return _then(_ChatMemberModel(
user: null == user ? _self.user : user // ignore: cast_nullable_to_non_nullable
as UserModel,lastReadAt: freezed == lastReadAt ? _self.lastReadAt : lastReadAt // ignore: cast_nullable_to_non_nullable
as DateTime?,
  ));
}

/// Create a copy of ChatMemberModel
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
