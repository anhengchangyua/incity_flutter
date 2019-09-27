class BannerList {
  String icon;
  String url;

  BannerList({this.icon, this.url});

  BannerList.fromJson(Map<String, dynamic> json) {
    icon = json['icon'];
    url = json['url'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['icon'] = this.icon;
    data['url'] = this.url;
    return data;
  }
}

final List<BannerList> datas = [
  BannerList(
    icon: 'Candy Shop',
    url: 'https://resources.ninghao.org/images/candy-shop.jpg',
  ),
  BannerList(
    icon: 'Childhood in a picture',
    url: 'https://resources.ninghao.org/images/childhood-in-a-picture.jpg',
  ),
  BannerList(
    icon: 'Contained',
    url: 'https://resources.ninghao.org/images/contained.jpg',
  ),
  BannerList(
    icon: 'Dragon',
    url: 'https://resources.ninghao.org/images/dragon.jpg',
  ),
  BannerList(
    icon: 'White Dragon',
    url: 'https://resources.ninghao.org/images/white-dragon.jpg',
  )
];
