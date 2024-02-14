import 'package:equatable/equatable.dart';

class MessageEntity extends Equatable {
  final int? id;
  final String? messageText;
  final int? projectId;
  final String? messageTypeName;
  final String? messageParticipantType;
  final String? publishDate;
  final String? updatedAt;
  final String? messageStatus;

  const MessageEntity({
    this.id,
    this.messageText,
    this.projectId,
    this.messageTypeName,
    this.messageParticipantType,
    this.publishDate,
    this.updatedAt,
    this.messageStatus,
  });

  @override
  List<Object?> get props {
    return [
      id,
      messageText,
      projectId,
      messageTypeName,
      messageParticipantType,
      publishDate,
      updatedAt,
      messageStatus,
    ];
  }
}
