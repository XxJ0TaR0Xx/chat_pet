// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'chat_dto.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;

/// @nodoc
mixin _$ChatDto {

 String get id; List<ChatMemberDto> get members;@JsonKey(name: 'is_group') bool get isGroup; String? get name;@JsonKey(name: 'create_at') DateTime? get createAt;@JsonKey(name: 'display_name') String? get displayName;@JsonKey(name: 'display_avatar_url') String? get avatarUrl;@JsonKey(name: 'last_message') MessageDto? get lastMessage;@JsonKey(name: 'unread_count') int get unreadCount;
/// Create a copy of ChatDto
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$ChatDtoCopyWith<ChatDto> get copyWith => _$ChatDtoCopyWithImpl<ChatDto>(this as ChatDto, _$identity);

  /// Serializes this ChatDto to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is ChatDto&&(identical(other.id, id) || other.id == id)&&const DeepCollectionEquality().equals(other.members, members)&&(identical(other.isGroup, isGroup) || other.isGroup == isGroup)&&(identical(other.name, name) || other.name == name)&&(identical(other.createAt, createAt) || other.createAt == createAt)&&(identical(other.displayName, displayName) || other.displayName == displayName)&&(identical(other.avatarUrl, avatarUrl) || other.avatarUrl == avatarUrl)&&(identical(other.lastMessage, lastMessage) || other.lastMessage == lastMessage)&&(identical(other.unreadCount, unreadCount) || other.unreadCount == unreadCount));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,id,const DeepCollectionEquality().hash(members),isGroup,name,createAt,displayName,avatarUrl,lastMessage,unreadCount);

@override
String toString() {
  return 'ChatDto(id: $id, members: $members, isGroup: $isGroup, name: $name, createAt: $createAt, displayName: $displayName, avatarUrl: $avatarUrl, lastMessage: $lastMessage, unreadCount: $unreadCount)';
}


}

/// @nodoc
abstract mixin class $ChatDtoCopyWith<$Res>  {
  factory $ChatDtoCopyWith(ChatDto value, $Res Function(ChatDto) _then) = _$ChatDtoCopyWithImpl;
@useResult
$Res call({
 String id, List<ChatMemberDto> members,@JsonKey(name: 'is_group') bool isGroup, String? name,@JsonKey(name: 'create_at') DateTime? createAt,@JsonKey(name: 'display_name') String? displayName,@JsonKey(name: 'display_avatar_url') String? avatarUrl,@JsonKey(name: 'last_message') MessageDto? lastMessage,@JsonKey(name: 'unread_count') int unreadCount
});


$MessageDtoCopyWith<$Res>? get lastMessage;

}
/// @nodoc
class _$ChatDtoCopyWithImpl<$Res>
    implements $ChatDtoCopyWith<$Res> {
  _$ChatDtoCopyWithImpl(this._self, this._then);

  final ChatDto _self;
  final $Res Function(ChatDto) _then;

/// Create a copy of ChatDto
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? id = null,Object? members = null,Object? isGroup = null,Object? name = freezed,Object? createAt = freezed,Object? displayName = freezed,Object? avatarUrl = freezed,Object? lastMessage = freezed,Object? unreadCount = null,}) {
  return _then(_self.copyWith(
id: null == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as String,members: null == members ? _self.members : members // ignore: cast_nullable_to_non_nullable
as List<ChatMemberDto>,isGroup: null == isGroup ? _self.isGroup : isGroup // ignore: cast_nullable_to_non_nullable
as bool,name: freezed == name ? _self.name : name // ignore: cast_nullable_to_non_nullable
as String?,createAt: freezed == createAt ? _self.createAt : createAt // ignore: cast_nullable_to_non_nullable
as DateTime?,displayName: freezed == displayName ? _self.displayName : displayName // ignore: cast_nullable_to_non_nullable
as String?,avatarUrl: freezed == avatarUrl ? _self.avatarUrl : avatarUrl // ignore: cast_nullable_to_non_nullable
as String?,lastMessage: freezed == lastMessage ? _self.lastMessage : lastMessage // ignore: cast_nullable_to_non_nullable
as MessageDto?,unreadCount: null == unreadCount ? _self.unreadCount : unreadCount // ignore: cast_nullable_to_non_nullable
as int,
  ));
}
/// Create a copy of ChatDto
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$MessageDtoCopyWith<$Res>? get lastMessage {
    if (_self.lastMessage == null) {
    return null;
  }

  return $MessageDtoCopyWith<$Res>(_self.lastMessage!, (value) {
    return _then(_self.copyWith(lastMessage: value));
  });
}
}


/// Adds pattern-matching-related methods to [ChatDto].
extension ChatDtoPatterns on ChatDto {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _ChatDto value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _ChatDto() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _ChatDto value)  $default,){
final _that = this;
switch (_that) {
case _ChatDto():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _ChatDto value)?  $default,){
final _that = this;
switch (_that) {
case _ChatDto() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( String id,  List<ChatMemberDto> members, @JsonKey(name: 'is_group')  bool isGroup,  String? name, @JsonKey(name: 'create_at')  DateTime? createAt, @JsonKey(name: 'display_name')  String? displayName, @JsonKey(name: 'display_avatar_url')  String? avatarUrl, @JsonKey(name: 'last_message')  MessageDto? lastMessage, @JsonKey(name: 'unread_count')  int unreadCount)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _ChatDto() when $default != null:
return $default(_that.id,_that.members,_that.isGroup,_that.name,_that.createAt,_that.displayName,_that.avatarUrl,_that.lastMessage,_that.unreadCount);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( String id,  List<ChatMemberDto> members, @JsonKey(name: 'is_group')  bool isGroup,  String? name, @JsonKey(name: 'create_at')  DateTime? createAt, @JsonKey(name: 'display_name')  String? displayName, @JsonKey(name: 'display_avatar_url')  String? avatarUrl, @JsonKey(name: 'last_message')  MessageDto? lastMessage, @JsonKey(name: 'unread_count')  int unreadCount)  $default,) {final _that = this;
switch (_that) {
case _ChatDto():
return $default(_that.id,_that.members,_that.isGroup,_that.name,_that.createAt,_that.displayName,_that.avatarUrl,_that.lastMessage,_that.unreadCount);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( String id,  List<ChatMemberDto> members, @JsonKey(name: 'is_group')  bool isGroup,  String? name, @JsonKey(name: 'create_at')  DateTime? createAt, @JsonKey(name: 'display_name')  String? displayName, @JsonKey(name: 'display_avatar_url')  String? avatarUrl, @JsonKey(name: 'last_message')  MessageDto? lastMessage, @JsonKey(name: 'unread_count')  int unreadCount)?  $default,) {final _that = this;
switch (_that) {
case _ChatDto() when $default != null:
return $default(_that.id,_that.members,_that.isGroup,_that.name,_that.createAt,_that.displayName,_that.avatarUrl,_that.lastMessage,_that.unreadCount);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _ChatDto extends ChatDto {
  const _ChatDto({required this.id, required final  List<ChatMemberDto> members, @JsonKey(name: 'is_group') required this.isGroup, this.name, @JsonKey(name: 'create_at') this.createAt, @JsonKey(name: 'display_name') this.displayName, @JsonKey(name: 'display_avatar_url') this.avatarUrl, @JsonKey(name: 'last_message') this.lastMessage, @JsonKey(name: 'unread_count') this.unreadCount = 0}): _members = members,super._();
  factory _ChatDto.fromJson(Map<String, dynamic> json) => _$ChatDtoFromJson(json);

@override final  String id;
 final  List<ChatMemberDto> _members;
@override List<ChatMemberDto> get members {
  if (_members is EqualUnmodifiableListView) return _members;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableListView(_members);
}

@override@JsonKey(name: 'is_group') final  bool isGroup;
@override final  String? name;
@override@JsonKey(name: 'create_at') final  DateTime? createAt;
@override@JsonKey(name: 'display_name') final  String? displayName;
@override@JsonKey(name: 'display_avatar_url') final  String? avatarUrl;
@override@JsonKey(name: 'last_message') final  MessageDto? lastMessage;
@override@JsonKey(name: 'unread_count') final  int unreadCount;

/// Create a copy of ChatDto
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$ChatDtoCopyWith<_ChatDto> get copyWith => __$ChatDtoCopyWithImpl<_ChatDto>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$ChatDtoToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _ChatDto&&(identical(other.id, id) || other.id == id)&&const DeepCollectionEquality().equals(other._members, _members)&&(identical(other.isGroup, isGroup) || other.isGroup == isGroup)&&(identical(other.name, name) || other.name == name)&&(identical(other.createAt, createAt) || other.createAt == createAt)&&(identical(other.displayName, displayName) || other.displayName == displayName)&&(identical(other.avatarUrl, avatarUrl) || other.avatarUrl == avatarUrl)&&(identical(other.lastMessage, lastMessage) || other.lastMessage == lastMessage)&&(identical(other.unreadCount, unreadCount) || other.unreadCount == unreadCount));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,id,const DeepCollectionEquality().hash(_members),isGroup,name,createAt,displayName,avatarUrl,lastMessage,unreadCount);

@override
String toString() {
  return 'ChatDto(id: $id, members: $members, isGroup: $isGroup, name: $name, createAt: $createAt, displayName: $displayName, avatarUrl: $avatarUrl, lastMessage: $lastMessage, unreadCount: $unreadCount)';
}


}

/// @nodoc
abstract mixin class _$ChatDtoCopyWith<$Res> implements $ChatDtoCopyWith<$Res> {
  factory _$ChatDtoCopyWith(_ChatDto value, $Res Function(_ChatDto) _then) = __$ChatDtoCopyWithImpl;
@override @useResult
$Res call({
 String id, List<ChatMemberDto> members,@JsonKey(name: 'is_group') bool isGroup, String? name,@JsonKey(name: 'create_at') DateTime? createAt,@JsonKey(name: 'display_name') String? displayName,@JsonKey(name: 'display_avatar_url') String? avatarUrl,@JsonKey(name: 'last_message') MessageDto? lastMessage,@JsonKey(name: 'unread_count') int unreadCount
});


@override $MessageDtoCopyWith<$Res>? get lastMessage;

}
/// @nodoc
class __$ChatDtoCopyWithImpl<$Res>
    implements _$ChatDtoCopyWith<$Res> {
  __$ChatDtoCopyWithImpl(this._self, this._then);

  final _ChatDto _self;
  final $Res Function(_ChatDto) _then;

/// Create a copy of ChatDto
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? id = null,Object? members = null,Object? isGroup = null,Object? name = freezed,Object? createAt = freezed,Object? displayName = freezed,Object? avatarUrl = freezed,Object? lastMessage = freezed,Object? unreadCount = null,}) {
  return _then(_ChatDto(
id: null == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as String,members: null == members ? _self._members : members // ignore: cast_nullable_to_non_nullable
as List<ChatMemberDto>,isGroup: null == isGroup ? _self.isGroup : isGroup // ignore: cast_nullable_to_non_nullable
as bool,name: freezed == name ? _self.name : name // ignore: cast_nullable_to_non_nullable
as String?,createAt: freezed == createAt ? _self.createAt : createAt // ignore: cast_nullable_to_non_nullable
as DateTime?,displayName: freezed == displayName ? _self.displayName : displayName // ignore: cast_nullable_to_non_nullable
as String?,avatarUrl: freezed == avatarUrl ? _self.avatarUrl : avatarUrl // ignore: cast_nullable_to_non_nullable
as String?,lastMessage: freezed == lastMessage ? _self.lastMessage : lastMessage // ignore: cast_nullable_to_non_nullable
as MessageDto?,unreadCount: null == unreadCount ? _self.unreadCount : unreadCount // ignore: cast_nullable_to_non_nullable
as int,
  ));
}

/// Create a copy of ChatDto
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$MessageDtoCopyWith<$Res>? get lastMessage {
    if (_self.lastMessage == null) {
    return null;
  }

  return $MessageDtoCopyWith<$Res>(_self.lastMessage!, (value) {
    return _then(_self.copyWith(lastMessage: value));
  });
}
}

// dart format on
