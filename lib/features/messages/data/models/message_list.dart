class MessageListModel {
  bool? status;
  String? message;
  Data? data;

  MessageListModel({this.status, this.message, this.data});

  MessageListModel.fromJson(Map<String, dynamic> json) {
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
  List<ShowInDatas>? showInDatas;
  List<MessageTypeData>? messageTypeData;
  List<PriorityMessageData>? priorityMessageData;
  List<QuestionTypeData>? questionTypeData;
  List<MessageStatusData>? messageStatusData;

  Data(
      {this.showInDatas,
      this.messageTypeData,
      this.priorityMessageData,
      this.questionTypeData,
      this.messageStatusData});

  Data.fromJson(Map<String, dynamic> json) {
    if (json['showInDatas'] != null) {
      showInDatas = <ShowInDatas>[];
      json['showInDatas'].forEach((v) {
        showInDatas!.add(new ShowInDatas.fromJson(v));
      });
    }
    if (json['MessageTypeData'] != null) {
      messageTypeData = <MessageTypeData>[];
      json['MessageTypeData'].forEach((v) {
        messageTypeData!.add(new MessageTypeData.fromJson(v));
      });
    }
    if (json['PriorityMessageData'] != null) {
      priorityMessageData = <PriorityMessageData>[];
      json['PriorityMessageData'].forEach((v) {
        priorityMessageData!.add(new PriorityMessageData.fromJson(v));
      });
    }
    if (json['QuestionTypeData'] != null) {
      questionTypeData = <QuestionTypeData>[];
      json['QuestionTypeData'].forEach((v) {
        questionTypeData!.add(new QuestionTypeData.fromJson(v));
      });
    }
    if (json['MessageStatusData'] != null) {
      messageStatusData = <MessageStatusData>[];
      json['MessageStatusData'].forEach((v) {
        messageStatusData!.add(new MessageStatusData.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    if (this.showInDatas != null) {
      data['showInDatas'] = this.showInDatas!.map((v) => v.toJson()).toList();
    }
    if (this.messageTypeData != null) {
      data['MessageTypeData'] =
          this.messageTypeData!.map((v) => v.toJson()).toList();
    }
    if (this.priorityMessageData != null) {
      data['PriorityMessageData'] =
          this.priorityMessageData!.map((v) => v.toJson()).toList();
    }
    if (this.questionTypeData != null) {
      data['QuestionTypeData'] =
          this.questionTypeData!.map((v) => v.toJson()).toList();
    }
    if (this.messageStatusData != null) {
      data['MessageStatusData'] =
          this.messageStatusData!.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class ShowInDatas {
  int? showInId;
  String? showInName;

  ShowInDatas({this.showInId, this.showInName});

  ShowInDatas.fromJson(Map<String, dynamic> json) {
    showInId = json['ShowInId'];
    showInName = json['ShowInName'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['ShowInId'] = this.showInId;
    data['ShowInName'] = this.showInName;
    return data;
  }
}

class MessageTypeData {
  int? messageTypeId;
  String? messageTypeName;

  MessageTypeData({this.messageTypeId, this.messageTypeName});

  MessageTypeData.fromJson(Map<String, dynamic> json) {
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

class PriorityMessageData {
  int? priorityMessageId;
  String? priorityMessageName;

  PriorityMessageData({this.priorityMessageId, this.priorityMessageName});

  PriorityMessageData.fromJson(Map<String, dynamic> json) {
    priorityMessageId = json['PriorityMessageId'];
    priorityMessageName = json['PriorityMessageName'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['PriorityMessageId'] = this.priorityMessageId;
    data['PriorityMessageName'] = this.priorityMessageName;
    return data;
  }
}

class QuestionTypeData {
  int? pollOptionTypeId;
  String? typeName;

  QuestionTypeData({this.pollOptionTypeId, this.typeName});

  QuestionTypeData.fromJson(Map<String, dynamic> json) {
    pollOptionTypeId = json['PollOptionTypeId'];
    typeName = json['TypeName'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['PollOptionTypeId'] = this.pollOptionTypeId;
    data['TypeName'] = this.typeName;
    return data;
  }
}

class MessageStatusData {
  int? messageStatusId;
  String? messageStatusName;

  MessageStatusData({this.messageStatusId, this.messageStatusName});

  MessageStatusData.fromJson(Map<String, dynamic> json) {
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
