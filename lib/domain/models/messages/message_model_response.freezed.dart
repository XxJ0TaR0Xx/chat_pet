// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'message_model_response.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;
/// @nodoc
mixin _$MessageModelResponse {

 List<MessageModel> get items; String? get cursor;
/// Create a copy of MessageModelResponse
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$MessageModelResponseCopyWith<MessageModelResponse> get copyWith => _$MessageModelResponseCopyWithImpl<MessageModelResponse>(this as MessageModelResponse, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is MessageModelResponse&&const DeepCollectionEquality().equals(other.items, items)&&(identical(other.cursor, cursor) || other.cursor == cursor));
}


@override
int get hashCode => Object.hash(runtimeType,const DeepCollectionEquality().hash(items),cursor);

@override
String toString() {
  return 'MessageModelResponse(items: $items, cursor: $cursor)';
}


}

/// @nodoc
abstract mixin class $MessageModelResponseCopyWith<$Res>  {
  factory $MessageModelResponseCopyWith(MessageModelResponse value, $Res Function(MessageModelResponse) _then) = _$MessageModelResponseCopyWithImpl;
@useResult
$Res call({
 List<MessageModel> items, String? cursor
});




}
/// @nodoc
class _$MessageModelResponseCopyWithImpl<$Res>
    implements $MessageModelResponseCopyWith<$Res> {
  _$MessageModelResponseCopyWithImpl(this._self, this._then);

  final MessageModelResponse _self;
  final $Res Function(MessageModelResponse) _then;

/// Create a copy of MessageModelResponse
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? items = null,Object? cursor = freezed,}) {
  return _then(_self.copyWith(
items: null == items ? _self.items : items // ignore: cast_nullable_to_non_nullable
as List<MessageModel>,cursor: freezed == cursor ? _self.cursor : cursor // ignore: cast_nullable_to_non_nullable
as String?,
  ));
}

}


/// Adds pattern-matching-related methods to [MessageModelResponse].
extension MessageModelResponsePatterns on MessageModelResponse {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _MessageModelResponse value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _MessageModelResponse() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _MessageModelResponse value)  $default,){
final _that = this;
switch (_that) {
case _MessageModelResponse():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _MessageModelResponse value)?  $default,){
final _that = this;
switch (_that) {
case _MessageModelResponse() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( List<MessageModel> items,  String? cursor)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _MessageModelResponse() when $default != null:
return $default(_that.items,_that.cursor);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( List<MessageModel> items,  String? cursor)  $default,) {final _that = this;
switch (_that) {
case _MessageModelResponse():
return $default(_that.items,_that.cursor);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( List<MessageModel> items,  String? cursor)?  $default,) {final _that = this;
switch (_that) {
case _MessageModelResponse() when $default != null:
return $default(_that.items,_that.cursor);case _:
  return null;

}
}

}

/// @nodoc


class _MessageModelResponse implements MessageModelResponse {
  const _MessageModelResponse({required final  List<MessageModel> items, this.cursor}): _items = items;
  

 final  List<MessageModel> _items;
@override List<MessageModel> get items {
  if (_items is EqualUnmodifiableListView) return _items;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableListView(_items);
}

@override final  String? cursor;

/// Create a copy of MessageModelResponse
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$MessageModelResponseCopyWith<_MessageModelResponse> get copyWith => __$MessageModelResponseCopyWithImpl<_MessageModelResponse>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _MessageModelResponse&&const DeepCollectionEquality().equals(other._items, _items)&&(identical(other.cursor, cursor) || other.cursor == cursor));
}


@override
int get hashCode => Object.hash(runtimeType,const DeepCollectionEquality().hash(_items),cursor);

@override
String toString() {
  return 'MessageModelResponse(items: $items, cursor: $cursor)';
}


}

/// @nodoc
abstract mixin class _$MessageModelResponseCopyWith<$Res> implements $MessageModelResponseCopyWith<$Res> {
  factory _$MessageModelResponseCopyWith(_MessageModelResponse value, $Res Function(_MessageModelResponse) _then) = __$MessageModelResponseCopyWithImpl;
@override @useResult
$Res call({
 List<MessageModel> items, String? cursor
});




}
/// @nodoc
class __$MessageModelResponseCopyWithImpl<$Res>
    implements _$MessageModelResponseCopyWith<$Res> {
  __$MessageModelResponseCopyWithImpl(this._self, this._then);

  final _MessageModelResponse _self;
  final $Res Function(_MessageModelResponse) _then;

/// Create a copy of MessageModelResponse
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? items = null,Object? cursor = freezed,}) {
  return _then(_MessageModelResponse(
items: null == items ? _self._items : items // ignore: cast_nullable_to_non_nullable
as List<MessageModel>,cursor: freezed == cursor ? _self.cursor : cursor // ignore: cast_nullable_to_non_nullable
as String?,
  ));
}


}

// dart format on
