// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'chat_member_dto.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;

/// @nodoc
mixin _$ChatMemberDto {

 UserDto get user; DateTime? get lastReadAt;
/// Create a copy of ChatMemberDto
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$ChatMemberDtoCopyWith<ChatMemberDto> get copyWith => _$ChatMemberDtoCopyWithImpl<ChatMemberDto>(this as ChatMemberDto, _$identity);

  /// Serializes this ChatMemberDto to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is ChatMemberDto&&(identical(other.user, user) || other.user == user)&&(identical(other.lastReadAt, lastReadAt) || other.lastReadAt == lastReadAt));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,user,lastReadAt);

@override
String toString() {
  return 'ChatMemberDto(user: $user, lastReadAt: $lastReadAt)';
}


}

/// @nodoc
abstract mixin class $ChatMemberDtoCopyWith<$Res>  {
  factory $ChatMemberDtoCopyWith(ChatMemberDto value, $Res Function(ChatMemberDto) _then) = _$ChatMemberDtoCopyWithImpl;
@useResult
$Res call({
 UserDto user, DateTime? lastReadAt
});


$UserDtoCopyWith<$Res> get user;

}
/// @nodoc
class _$ChatMemberDtoCopyWithImpl<$Res>
    implements $ChatMemberDtoCopyWith<$Res> {
  _$ChatMemberDtoCopyWithImpl(this._self, this._then);

  final ChatMemberDto _self;
  final $Res Function(ChatMemberDto) _then;

/// Create a copy of ChatMemberDto
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? user = null,Object? lastReadAt = freezed,}) {
  return _then(_self.copyWith(
user: null == user ? _self.user : user // ignore: cast_nullable_to_non_nullable
as UserDto,lastReadAt: freezed == lastReadAt ? _self.lastReadAt : lastReadAt // ignore: cast_nullable_to_non_nullable
as DateTime?,
  ));
}
/// Create a copy of ChatMemberDto
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$UserDtoCopyWith<$Res> get user {
  
  return $UserDtoCopyWith<$Res>(_self.user, (value) {
    return _then(_self.copyWith(user: value));
  });
}
}


/// Adds pattern-matching-related methods to [ChatMemberDto].
extension ChatMemberDtoPatterns on ChatMemberDto {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _ChatMemberDto value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _ChatMemberDto() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _ChatMemberDto value)  $default,){
final _that = this;
switch (_that) {
case _ChatMemberDto():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _ChatMemberDto value)?  $default,){
final _that = this;
switch (_that) {
case _ChatMemberDto() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( UserDto user,  DateTime? lastReadAt)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _ChatMemberDto() when $default != null:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( UserDto user,  DateTime? lastReadAt)  $default,) {final _that = this;
switch (_that) {
case _ChatMemberDto():
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( UserDto user,  DateTime? lastReadAt)?  $default,) {final _that = this;
switch (_that) {
case _ChatMemberDto() when $default != null:
return $default(_that.user,_that.lastReadAt);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _ChatMemberDto implements ChatMemberDto {
  const _ChatMemberDto({required this.user, this.lastReadAt});
  factory _ChatMemberDto.fromJson(Map<String, dynamic> json) => _$ChatMemberDtoFromJson(json);

@override final  UserDto user;
@override final  DateTime? lastReadAt;

/// Create a copy of ChatMemberDto
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$ChatMemberDtoCopyWith<_ChatMemberDto> get copyWith => __$ChatMemberDtoCopyWithImpl<_ChatMemberDto>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$ChatMemberDtoToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _ChatMemberDto&&(identical(other.user, user) || other.user == user)&&(identical(other.lastReadAt, lastReadAt) || other.lastReadAt == lastReadAt));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,user,lastReadAt);

@override
String toString() {
  return 'ChatMemberDto(user: $user, lastReadAt: $lastReadAt)';
}


}

/// @nodoc
abstract mixin class _$ChatMemberDtoCopyWith<$Res> implements $ChatMemberDtoCopyWith<$Res> {
  factory _$ChatMemberDtoCopyWith(_ChatMemberDto value, $Res Function(_ChatMemberDto) _then) = __$ChatMemberDtoCopyWithImpl;
@override @useResult
$Res call({
 UserDto user, DateTime? lastReadAt
});


@override $UserDtoCopyWith<$Res> get user;

}
/// @nodoc
class __$ChatMemberDtoCopyWithImpl<$Res>
    implements _$ChatMemberDtoCopyWith<$Res> {
  __$ChatMemberDtoCopyWithImpl(this._self, this._then);

  final _ChatMemberDto _self;
  final $Res Function(_ChatMemberDto) _then;

/// Create a copy of ChatMemberDto
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? user = null,Object? lastReadAt = freezed,}) {
  return _then(_ChatMemberDto(
user: null == user ? _self.user : user // ignore: cast_nullable_to_non_nullable
as UserDto,lastReadAt: freezed == lastReadAt ? _self.lastReadAt : lastReadAt // ignore: cast_nullable_to_non_nullable
as DateTime?,
  ));
}

/// Create a copy of ChatMemberDto
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$UserDtoCopyWith<$Res> get user {
  
  return $UserDtoCopyWith<$Res>(_self.user, (value) {
    return _then(_self.copyWith(user: value));
  });
}
}

// dart format on
