import 'package:couchbase_lite_dart/couchbase_lite_dart.dart';
import 'package:flipper/model/branch.dart';
import 'package:flipper/model/business.dart';
import 'package:flipper/model/product.dart';
import 'package:flipper/services/database_service.dart';
import 'package:flipper/services/flipperNavigation_service.dart';
import 'package:flipper/services/proxy.dart';
import 'package:flipper/utils/constant.dart';
import 'package:flipper/utils/logger.dart';
import 'package:flipper/viewmodels/base_model.dart';
import 'package:flutter/material.dart';
import 'package:logger/logger.dart';

import 'package:flipper/routes/router.gr.dart';

class ProductsViewModel extends BaseModel {
  final Logger log = Logging.getLogger('product observer:)');

  String _branchId;
  String _businessId;
  final DatabaseService _databaseService = ProxyService.database;
  
  final List<Product> _products = <Product>[];

  List<Product> get products => _products;

  Future<bool> isCategory({String branchId}) async {

    final q = Query(
        _databaseService.db, 'SELECT * WHERE table=\$VALUE AND name=\$NAME');

    q.parameters = {'VALUE': AppTables.category, 'NAME': 'custom'};
    return q.execute().isNotEmpty;
  }

  String get branchId {
    return _branchId;
  }

  String get businessId {
    return _businessId;
  }

  Future initializeNeededIds({@required userId}) async {
    setBusy(true);
    //load the branch
    final DatabaseService _databaseService = ProxyService.database;
    // final List<Map<String, dynamic>> branche = await _databaseService.filter(
    //   equator: AppTables.branch,
    //   property: 'table',
    // );
    final branche = Query(_databaseService.db, 'SELECT * WHERE table=\$VALUE ');

    branche.parameters = {'VALUE': AppTables.branch};
    final brancheResult = branche.execute();
    final List<Branch> branches = [];
    if (brancheResult.isNotEmpty) {
      // ignore: unnecessary_type_check
      for (Map map in brancheResult) {
        map.forEach((key, value) {
          if(!branches.contains(Branch.fromMap(value))){
             branches.add(Branch.fromMap(value));
          }
        });
      }
    }

    for (Branch branch in branches) {
      if (branch.active) {
        _branchId = branch.id;
      }
    }
    final doc = Query(_databaseService.db,
        'SELECT * WHERE table=\$VALUE AND userId=\$USERID');

    doc.parameters = {'VALUE': AppTables.business, 'USERID': userId};

    final docResults = doc.execute();

    final List<Business> businesses = [];

    if (docResults.isNotEmpty) {
      for (Map map in docResults) {
        map.forEach((key, value) {
          if(!businesses.contains(Business.fromMap(value))){
             businesses.add(Business.fromMap(value));
          }
         
        });
      }
    }

    for (Business business in businesses) {
      if (business.active) {
        _businessId = business.id;
      }
    }
    notifyListeners();
    setBusy(false);
  }

  void getProducts({BuildContext context}) {

    final q = Query(_databaseService.db, 'SELECT * WHERE table=\$VALUE');

    q.parameters = {'VALUE': AppTables.product};

    q.addChangeListener((List results) {
      for (Map map in results) {
        
        map.forEach((key, value) {
          if(!_products.contains(Product.fromMap(value))){
             _products.add(Product.fromMap(value));
             notifyListeners();
          }
        });
      }
    });
  }

  // selling a product
  void shouldSeeItemOnly(BuildContext context, Product product) {
    final FlipperNavigationService _navigationService = ProxyService.nav;

    // _navigationService.navigateTo(
    //   Routing.viewSingleItem,
    //   arguments: ViewSingleItemScreenArguments(
    //     productId: product.id,
    //     itemName: product.name,
    //     itemColor: product.color,
    //   ),
    // );
  }

  void onSellingItem(BuildContext context, Product product) async {
    ProxyService.nav.navigateTo(Routing.productDescription);
  }

  void navigateTo({@required String path}) {
    ProxyService.nav.navigateTo(path);
  }
}