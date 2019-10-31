class Modules {
  String moduleId;
  String moduleNum;
  String moduleName;
  String moduleURI;
  String notice;
  String linkname;
  String icon;
  String jumpURL;
  String categoryId;
  String ifMain;

  Modules(
      {this.moduleId,
      this.moduleNum,
      this.moduleName,
      this.moduleURI,
      this.notice,
      this.linkname,
      this.icon,
      this.jumpURL,
      this.categoryId,
      this.ifMain});

  Modules.fromJson(Map<String, dynamic> json) {
    moduleId = json['module_id'];
    moduleNum = json['module_num'];
    moduleName = json['module_name'];
    moduleURI = json['module_URI'];
    notice = json['notice'];
    linkname = json['linkname'];
    icon = json['icon'];
    jumpURL = json['jump_URL'];
    categoryId = json['category_id'];
    ifMain = json['if_main'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['module_id'] = this.moduleId;
    data['module_num'] = this.moduleNum;
    data['module_name'] = this.moduleName;
    data['module_URI'] = this.moduleURI;
    data['notice'] = this.notice;
    data['linkname'] = this.linkname;
    data['icon'] = this.icon;
    data['jump_URL'] = this.jumpURL;
    data['category_id'] = this.categoryId;
    data['if_main'] = this.ifMain;
    return data;
  }
}

final List<Modules> dataModule = [
  Modules(
      moduleId: "2",
      moduleNum: "0002",
      moduleName: "投票",
      moduleURI: "../toupiao/vote_list.html?user_id=7006",
      notice: "",
      linkname: "toupiao",
      icon:
          "http://zdg.rzdgrm.cn:9090/upload_pics/main/img20190705/25_20190705045901_934_5349.png",
      jumpURL: "",
      categoryId: "3",
      ifMain: "0"),
  Modules(
      moduleId: "5",
      moduleNum: "0005",
      moduleName: "抽奖",
      moduleURI: "../lottery_draw/lottery_draw.html?user_id=7006",
      notice: "",
      linkname: "lottery_draw",
      icon:
          "http://zdg.rzdgrm.cn:9090/upload_pics/main/img20190705/25_20190705045851_579_1391.png",
      jumpURL: "",
      categoryId: "3",
      ifMain: "0"),
  Modules(
      moduleId: "146",
      moduleNum: "0145",
      moduleName: "活动",
      moduleURI: "../activity/Info/Info.html?user_id=7006",
      notice: "",
      linkname: "activity",
      icon:
          "http://zdg.rzdgrm.cn:9090/upload_pics/main/img20190709/25_20190709084858_291_1421.png",
      jumpURL: "",
      categoryId: "3",
      ifMain: "0"),
  Modules(
      moduleId: "52",
      moduleNum: "0052",
      moduleName: "看电视",
      moduleURI:
          "http://zdg.rzdgrm.cn:9090/m.web/video/index1.html?user_id=7006",
      notice: "",
      linkname: "watchTV",
      icon:
          "http://zdg.rzdgrm.cn:9090/upload_pics/main/img20190705/25_20190705100103_015_7684.png",
      jumpURL: "",
      categoryId: "3",
      ifMain: "0"),
  Modules(
      moduleId: "53",
      moduleNum: "0053",
      moduleName: "听广播",
      moduleURI:
          "http://zdg.rzdgrm.cn:9090/m.web/radio/index1.html?user_id=7006",
      notice: "",
      linkname: "radio",
      icon:
          "http://zdg.rzdgrm.cn:9090/upload_pics/main/img20190705/25_20190705095554_984_7299.png",
      jumpURL: "",
      categoryId: "3",
      ifMain: "0"),
];
