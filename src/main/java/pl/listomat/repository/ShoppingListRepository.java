package pl.listomat.repository;

import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Query;
import org.springframework.data.repository.query.Param;
import pl.listomat.model.Product;
import pl.listomat.model.ShoppingList;

import java.util.List;

public interface ShoppingListRepository extends JpaRepository<ShoppingList, Long> {
    @Query(value = "SELECT * FROM shopping_lists WHERE user_id = :user_id ORDER BY created_on DESC",
            nativeQuery = true)
    List<ShoppingList> findShoppingListByUserId(@Param("user_id") Long user_id);

    @Query(value = "SELECT *\n" +
            "FROM shopping_lists\n" +
            "WHERE user_id = :user_id\n" +
            "    AND list_name LIKE %:name%",
            nativeQuery = true)
    List<ShoppingList> findShoppingListByName(@Param("user_id") Long user_id, @Param("name") String name);
}
