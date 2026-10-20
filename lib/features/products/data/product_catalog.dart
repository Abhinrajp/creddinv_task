class Product {
  const Product({
    required this.id, required this.name, required this.description,
    required this.price, required this.imageUrl, required this.category,
  });
  final String id;
  final String name;
  final String description;
  final double price;
  final String imageUrl;
  final String category;
}

const productCatalog = <Product>[
  Product(id: 'p1', name: 'The Everyday Linen Shirt', description: 'Relaxed fit · breathable linen', price: 2490, category: 'ESSENTIALS', imageUrl: 'https://images.unsplash.com/photo-1596753078784-cd6d6b6b8b2a?w=800&q=85'),
  Product(id: 'p2', name: 'Tailored Weekend Trousers', description: 'A clean silhouette, all-day ease', price: 3290, category: 'NEW ARRIVAL', imageUrl: 'https://images.unsplash.com/photo-1473966968600-fa801b869a1a?w=800&q=85'),
  Product(id: 'p3', name: 'Soft Structure Knit', description: 'Lightweight cotton-blend knit', price: 2890, category: 'BESTSELLER', imageUrl: 'https://images.unsplash.com/photo-1576566588028-4147f3842f27?w=800&q=85'),
  Product(id: 'p4', name: 'Minimal Leather Tote', description: 'Room for everything, refined finish', price: 4590, category: 'ACCESSORIES', imageUrl: 'https://images.unsplash.com/photo-1584917865442-de89df76afd3?w=800&q=85'),
  Product(id: 'p5', name: 'Classic Low-Top Sneaker', description: 'Versatile everyday comfort', price: 3790, category: 'FOOTWEAR', imageUrl: 'https://images.unsplash.com/photo-1542291026-7eec264c27ff?w=800&q=85'),
];
