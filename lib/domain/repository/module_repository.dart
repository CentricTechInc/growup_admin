import 'dart:convert';

import 'package:grow_up_admin_panel/data/provider/network/apis/module_api.dart';
import 'package:grow_up_admin_panel/domain/entities/gifting_model.dart';

abstract class ModuleRepository {
  Future<List<GiftingModel>> getGiftingTable();
}

class ModuleRepositoryImpl extends ModuleRepository{
  @override
  Future<List<GiftingModel>> getGiftingTable() async {
    final response = await ModuleApi.getGiftingTable().request();
    final List<dynamic> json = jsonDecode(response)['data'];
    final List<GiftingModel> data = json.map((e) => GiftingModel.fromJson(e)).toList();
    return data;
  }
}