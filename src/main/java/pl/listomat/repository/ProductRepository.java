package pl.listomat.repository;

import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Modifying;
import org.springframework.data.jpa.repository.Query;
import org.springframework.data.repository.query.Param;
import pl.listomat.model.Product;

import javax.transaction.Transactional;
import java.util.List;

public interface ProductRepository extends JpaRepository<Product, Long> {
    @Query(value = "SELECT * FROM products WHERE list_id = :list_id",
            nativeQuery = true)
    List<Product> findProductByShoppingListId(@Param("list_id") Long list_id);

    @Query(value = "SELECT p.product_name\n" +
            "FROM products p\n" +
            "LEFT JOIN shopping_lists sl\n" +
            "    ON sl.id = p.list_id\n" +
            "LEFT JOIN users u\n" +
            "    ON u.id = sl.user_id\n" +
            "WHERE u.id = :user_id",
            nativeQuery = true)
    List<String> findProductUserId(@Param("user_id") Long user_id);

    @Modifying
    @Transactional
    @Query(value = "DELETE FROM products WHERE list_id = :list_id",
            nativeQuery = true)
    int deleteProductByShoppingListId(@Param("list_id") Long list_id);

}
