import 'package:flutter/material.dart';
import './category_list_model.dart';
import './product_model.dart';

class ProductList {
  List<Product> _productList = [
    Product(
      name: "Skyward Headphone",
      image: Image.asset('assets/RE_T2_Mond_Mall/headphone.png'),
      price: 1500000,
      type: <ProductType>[
        ProductType.featured,
        ProductType.bestSeller,
        ProductType.specialOffer,
        ProductType.topRated,
        ProductType.newArrival,
      ],
      category: <CategoryType>[
        CategoryType.gadget,
      ],
      avgRate: 5.0,
      totalReviews: 86,
    ),
    Product(
      name: "Prototype Earphone",
      image: Image.asset('assets/RE_T2_Mond_Mall/earphone.png'),
      price: 500000,
      type: <ProductType>[
        ProductType.featured,
        ProductType.bestSeller,
        ProductType.specialOffer,
        ProductType.topRated,
        ProductType.newArrival,
      ],
      category: <CategoryType>[
        CategoryType.gadget,
      ],
      avgRate: 4.6,
      totalReviews: 120,
    ),
    Product(
      name: "Favonius Drill",
      image: Image.asset('assets/RE_T2_Mond_Mall/bor.png'),
      price: 40000,
      type: <ProductType>[
        ProductType.featured,
        ProductType.bestSeller,
        ProductType.specialOffer,
        ProductType.topRated,
        ProductType.newArrival,
      ],
      category: <CategoryType>[
        CategoryType.gadget,
      ],
      avgRate: 4.0,
      totalReviews: 310,
    ),
  ];

  List<Product> get getAllProductList {
    return [..._productList];
  }

  List<Product> getByProductType(ProductType type) {
    return [
      ..._productList.where((product) {
        return product ==
            product.type.where((product_type) {
              return product_type == type;
            });
      })
    ];
  }
}
