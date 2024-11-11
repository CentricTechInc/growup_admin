import 'package:grow_up_admin_panel/domain/entities/parent_model.dart';

abstract class UserContributorRepository {
  Future<List<ParentModel>> getContributorTable();
}

