// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'contact_request_dto.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;

/// @nodoc
mixin _$ContactModelRequestDto {

 String get id; UserDto get sender; UserDto? get receiver;
/// Create a copy of ContactModelRequestDto
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$ContactModelRequestDtoCopyWith<ContactModelRequestDto> get copyWith => _$ContactModelRequestDtoCopyWithImpl<ContactModelRequestDto>(this as ContactModelRequestDto, _$identity);

  /// Serializes this ContactModelRequestDto to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is ContactModelRequestDto&&(identical(other.id, id) || other.id == id)&&(identical(other.sender, sender) || other.sender == sender)&&(identical(other.receiver, receiver) || other.receiver == receiver));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,id,sender,receiver);

@override
String toString() {
  return 'ContactModelRequestDto(id: $id, sender: $sender, receiver: $receiver)';
}


}

/// @nodoc
abstract mixin class $ContactModelRequestDtoCopyWith<$Res>  {
  factory $ContactModelRequestDtoCopyWith(ContactModelRequestDto value, $Res Function(ContactModelRequestDto) _then) = _$ContactModelRequestDtoCopyWithImpl;
@useResult
$Res call({
 String id, UserDto sender, UserDto? receiver
});


$UserDtoCopyWith<$Res> get sender;$UserDtoCopyWith<$Res>? get receiver;

}
/// @nodoc
class _$ContactModelRequestDtoCopyWithImpl<$Res>
    implements $ContactModelRequestDtoCopyWith<$Res> {
  _$ContactModelRequestDtoCopyWithImpl(this._self, this._then);

  final ContactModelRequestDto _self;
  final $Res Function(ContactModelRequestDto) _then;

/// Create a copy of ContactModelRequestDto
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? id = null,Object? sender = null,Object? receiver = freezed,}) {
  return _then(_self.copyWith(
id: null == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as String,sender: null == sender ? _self.sender : sender // ignore: cast_nullable_to_non_nullable
as UserDto,receiver: freezed == receiver ? _self.receiver : receiver // ignore: cast_nullable_to_non_nullable
as UserDto?,
  ));
}
/// Create a copy of ContactModelRequestDto
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$UserDtoCopyWith<$Res> get sender {
  
  return $UserDtoCopyWith<$Res>(_self.sender, (value) {
    return _then(_self.copyWith(sender: value));
  });
}/// Create a copy of ContactModelRequestDto
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$UserDtoCopyWith<$Res>? get receiver {
    if (_self.receiver == null) {
    return null;
  }

  return $UserDtoCopyWith<$Res>(_self.receiver!, (value) {
    return _then(_self.copyWith(receiver: value));
  });
}
}


/// Adds pattern-matching-related methods to [ContactModelRequestDto].
extension ContactModelRequestDtoPatterns on ContactModelRequestDto {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _ContactModelRequestDto value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _ContactModelRequestDto() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _ContactModelRequestDto value)  $default,){
final _that = this;
switch (_that) {
case _ContactModelRequestDto():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _ContactModelRequestDto value)?  $default,){
final _that = this;
switch (_that) {
case _ContactModelRequestDto() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( String id,  UserDto sender,  UserDto? receiver)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _ContactModelRequestDto() when $default != null:
return $default(_that.id,_that.sender,_that.receiver);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( String id,  UserDto sender,  UserDto? receiver)  $default,) {final _that = this;
switch (_that) {
case _ContactModelRequestDto():
return $default(_that.id,_that.sender,_that.receiver);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( String id,  UserDto sender,  UserDto? receiver)?  $default,) {final _that = this;
switch (_that) {
case _ContactModelRequestDto() when $default != null:
return $default(_that.id,_that.sender,_that.receiver);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _ContactModelRequestDto implements ContactModelRequestDto {
  const _ContactModelRequestDto({required this.id, required this.sender, this.receiver});
  factory _ContactModelRequestDto.fromJson(Map<String, dynamic> json) => _$ContactModelRequestDtoFromJson(json);

@override final  String id;
@override final  UserDto sender;
@override final  UserDto? receiver;

/// Create a copy of ContactModelRequestDto
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$ContactModelRequestDtoCopyWith<_ContactModelRequestDto> get copyWith => __$ContactModelRequestDtoCopyWithImpl<_ContactModelRequestDto>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$ContactModelRequestDtoToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _ContactModelRequestDto&&(identical(other.id, id) || other.id == id)&&(identical(other.sender, sender) || other.sender == sender)&&(identical(other.receiver, receiver) || other.receiver == receiver));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,id,sender,receiver);

@override
String toString() {
  return 'ContactModelRequestDto(id: $id, sender: $sender, receiver: $receiver)';
}


}

/// @nodoc
abstract mixin class _$ContactModelRequestDtoCopyWith<$Res> implements $ContactModelRequestDtoCopyWith<$Res> {
  factory _$ContactModelRequestDtoCopyWith(_ContactModelRequestDto value, $Res Function(_ContactModelRequestDto) _then) = __$ContactModelRequestDtoCopyWithImpl;
@override @useResult
$Res call({
 String id, UserDto sender, UserDto? receiver
});


@override $UserDtoCopyWith<$Res> get sender;@override $UserDtoCopyWith<$Res>? get receiver;

}
/// @nodoc
class __$ContactModelRequestDtoCopyWithImpl<$Res>
    implements _$ContactModelRequestDtoCopyWith<$Res> {
  __$ContactModelRequestDtoCopyWithImpl(this._self, this._then);

  final _ContactModelRequestDto _self;
  final $Res Function(_ContactModelRequestDto) _then;

/// Create a copy of ContactModelRequestDto
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? id = null,Object? sender = null,Object? receiver = freezed,}) {
  return _then(_ContactModelRequestDto(
id: null == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as String,sender: null == sender ? _self.sender : sender // ignore: cast_nullable_to_non_nullable
as UserDto,receiver: freezed == receiver ? _self.receiver : receiver // ignore: cast_nullable_to_non_nullable
as UserDto?,
  ));
}

/// Create a copy of ContactModelRequestDto
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$UserDtoCopyWith<$Res> get sender {
  
  return $UserDtoCopyWith<$Res>(_self.sender, (value) {
    return _then(_self.copyWith(sender: value));
  });
}/// Create a copy of ContactModelRequestDto
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$UserDtoCopyWith<$Res>? get receiver {
    if (_self.receiver == null) {
    return null;
  }

  return $UserDtoCopyWith<$Res>(_self.receiver!, (value) {
    return _then(_self.copyWith(receiver: value));
  });
}
}

// dart format on
