class VerifyOtpModels {
  bool? success;
  Data? data;

  VerifyOtpModels({this.success, this.data});

  VerifyOtpModels.fromJson(Map<String, dynamic> json) {
    success = json['success'];
    data = json['data'] != null ? new Data.fromJson(json['data']) : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['success'] = this.success;
    if (this.data != null) {
      data['data'] = this.data!.toJson();
    }
    return data;
  }
}

class Data {
  String? accessToken;
  String? clientId;
  String? deviceId;
  String? userId;
  String? username;
  String? homeServer;
  String? matrixUsername;
  String? matrixPassword;

  Data(
      {this.accessToken,
        this.clientId,
        this.deviceId,
        this.userId,
        this.username,
        this.homeServer,
        this.matrixUsername,
        this.matrixPassword});

  Data.fromJson(Map<String, dynamic> json) {
    accessToken = json['access_token'];
    clientId = json['client_id'];
    deviceId = json['device_id'];
    userId = json['user_id'];
    username = json['username'];
    homeServer = json['home_server'];
    matrixUsername = json['matrix_username'];
    matrixPassword = json['matrix_password'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['access_token'] = this.accessToken;
    data['client_id'] = this.clientId;
    data['device_id'] = this.deviceId;
    data['user_id'] = this.userId;
    data['username'] = this.username;
    data['home_server'] = this.homeServer;
    data['matrix_username'] = this.matrixUsername;
    data['matrix_password'] = this.matrixPassword;
    return data;
  }
}
