class SubNavList {
  String icon;
  String title;
  String url;
  bool hideAppBar;

  SubNavList({this.icon, this.title, this.url, this.hideAppBar});

  SubNavList.fromJson(Map<String, dynamic> json) {
    icon = json['icon'];
    title = json['title'];
    url = json['url'];
    hideAppBar = json['hideAppBar'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['icon'] = this.icon;
    data['title'] = this.title;
    data['url'] = this.url;
    data['hideAppBar'] = this.hideAppBar;
    return data;
  }
}

final List<SubNavList> datas = [
  SubNavList(
    icon:
        'http://zdg.rzdgrm.cn:9090/upload_pics/main/img20190508/25_20190508113640_686_2650.png',
    title: '政务服务',
    url: 'https://resources.ninghao.org/images/candy-shop.jpg',
  ),
  SubNavList(
    icon:
        'http://zdg.rzdgrm.cn:9090/upload_pics/main/img20190606/25_20190606050443_024_4797.png',
    title: '部门动态',
    url: 'https://resources.ninghao.org/images/childhood-in-a-picture.jpg',
  ),
  SubNavList(
    icon:
        'http://zdg.rzdgrm.cn:9090/upload_pics/main/img20190606/25_20190606051118_972_7066.png',
    title: '走基层',
    url: 'https://resources.ninghao.org/images/contained.jpg',
  ),
  SubNavList(
    icon:
        'http://zdg.rzdgrm.cn:9090/upload_pics/main/img20190505/25_20190505071821_722_7080.png',
    title: '消费维权',
    url: 'https://resources.ninghao.org/images/candy-shop.jpg',
  ),
  SubNavList(
    icon:
        'http://zdg.rzdgrm.cn:9090/upload_pics/main/img20190323/25_20190323104844_212_6225.png',
    title: '平安东港',
    url: 'https://resources.ninghao.org/images/childhood-in-a-picture.jpg',
  ),
  SubNavList(
    icon:
        'http://zdg.rzdgrm.cn:9090/upload_pics/main/img20190813/1_20190813092052_135_8571.png',
    title: '粉丝互动',
    url: 'https://resources.ninghao.org/images/contained.jpg',
  )
];
final List<SubNavList> dataPerson = [
  SubNavList(
    icon:
        'http://zdg.rzdgrm.cn:9090/upload_pics/main/img20190226/25_20190226032248_326_1670.png',
    title: '凌云商城',
    url: 'https://resources.ninghao.org/images/candy-shop.jpg',
  ),
  SubNavList(
    icon:
        'http://zdg.rzdgrm.cn:9090/upload_pics/main/img20190323/25_20190323094722_325_4666.png',
    title: '生活服务',
    url: 'https://resources.ninghao.org/images/childhood-in-a-picture.jpg',
  ),
  SubNavList(
    icon:
        'http://zdg.rzdgrm.cn:9090/upload_pics/main/img20190323/25_20190323113915_834_7995.png',
    title: '演艺票务',
    url: 'https://resources.ninghao.org/images/contained.jpg',
  ),
  SubNavList(
    icon:
        'http://zdg.rzdgrm.cn:9090/upload_pics/main/img20190226/25_20190226032239_688_2722.png',
    title: '数字电视',
    url: 'https://resources.ninghao.org/images/candy-shop.jpg',
  ),
  SubNavList(
    icon:
        'http://zdg.rzdgrm.cn:9090/upload_pics/main/img20190323/25_20190323094722_325_4666.png',
    title: '电影',
    url: 'https://resources.ninghao.org/images/childhood-in-a-picture.jpg',
  ),
  SubNavList(
    icon:
        'http://zdg.rzdgrm.cn:9090/upload_pics/main/img20190323/25_20190323094835_796_3376.png',
    title: '出行票务',
    url: 'https://resources.ninghao.org/images/contained.jpg',
  ),
  SubNavList(
    icon:
    'http://zdg.rzdgrm.cn:9090/main/pics/25_20181215041031_784.png',
    title: '便民查询',
    url: 'https://resources.ninghao.org/images/contained.jpg',
  ),
  SubNavList(
    icon:
    'http://zdg.rzdgrm.cn:9090/upload_pics/main/img20190226/25_20190226045953_455_2331.jpg',
    title: '停车场',
    url: 'https://resources.ninghao.org/images/contained.jpg',
  ),
  SubNavList(
    icon:
    'http://zdg.rzdgrm.cn:9090/upload_pics/main/img20190226/25_20190226032346_206_1714.png',
    title: '公厕',
    url: 'https://resources.ninghao.org/images/contained.jpg',
  ),
  SubNavList(
    icon:
    'http://zdg.rzdgrm.cn:9090/upload_pics/main/img20190226/25_20190226032332_765_1281.png',
    title: '医院',
    url: 'https://resources.ninghao.org/images/contained.jpg',
  ),
  SubNavList(
    icon:
    'http://zdg.rzdgrm.cn:9090/upload_pics/main/img20190226/25_20190226032339_675_7491.png',
    title: '金融网点',
    url: 'https://resources.ninghao.org/images/contained.jpg',
  )
];
