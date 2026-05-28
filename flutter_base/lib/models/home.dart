class BannerItem {
  String id;
  String imgUrl;
  BannerItem({required this.id, required this.imgUrl});

  factory BannerItem.fromJSON(Map<String, dynamic> json) {
    return BannerItem(id: json['id'] ?? '', imgUrl: json['imgUrl'] ?? '');
  }
}

class CategoryItem {
  String id;
  String name;
  String picture;
  List<CategoryItem>? children;
  CategoryItem({
    required this.id,
    required this.name,
    required this.picture,
    this.children,
  });

  factory CategoryItem.fromJSON(Map<String, dynamic> json) {
    return CategoryItem(
      id: json['id'] ?? '',
      name: json['name'] ?? '',
      picture: json['picture'] ?? '',
      children: json['children'] == null
          ? null
          : (json['children'] as List)
                .map(
                  (item) => CategoryItem.fromJSON(item as Map<String, dynamic>),
                )
                .toList(),
    );
  }
}

/// `result`：主分类（如「特惠推荐」）及其子分类列表
class HotRecommendResult {
  String id;
  String title;
  List<HotRecommendSubType> subTypes;

  HotRecommendResult({
    required this.id,
    required this.title,
    required this.subTypes,
  });

  factory HotRecommendResult.fromJSON(Map<String, dynamic> json) {
    return HotRecommendResult(
      id: json['id']?.toString() ?? '',
      title: json['title']?.toString() ?? '',
      subTypes: json['subTypes'] == null
          ? []
          : (json['subTypes'] as List)
                .map(
                  (e) =>
                      HotRecommendSubType.fromJSON(e as Map<String, dynamic>),
                )
                .toList(),
    );
  }
}

/// `subTypes` 单项：子 tab + 分页商品列表
class HotRecommendSubType {
  String id;
  String title;
  HotGoodsPagedList goodsItems;

  HotRecommendSubType({
    required this.id,
    required this.title,
    required this.goodsItems,
  });

  factory HotRecommendSubType.fromJSON(Map<String, dynamic> json) {
    return HotRecommendSubType(
      id: json['id']?.toString() ?? '',
      title: json['title']?.toString() ?? '',
      goodsItems: HotGoodsPagedList.fromJSON(
        json['goodsItems'] as Map<String, dynamic>,
      ),
    );
  }
}

/// `goodsItems`：分页元数据 + `items`
class HotGoodsPagedList {
  int counts;
  int pageSize;
  int pages;
  int page;
  List<HotGoodsItem> items;

  HotGoodsPagedList({
    required this.counts,
    required this.pageSize,
    required this.pages,
    required this.page,
    required this.items,
  });

  factory HotGoodsPagedList.fromJSON(Map<String, dynamic> json) {
    return HotGoodsPagedList(
      counts: _asInt(json['counts']),
      pageSize: _asInt(json['pageSize']),
      pages: _asInt(json['pages']),
      page: _asInt(json['page']),
      items: json['items'] == null
          ? []
          : (json['items'] as List)
                .map((e) => HotGoodsItem.fromJSON(e as Map<String, dynamic>))
                .toList(),
    );
  }
}

/// 商品列表中的单条商品
class HotGoodsItem {
  String id;
  String name;
  String? desc;
  String price;
  String picture;
  int orderNum;

  HotGoodsItem({
    required this.id,
    required this.name,
    this.desc,
    required this.price,
    required this.picture,
    required this.orderNum,
  });

  factory HotGoodsItem.fromJSON(Map<String, dynamic> json) {
    return HotGoodsItem(
      id: json['id']?.toString() ?? '',
      name: json['name']?.toString() ?? '',
      desc: json['desc'] as String?,
      price: json['price']?.toString() ?? '',
      picture: json['picture']?.toString() ?? '',
      orderNum: _asInt(json['orderNum']),
    );
  }
}

int _asInt(dynamic value) {
  if (value == null) return 0;
  if (value is int) return value;
  if (value is num) return value.toInt();
  return int.tryParse(value.toString()) ?? 0;
}

class GoodDetailItem extends HotGoodsItem {
  int payCount = 0;

  GoodDetailItem({
    required super.id,
    required super.name,
    required super.price,
    required super.picture,
    required super.orderNum,
    required this.payCount,
  }) : super(desc: '');

  factory GoodDetailItem.fromJSON(Map<String, dynamic> json) {
    return GoodDetailItem(
      id: json['id']?.toString() ?? '',
      name: json['name']?.toString() ?? '',
      price: json['price']?.toString() ?? '',
      picture: json['picture']?.toString() ?? '',
      orderNum: _asInt(json['orderNum']),
      payCount: _asInt(json['payCount']),
    );
  }
}

class GoodsDetailsItems {
  int counts;
  int pageSize;
  int pages;
  int page;
  List<GoodDetailItem> items;

  GoodsDetailsItems({
    required this.counts,
    required this.pageSize,
    required this.pages,
    required this.page,
    required this.items,
  });

  factory GoodsDetailsItems.fromJSON(Map<String, dynamic> json) {
    return GoodsDetailsItems(
      counts: _asInt(json['counts']),
      pageSize: _asInt(json['pageSize']),
      pages: _asInt(json['pages']),
      page: _asInt(json['page']),
      items: json['items'] == null
          ? []
          : (json['items'] as List)
                .map((e) => GoodDetailItem.fromJSON(e as Map<String, dynamic>))
                .toList(),
    );
  }
}
