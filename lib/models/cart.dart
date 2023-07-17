import 'package:flutter_application_1/core/core.dart';
import 'package:flutter_application_1/models/catalog.dart';
import 'package:velocity_x/velocity_x.dart';

class CartModel {
  CatalogModel? _catalog;
  final List<int> _itemIds = [];

  CatalogModel get catalog => _catalog!;
  set catalog(CatalogModel newCatalog) {
    _catalog = newCatalog;
  }

  List<dynamic> get items =>
      _itemIds.map((id) => _catalog!.getById(id)).toList();

  num get totalPrice =>
      items.fold(0, (total, current) => total + current.price);
}

class AddMutation extends VxMutation<MyStore> {
  final Item item;

  AddMutation(this.item);
  @override
  perform() {
    store!.cart!._itemIds.add(item.id!);
  }
}

class RemoveMutation extends VxMutation<MyStore> {
  final Item item;

  RemoveMutation(this.item);
  @override
  perform() {
    store!.cart!._itemIds.remove(item.id!);
  }
}
