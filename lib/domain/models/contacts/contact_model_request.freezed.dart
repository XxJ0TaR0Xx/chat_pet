// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'contact_model_request.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;
/// @nodoc
mixin _$ContactModelRequest {

 String get id; UserModel get sender; UserModel? get receiver;
/// Create a copy of ContactModelRequest
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$ContactModelRequestCopyWith<ContactModelRequest> get copyWith => _$ContactModelRequestCopyWithImpl<ContactModelRequest>(this as ContactModelRequest, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is ContactModelRequest&&(identical(other.id, id) || other.id == id)&&(identical(other.sender, sender) || other.sender == sender)&&(identical(other.receiver, receiver) || other.receiver == receiver));
}


@override
int get hashCode => Object.hash(runtimeType,id,sender,receiver);

@override
String toString() {
  return 'ContactModelRequest(id: $id, sender: $sender, receiver: $receiver)';
}


}

/// @nodoc
abstract mixin class $ContactModelRequestCopyWith<$Res>  {
  factory $ContactModelRequestCopyWith(ContactModelRequest value, $Res Function(ContactModelRequest) _then) = _$ContactModelRequestCopyWithImpl;
@useResult
$Res call({
 String id, UserModel sender, UserModel? receiver
});


$UserModelCopyWith<$Res> get sender;$UserModelCopyWith<$Res>? get receiver;

}
/// @nodoc
class _$ContactModelRequestCopyWithImpl<$Res>
    implements $ContactModelRequestCopyWith<$Res> {
  _$ContactModelRequestCopyWithImpl(this._self, this._then);

  final ContactModelRequest _self;
  final $Res Function(ContactModelRequest) _then;

/// Create a copy of ContactModelRequest
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? id = null,Object? sender = null,Object? receiver = freezed,}) {
  return _then(_self.copyWith(
id: null == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as String,sender: null == sender ? _self.sender : sender // ignore: cast_nullable_to_non_nullable
as UserModel,receiver: freezed == receiver ? _self.receiver : receiver // ignore: cast_nullable_to_non_nullable
as UserModel?,
  ));
}
/// Create a copy of ContactModelRequest
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$UserModelCopyWith<$Res> get sender {
  
  return $UserModelCopyWith<$Res>(_self.sender, (value) {
    return _then(_self.copyWith(sender: value));
  });
}/// Create a copy of ContactModelRequest
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


/// Adds pattern-matching-related methods to [ContactModelRequest].
extension ContactModelRequestPatterns on ContactModelRequest {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _ContactModelRequest value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _ContactModelRequest() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _ContactModelRequest value)  $default,){
final _that = this;
switch (_that) {
case _ContactModelRequest():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _ContactModelRequest value)?  $default,){
final _that = this;
switch (_that) {
case _ContactModelRequest() when $default != null:
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
case _ContactModelRequest() when $default != null:
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
case _ContactModelRequest():
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
case _ContactModelRequest() when $default != null:
return $default(_that.id,_that.sender,_that.receiver);case _:
  return null;

}
}

}

/// @nodoc


class _ContactModelRequest implements ContactModelRequest {
  const _ContactModelRequest({required this.id, required this.sender, this.receiver});
  

@override final  String id;
@override final  UserModel sender;
@override final  UserModel? receiver;

/// Create a copy of ContactModelRequest
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$ContactModelRequestCopyWith<_ContactModelRequest> get copyWith => __$ContactModelRequestCopyWithImpl<_ContactModelRequest>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _ContactModelRequest&&(identical(other.id, id) || other.id == id)&&(identical(other.sender, sender) || other.sender == sender)&&(identical(other.receiver, receiver) || other.receiver == receiver));
}


@override
int get hashCode => Object.hash(runtimeType,id,sender,receiver);

@override
String toString() {
  return 'ContactModelRequest(id: $id, sender: $sender, receiver: $receiver)';
}


}

/// @nodoc
abstract mixin class _$ContactModelRequestCopyWith<$Res> implements $ContactModelRequestCopyWith<$Res> {
  factory _$ContactModelRequestCopyWith(_ContactModelRequest value, $Res Function(_ContactModelRequest) _then) = __$ContactModelRequestCopyWithImpl;
@override @useResult
$Res call({
 String id, UserModel sender, UserModel? receiver
});


@override $UserModelCopyWith<$Res> get sender;@override $UserModelCopyWith<$Res>? get receiver;

}
/// @nodoc
class __$ContactModelRequestCopyWithImpl<$Res>
    implements _$ContactModelRequestCopyWith<$Res> {
  __$ContactModelRequestCopyWithImpl(this._self, this._then);

  final _ContactModelRequest _self;
  final $Res Function(_ContactModelRequest) _then;

/// Create a copy of ContactModelRequest
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? id = null,Object? sender = null,Object? receiver = freezed,}) {
  return _then(_ContactModelRequest(
id: null == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as String,sender: null == sender ? _self.sender : sender // ignore: cast_nullable_to_non_nullable
as UserModel,receiver: freezed == receiver ? _self.receiver : receiver // ignore: cast_nullable_to_non_nullable
as UserModel?,
  ));
}

/// Create a copy of ContactModelRequest
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$UserModelCopyWith<$Res> get sender {
  
  return $UserModelCopyWith<$Res>(_self.sender, (value) {
    return _then(_self.copyWith(sender: value));
  });
}/// Create a copy of ContactModelRequest
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
