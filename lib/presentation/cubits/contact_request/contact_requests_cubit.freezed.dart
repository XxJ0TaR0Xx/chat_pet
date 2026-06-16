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
mixin _$ContactRequestState {

 List<ContactRequest> get request;
/// Create a copy of ContactRequestState
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$ContactRequestStateCopyWith<ContactRequestState> get copyWith => _$ContactRequestStateCopyWithImpl<ContactRequestState>(this as ContactRequestState, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is ContactRequestState&&const DeepCollectionEquality().equals(other.request, request));
}


@override
int get hashCode => Object.hash(runtimeType,const DeepCollectionEquality().hash(request));

@override
String toString() {
  return 'ContactRequestState(request: $request)';
}


}

/// @nodoc
abstract mixin class $ContactRequestStateCopyWith<$Res>  {
  factory $ContactRequestStateCopyWith(ContactRequestState value, $Res Function(ContactRequestState) _then) = _$ContactRequestStateCopyWithImpl;
@useResult
$Res call({
 List<ContactRequest> request
});




}
/// @nodoc
class _$ContactRequestStateCopyWithImpl<$Res>
    implements $ContactRequestStateCopyWith<$Res> {
  _$ContactRequestStateCopyWithImpl(this._self, this._then);

  final ContactRequestState _self;
  final $Res Function(ContactRequestState) _then;

/// Create a copy of ContactRequestState
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? request = null,}) {
  return _then(_self.copyWith(
request: null == request ? _self.request : request // ignore: cast_nullable_to_non_nullable
as List<ContactRequest>,
  ));
}

}


/// Adds pattern-matching-related methods to [ContactRequestState].
extension ContactRequestStatePatterns on ContactRequestState {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _ContactRequestState value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _ContactRequestState() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _ContactRequestState value)  $default,){
final _that = this;
switch (_that) {
case _ContactRequestState():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _ContactRequestState value)?  $default,){
final _that = this;
switch (_that) {
case _ContactRequestState() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( List<ContactRequest> request)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _ContactRequestState() when $default != null:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( List<ContactRequest> request)  $default,) {final _that = this;
switch (_that) {
case _ContactRequestState():
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( List<ContactRequest> request)?  $default,) {final _that = this;
switch (_that) {
case _ContactRequestState() when $default != null:
return $default(_that.request);case _:
  return null;

}
}

}

/// @nodoc


class _ContactRequestState extends ContactRequestState {
  const _ContactRequestState({final  List<ContactRequest> request = const []}): _request = request,super._();
  

 final  List<ContactRequest> _request;
@override@JsonKey() List<ContactRequest> get request {
  if (_request is EqualUnmodifiableListView) return _request;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableListView(_request);
}


/// Create a copy of ContactRequestState
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$ContactRequestStateCopyWith<_ContactRequestState> get copyWith => __$ContactRequestStateCopyWithImpl<_ContactRequestState>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _ContactRequestState&&const DeepCollectionEquality().equals(other._request, _request));
}


@override
int get hashCode => Object.hash(runtimeType,const DeepCollectionEquality().hash(_request));

@override
String toString() {
  return 'ContactRequestState(request: $request)';
}


}

/// @nodoc
abstract mixin class _$ContactRequestStateCopyWith<$Res> implements $ContactRequestStateCopyWith<$Res> {
  factory _$ContactRequestStateCopyWith(_ContactRequestState value, $Res Function(_ContactRequestState) _then) = __$ContactRequestStateCopyWithImpl;
@override @useResult
$Res call({
 List<ContactRequest> request
});




}
/// @nodoc
class __$ContactRequestStateCopyWithImpl<$Res>
    implements _$ContactRequestStateCopyWith<$Res> {
  __$ContactRequestStateCopyWithImpl(this._self, this._then);

  final _ContactRequestState _self;
  final $Res Function(_ContactRequestState) _then;

/// Create a copy of ContactRequestState
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? request = null,}) {
  return _then(_ContactRequestState(
request: null == request ? _self._request : request // ignore: cast_nullable_to_non_nullable
as List<ContactRequest>,
  ));
}


}

// dart format on
