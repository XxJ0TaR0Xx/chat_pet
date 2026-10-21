// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'contact_requests_cubit.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;
/// @nodoc
mixin _$ContactModelRequestState {

 List<ContactModelRequest> get request;
/// Create a copy of ContactModelRequestState
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$ContactModelRequestStateCopyWith<ContactModelRequestState> get copyWith => _$ContactModelRequestStateCopyWithImpl<ContactModelRequestState>(this as ContactModelRequestState, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is ContactModelRequestState&&const DeepCollectionEquality().equals(other.request, request));
}


@override
int get hashCode => Object.hash(runtimeType,const DeepCollectionEquality().hash(request));

@override
String toString() {
  return 'ContactModelRequestState(request: $request)';
}


}

/// @nodoc
abstract mixin class $ContactModelRequestStateCopyWith<$Res>  {
  factory $ContactModelRequestStateCopyWith(ContactModelRequestState value, $Res Function(ContactModelRequestState) _then) = _$ContactModelRequestStateCopyWithImpl;
@useResult
$Res call({
 List<ContactModelRequest> request
});




}
/// @nodoc
class _$ContactModelRequestStateCopyWithImpl<$Res>
    implements $ContactModelRequestStateCopyWith<$Res> {
  _$ContactModelRequestStateCopyWithImpl(this._self, this._then);

  final ContactModelRequestState _self;
  final $Res Function(ContactModelRequestState) _then;

/// Create a copy of ContactModelRequestState
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? request = null,}) {
  return _then(_self.copyWith(
request: null == request ? _self.request : request // ignore: cast_nullable_to_non_nullable
as List<ContactModelRequest>,
  ));
}

}


/// Adds pattern-matching-related methods to [ContactModelRequestState].
extension ContactModelRequestStatePatterns on ContactModelRequestState {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _ContactModelRequestState value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _ContactModelRequestState() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _ContactModelRequestState value)  $default,){
final _that = this;
switch (_that) {
case _ContactModelRequestState():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _ContactModelRequestState value)?  $default,){
final _that = this;
switch (_that) {
case _ContactModelRequestState() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( List<ContactModelRequest> request)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _ContactModelRequestState() when $default != null:
return $default(_that.request);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( List<ContactModelRequest> request)  $default,) {final _that = this;
switch (_that) {
case _ContactModelRequestState():
return $default(_that.request);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( List<ContactModelRequest> request)?  $default,) {final _that = this;
switch (_that) {
case _ContactModelRequestState() when $default != null:
return $default(_that.request);case _:
  return null;

}
}

}

/// @nodoc


class _ContactModelRequestState extends ContactModelRequestState {
  const _ContactModelRequestState({final  List<ContactModelRequest> request = const []}): _request = request,super._();
  

 final  List<ContactModelRequest> _request;
@override@JsonKey() List<ContactModelRequest> get request {
  if (_request is EqualUnmodifiableListView) return _request;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableListView(_request);
}


/// Create a copy of ContactModelRequestState
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$ContactModelRequestStateCopyWith<_ContactModelRequestState> get copyWith => __$ContactModelRequestStateCopyWithImpl<_ContactModelRequestState>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _ContactModelRequestState&&const DeepCollectionEquality().equals(other._request, _request));
}


@override
int get hashCode => Object.hash(runtimeType,const DeepCollectionEquality().hash(_request));

@override
String toString() {
  return 'ContactModelRequestState(request: $request)';
}


}

/// @nodoc
abstract mixin class _$ContactModelRequestStateCopyWith<$Res> implements $ContactModelRequestStateCopyWith<$Res> {
  factory _$ContactModelRequestStateCopyWith(_ContactModelRequestState value, $Res Function(_ContactModelRequestState) _then) = __$ContactModelRequestStateCopyWithImpl;
@override @useResult
$Res call({
 List<ContactModelRequest> request
});




}
/// @nodoc
class __$ContactModelRequestStateCopyWithImpl<$Res>
    implements _$ContactModelRequestStateCopyWith<$Res> {
  __$ContactModelRequestStateCopyWithImpl(this._self, this._then);

  final _ContactModelRequestState _self;
  final $Res Function(_ContactModelRequestState) _then;

/// Create a copy of ContactModelRequestState
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? request = null,}) {
  return _then(_ContactModelRequestState(
request: null == request ? _self._request : request // ignore: cast_nullable_to_non_nullable
as List<ContactModelRequest>,
  ));
}


}

// dart format on
