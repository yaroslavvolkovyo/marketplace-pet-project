package ru.digua.marketplace.dtoFactory;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Component;
import ru.digua.marketplace.dao.ProductRepository;
import ru.digua.marketplace.dto.ProductDto;
import ru.digua.marketplace.entities.Product;

@Component
public class ProductDtoFactory{

    private final ProductDto productDto;


    @Autowired
    public ProductDtoFactory(ProductDto productDto) {
        this.productDto = productDto;
    }

    public Product ProductDtoToPRoduct(ProductDto productDto){
        Product product = new Product(
                productDto.getProductId(),
                productDto.getName(),
                productDto.getDescription(),
                productDto.getPrice(),
                productDto.getSellerId()

        );
        return product;
    }

    public ProductDto productToProductDto(Product product){
        ProductDto productDto = new ProductDto(
                product.getProductId(),
                product.getName(),
                product.getDescription(),
                product.getPrice(),
                product.getSellerId()
        );
        return productDto;
    }

}
