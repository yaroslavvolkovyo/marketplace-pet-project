package ru.digua.marketplace.dao;

import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.stereotype.Repository;
import ru.digua.marketplace.entities.Product;

@Repository
public interface ProductRepository extends JpaRepository<Product, Long>{
}
