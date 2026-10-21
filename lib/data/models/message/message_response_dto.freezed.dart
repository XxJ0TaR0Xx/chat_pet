// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'message_response_dto.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;

/// @nodoc
mixin _$MessageModelResponseDto {

 List<MessageDto> get items;@JsonKey(name: 'next_cursor') String? get cursor;
/// Create a copy of MessageModelResponseDto
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$MessageModelResponseDtoCopyWith<MessageModelResponseDto> get copyWith => _$MessageModelResponseDtoCopyWithImpl<MessageModelResponseDto>(this as MessageModelResponseDto, _$identity);

  /// Serializes this MessageModelResponseDto to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is MessageModelResponseDto&&const DeepCollectionEquality().equals(other.items, items)&&(identical(other.cursor, cursor) || other.cursor == cursor));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,const DeepCollectionEquality().hash(items),cursor);

@override
String toString() {
  return 'MessageModelResponseDto(items: $items, cursor: $cursor)';
}


}

/// @nodoc
abstract mixin class $MessageModelResponseDtoCopyWith<$Res>  {
  factory $MessageModelResponseDtoCopyWith(MessageModelResponseDto value, $Res Function(MessageModelResponseDto) _then) = _$MessageModelResponseDtoCopyWithImpl;
@useResult
$Res call({
 List<MessageDto> items,@JsonKey(name: 'next_cursor') String? cursor
});




}
/// @nodoc
class _$MessageModelResponseDtoCopyWithImpl<$Res>
    implements $MessageModelResponseDtoCopyWith<$Res> {
  _$MessageModelResponseDtoCopyWithImpl(this._self, this._then);

  final MessageModelResponseDto _self;
  final $Res Function(MessageModelResponseDto) _then;

/// Create a copy of MessageModelResponseDto
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? items = null,Object? cursor = freezed,}) {
  return _then(_self.copyWith(
items: null == items ? _self.items : items // ignore: cast_nullable_to_non_nullable
as List<MessageDto>,cursor: freezed == cursor ? _self.cursor : cursor // ignore: cast_nullable_to_non_nullable
as String?,
  ));
}

}


/// Adds pattern-matching-related methods to [MessageModelResponseDto].
extension MessageModelResponseDtoPatterns on MessageModelResponseDto {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _MessageModelResponseDto value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _MessageModelResponseDto() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _MessageModelResponseDto value)  $default,){
final _that = this;
switch (_that) {
case _MessageModelResponseDto():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _MessageModelResponseDto value)?  $default,){
final _that = this;
switch (_that) {
case _MessageModelResponseDto() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( List<MessageDto> items, @JsonKey(name: 'next_cursor')  String? cursor)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _MessageModelResponseDto() when $default != null:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( List<MessageDto> items, @JsonKey(name: 'next_cursor')  String? cursor)  $default,) {final _that = this;
switch (_that) {
case _MessageModelResponseDto():
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( List<MessageDto> items, @JsonKey(name: 'next_cursor')  String? cursor)?  $default,) {final _that = this;
switch (_that) {
case _MessageModelResponseDto() when $default != null:
return $default(_that.items,_that.cursor);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _MessageModelResponseDto implements MessageModelResponseDto {
  const _MessageModelResponseDto({required final  List<MessageDto> items, @JsonKey(name: 'next_cursor') this.cursor}): _items = items;
  factory _MessageModelResponseDto.fromJson(Map<String, dynamic> json) => _$MessageModelResponseDtoFromJson(json);

 final  List<MessageDto> _items;
@override List<MessageDto> get items {
  if (_items is EqualUnmodifiableListView) return _items;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableListView(_items);
}

@override@JsonKey(name: 'next_cursor') final  String? cursor;

/// Create a copy of MessageModelResponseDto
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$MessageModelResponseDtoCopyWith<_MessageModelResponseDto> get copyWith => __$MessageModelResponseDtoCopyWithImpl<_MessageModelResponseDto>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$MessageModelResponseDtoToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _MessageModelResponseDto&&const DeepCollectionEquality().equals(other._items, _items)&&(identical(other.cursor, cursor) || other.cursor == cursor));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,const DeepCollectionEquality().hash(_items),cursor);

@override
String toString() {
  return 'MessageModelResponseDto(items: $items, cursor: $cursor)';
}


}

/// @nodoc
abstract mixin class _$MessageModelResponseDtoCopyWith<$Res> implements $MessageModelResponseDtoCopyWith<$Res> {
  factory _$MessageModelResponseDtoCopyWith(_MessageModelResponseDto value, $Res Function(_MessageModelResponseDto) _then) = __$MessageModelResponseDtoCopyWithImpl;
@override @useResult
$Res call({
 List<MessageDto> items,@JsonKey(name: 'next_cursor') String? cursor
});




}
/// @nodoc
class __$MessageModelResponseDtoCopyWithImpl<$Res>
    implements _$MessageModelResponseDtoCopyWith<$Res> {
  __$MessageModelResponseDtoCopyWithImpl(this._self, this._then);

  final _MessageModelResponseDto _self;
  final $Res Function(_MessageModelResponseDto) _then;

/// Create a copy of MessageModelResponseDto
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? items = null,Object? cursor = freezed,}) {
  return _then(_MessageModelResponseDto(
items: null == items ? _self._items : items // ignore: cast_nullable_to_non_nullable
as List<MessageDto>,cursor: freezed == cursor ? _self.cursor : cursor // ignore: cast_nullable_to_non_nullable
as String?,
  ));
}


}

// dart format on
