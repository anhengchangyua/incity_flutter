import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_app/model/banner_model.dart';
import 'home_list_item.dart';
import 'package:flutter_swiper/flutter_swiper.dart';
import '../model/banner_model.dart';

// ignore: must_be_immutable
class HomeTabList extends StatefulWidget {
  PageStorageKey pageStorageKey;

  HomeTabList();

  @override
  _HomeTabListState createState() => _HomeTabListState();
}

class _HomeTabListState extends State<HomeTabList>
    with AutomaticKeepAliveClientMixin {
  ScrollController _scrollController = ScrollController();

  @override
  void initState() {
    _scrollController.addListener(() {
      if (_scrollController.position.pixels ==
          _scrollController.position.maxScrollExtent) {}
    });
    super.initState();
  }

  @override
  void dispose() {
    _scrollController.dispose();
    super.dispose();
  }

  //缓存页面
  @override
  bool get wantKeepAlive => true;

  @override
  Widget build(BuildContext context) {
    return NotificationListener(
      // ignore: missing_return
      onNotification: (notification) {},
      child: RefreshIndicator(
        onRefresh: () async {
          //app有自己的加载框样式，不使用RefreshIndicator拉出来的圆球作为加载框。所以onRefresh立即返回，让圆球立即消失
          return;
        },
        child: CustomScrollView(
          physics:
              AlwaysScrollableScrollPhysics(parent: ClampingScrollPhysics()),
          slivers: <Widget>[
            SliverToBoxAdapter(
                child: Container(
              height: 130 + 16 * 2.0,
              padding: EdgeInsets.all(12),
              child: ClipRRect(
                borderRadius: BorderRadius.circular((6)),
                child: (datas == null || datas.length == 0)
                    ? Container(
                        color: Colors.grey[200],
                      )
                    : Swiper(
                        viewportFraction: 0.8,
                        scale: 0.9,
                        itemCount: datas.length,
                        itemBuilder: (context, index) {
                          BannerList data = datas[index];
                          return CachedNetworkImage(
                            imageUrl: data.url,
                            fit: BoxFit.fill,
                            placeholder: (context, url) {
                              return DecoratedBox(
                                decoration:
                                    BoxDecoration(color: Colors.grey[300]),
                              );
                            },
                          );
                        },
                        autoplay: datas.length > 1,
                        pagination: SwiperPagination(),
                        onTap: (index) {
                          print('click');
                        },
                      ),
              ),
            )),
            //文章列表
            SliverPadding(
                padding: EdgeInsets.only(
                  top: 8,
                ),
                sliver: HomeListItem()),
          ],
        ),
      ),
    );
  }
}
