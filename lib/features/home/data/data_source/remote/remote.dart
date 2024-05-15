import 'package:biemart/features/home/data/model/category.dart';
import 'package:biemart/injection_container.dart';
import 'package:supabase_flutter/supabase_flutter.dart';

class HomeRemoteDataSource {
  final supabase = sl<SupabaseClient>();
  Future<List<CategoryModel>> getCategory() async {
    try {
      final data = await supabase.from('category').select();

      return data.map((e) => CategoryModel.fromMap(e)).toList();
    } catch (e) {
      throw e.toString();
    }
  }
}
