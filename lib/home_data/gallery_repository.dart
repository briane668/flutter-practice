import '../model/product.dart';
import 'gallery_service.dart';

class GalleryRepository {
  final GalleryService galleryService = GalleryService();

  Future<List<Product>> getProducts(String category) async {
    return galleryService.fetchProducts(category);
  }
}
