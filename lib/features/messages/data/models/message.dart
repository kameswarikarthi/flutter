import 'package:message_app/features/messages/domain/entities/message.dart';
import 'package:message_app/core/constants/constants.dart';

class MessageModel {
  bool? status;
  String? message;
  Data? data;

  MessageModel({this.status, this.message, this.data});

  MessageModel.fromJson(Map<String, dynamic> json) {
    status = json['Status'];
    message = json['Message'];
    data = json['Data'] != null ? new Data.fromJson(json['Data']) : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['Status'] = this.status;
    data['Message'] = this.message;
    if (this.data != null) {
      data['Data'] = this.data!.toJson();
    }
    return data;
  }
}

class Data {
  List<ListData>? listData;
  int? count;

  Data({this.listData, this.count});

  Data.fromJson(Map<String, dynamic> json) {
    if (json['List'] != null) {
      listData = <ListData>[];
      json['List'].forEach((v) {
        listData!.add(new ListData.fromJson(v));
      });
    }
    count = json['Count'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    if (this.listData != null) {
      data['ListData'] = this.listData!.map((v) => v.toJson()).toList();
    }
    data['Count'] = this.count;
    return data;
  }
}

class ListData {
  int? messageId;
  String? messageText;
  String? endDate;
  String? publishDate;
  String? createdAt;
  String? updatedAt;
  MessageType? messageType;
  List<Project>? project;
  MessageStatus? messageStatus;
  List<MessageParticipantType>? messageParticipantType;

  ListData(
      {this.messageId,
      this.messageText,
      this.endDate,
      this.publishDate,
      this.createdAt,
      this.updatedAt,
      this.messageType,
      this.project,
      this.messageStatus,
      this.messageParticipantType});

  ListData.fromJson(Map<String, dynamic> json) {
    messageId = json['MessageId'];
    messageText = json['MessageText'];
    endDate = json['EndDate'];
    publishDate = json['PublishDate'];
    createdAt = json['CreatedAt'];
    updatedAt = json['UpdatedAt'];
    messageType = json['MessageType'] != null
        ? new MessageType.fromJson(json['MessageType'])
        : null;
    if (json['Project'] != null) {
      project = <Project>[];
      json['Project'].forEach((v) {
        project!.add(new Project.fromJson(v));
      });
    }
    messageStatus = json['MessageStatus'] != null
        ? new MessageStatus.fromJson(json['MessageStatus'])
        : null;
    if (json['MessageParticipantType'] != null) {
      messageParticipantType = <MessageParticipantType>[];
      json['MessageParticipantType'].forEach((v) {
        messageParticipantType!.add(new MessageParticipantType.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['MessageId'] = this.messageId;
    data['MessageText'] = this.messageText;
    data['EndDate'] = this.endDate;
    data['PublishDate'] = this.publishDate;
    data['CreatedAt'] = this.createdAt;
    data['UpdatedAt'] = this.updatedAt;
    if (this.messageType != null) {
      data['MessageType'] = this.messageType!.toJson();
    }
    if (this.project != null) {
      data['Project'] = this.project!.map((v) => v.toJson()).toList();
    }
    if (this.messageStatus != null) {
      data['MessageStatus'] = this.messageStatus!.toJson();
    }
    if (this.messageParticipantType != null) {
      data['MessageParticipantType'] =
          this.messageParticipantType!.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class MessageType {
  int? messageTypeId;
  String? messageTypeName;

  MessageType({this.messageTypeId, this.messageTypeName});

  MessageType.fromJson(Map<String, dynamic> json) {
    messageTypeId = json['MessageTypeId'];
    messageTypeName = json['MessageTypeName'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['MessageTypeId'] = this.messageTypeId;
    data['MessageTypeName'] = this.messageTypeName;
    return data;
  }
}

class Project {
  int? projectId;
  Project? project;

  Project({this.projectId, this.project});

  Project.fromJson(Map<String, dynamic> json) {
    projectId = json['ProjectId'];
    project =
        json['Project'] != null ? new Project.fromJson(json['Project']) : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['ProjectId'] = this.projectId;
    if (this.project != null) {
      data['Project'] = this.project!.toJson();
    }
    return data;
  }
}

class MessageStatus {
  int? messageStatusId;
  String? messageStatusName;

  MessageStatus({this.messageStatusId, this.messageStatusName});

  MessageStatus.fromJson(Map<String, dynamic> json) {
    messageStatusId = json['MessageStatusId'];
    messageStatusName = json['MessageStatusName'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['MessageStatusId'] = this.messageStatusId;
    data['MessageStatusName'] = this.messageStatusName;
    return data;
  }
}

class MessageParticipantType {
  int? roleId;
  Role? role;

  MessageParticipantType({this.roleId, this.role});

  MessageParticipantType.fromJson(Map<String, dynamic> json) {
    roleId = json['RoleId'];
    role = json['Role'] != null ? new Role.fromJson(json['Role']) : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['RoleId'] = this.roleId;
    if (this.role != null) {
      data['Role'] = this.role!.toJson();
    }
    return data;
  }
}

class Role {
  String? roleName;

  Role({this.roleName});

  Role.fromJson(Map<String, dynamic> json) {
    roleName = json['RoleName'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['RoleName'] = this.roleName;
    return data;
  }
}
