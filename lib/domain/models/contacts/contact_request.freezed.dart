// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'contact_request.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;

/// @nodoc
mixin _$ContactRequest {

 String get id; UserModel get sender; UserModel? get receiver;
/// Create a copy of ContactRequest
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$ContactRequestCopyWith<ContactRequest> get copyWith => _$ContactRequestCopyWithImpl<ContactRequest>(this as ContactRequest, _$identity);

  /// Serializes this ContactRequest to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is ContactRequest&&(identical(other.id, id) || other.id == id)&&(identical(other.sender, sender) || other.sender == sender)&&(identical(other.receiver, receiver) || other.receiver == receiver));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,id,sender,receiver);

@override
String toString() {
  return 'ContactRequest(id: $id, sender: $sender, receiver: $receiver)';
}


}

/// @nodoc
abstract mixin class $ContactRequestCopyWith<$Res>  {
  factory $ContactRequestCopyWith(ContactRequest value, $Res Function(ContactRequest) _then) = _$ContactRequestCopyWithImpl;
@useResult
$Res call({
 String id, UserModel sender, UserModel? receiver
});


$UserModelCopyWith<$Res> get sender;$UserModelCopyWith<$Res>? get receiver;

}
/// @nodoc
class _$ContactRequestCopyWithImpl<$Res>
    implements $ContactRequestCopyWith<$Res> {
  _$ContactRequestCopyWithImpl(this._self, this._then);

  final ContactRequest _self;
  final $Res Function(ContactRequest) _then;

/// Create a copy of ContactRequest
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? id = null,Object? sender = null,Object? receiver = freezed,}) {
  return _then(_self.copyWith(
id: null == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as String,sender: null == sender ? _self.sender : sender // ignore: cast_nullable_to_non_nullable
as UserModel,receiver: freezed == receiver ? _self.receiver : receiver // ignore: cast_nullable_to_non_nullable
as UserModel?,
  ));
}
/// Create a copy of ContactRequest
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$UserModelCopyWith<$Res> get sender {
  
  return $UserModelCopyWith<$Res>(_self.sender, (value) {
    return _then(_self.copyWith(sender: value));
  });
}/// Create a copy of ContactRequest
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$UserModelCopyWith<$Res>? get receiver {
    if (_self.receiver == null) {
    return null;
  }

  return $UserModelCopyWith<$Res>(_self.receiver!, (value) {
    return _then(_self.copyWith(receiver: value));
  });
}
}


/// Adds pattern-matching-related methods to [ContactRequest].
extension ContactRequestPatterns on ContactRequest {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _ContactRequest value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _ContactRequest() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _ContactRequest value)  $default,){
final _that = this;
switch (_that) {
case _ContactRequest():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _ContactRequest value)?  $default,){
final _that = this;
switch (_that) {
case _ContactRequest() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( String id,  UserModel sender,  UserModel? receiver)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _ContactRequest() when $default != null:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( String id,  UserModel sender,  UserModel? receiver)  $default,) {final _that = this;
switch (_that) {
case _ContactRequest():
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( String id,  UserModel sender,  UserModel? receiver)?  $default,) {final _that = this;
switch (_that) {
case _ContactRequest() when $default != null:
return $default(_that.id,_that.sender,_that.receiver);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _ContactRequest implements ContactRequest {
  const _ContactRequest({required this.id, required this.sender, this.receiver});
  factory _ContactRequest.fromJson(Map<String, dynamic> json) => _$ContactRequestFromJson(json);

@override final  String id;
@override final  UserModel sender;
@override final  UserModel? receiver;

/// Create a copy of ContactRequest
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$ContactRequestCopyWith<_ContactRequest> get copyWith => __$ContactRequestCopyWithImpl<_ContactRequest>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$ContactRequestToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _ContactRequest&&(identical(other.id, id) || other.id == id)&&(identical(other.sender, sender) || other.sender == sender)&&(identical(other.receiver, receiver) || other.receiver == receiver));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,id,sender,receiver);

@override
String toString() {
  return 'ContactRequest(id: $id, sender: $sender, receiver: $receiver)';
}


}

/// @nodoc
abstract mixin class _$ContactRequestCopyWith<$Res> implements $ContactRequestCopyWith<$Res> {
  factory _$ContactRequestCopyWith(_ContactRequest value, $Res Function(_ContactRequest) _then) = __$ContactRequestCopyWithImpl;
@override @useResult
$Res call({
 String id, UserModel sender, UserModel? receiver
});


@override $UserModelCopyWith<$Res> get sender;@override $UserModelCopyWith<$Res>? get receiver;

}
/// @nodoc
class __$ContactRequestCopyWithImpl<$Res>
    implements _$ContactRequestCopyWith<$Res> {
  __$ContactRequestCopyWithImpl(this._self, this._then);

  final _ContactRequest _self;
  final $Res Function(_ContactRequest) _then;

/// Create a copy of ContactRequest
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? id = null,Object? sender = null,Object? receiver = freezed,}) {
  return _then(_ContactRequest(
id: null == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as String,sender: null == sender ? _self.sender : sender // ignore: cast_nullable_to_non_nullable
as UserModel,receiver: freezed == receiver ? _self.receiver : receiver // ignore: cast_nullable_to_non_nullable
as UserModel?,
  ));
}

/// Create a copy of ContactRequest
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$UserModelCopyWith<$Res> get sender {
  
  return $UserModelCopyWith<$Res>(_self.sender, (value) {
    return _then(_self.copyWith(sender: value));
  });
}/// Create a copy of ContactRequest
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$UserModelCopyWith<$Res>? get receiver {
    if (_self.receiver == null) {
    return null;
  }

  return $UserModelCopyWith<$Res>(_self.receiver!, (value) {
    return _then(_self.copyWith(receiver: value));
  });
}
}

// dart format on
