class PhoneVerifyModels {
  bool? success;
  int? status;
  String? timestamp;
  Data? data;

  PhoneVerifyModels({this.success, this.status, this.timestamp, this.data});

  PhoneVerifyModels.fromJson(Map<String, dynamic> json) {
    success = json['success'];
    status = json['status'];
    timestamp = json['timestamp'];
    data = json['data'] != null ? new Data.fromJson(json['data']) : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['success'] = this.success;
    data['status'] = this.status;
    data['timestamp'] = this.timestamp;
    if (this.data != null) {
      data['data'] = this.data!.toJson();
    }
    return data;
  }
}

class Data {
  bool? success;
  String? sessionId;

  Data({this.success, this.sessionId});

  Data.fromJson(Map<String, dynamic> json) {
    success = json['success'];
    sessionId = json['session_id'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['success'] = this.success;
    data['session_id'] = this.sessionId;
    return data;
  }
}
