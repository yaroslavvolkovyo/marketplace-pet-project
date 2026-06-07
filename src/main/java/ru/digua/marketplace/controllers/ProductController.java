package ru.digua.marketplace.controllers;


import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.*;
import ru.digua.marketplace.dto.ProductDto;
import ru.digua.marketplace.dtoFactory.ProductDtoFactory;
import ru.digua.marketplace.entities.Product;
import ru.digua.marketplace.services.ProductService;

import java.util.List;

@RestController
@RequestMapping("/v1/products")
public class ProductController{


    private final ProductService productService;
    private final ProductDtoFactory productDtoFactory;

    @Autowired
    public ProductController(ProductService productService, ProductDtoFactory productDtoFactory) {
        this.productService = productService;
        this.productDtoFactory = productDtoFactory;
    }

    @GetMapping
    public List<ProductDto> getAllProducts(){
        List<Product> allProducts = productService.getAllProduct();
        return allProducts.stream()
                .map(product -> productDtoFactory.productToProductDto(product))
                .toList();
    }

    @PostMapping
    public void addProduct(@RequestBody ProductDto productDto){
        productService.addProduct(productDtoFactory.ProductDtoToPRoduct(productDto));

    }

}
