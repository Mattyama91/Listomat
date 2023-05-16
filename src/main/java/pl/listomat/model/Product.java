package pl.listomat.model;

import lombok.Getter;
import lombok.Setter;
import lombok.ToString;

import javax.persistence.*;
import javax.validation.constraints.Pattern;
import javax.validation.constraints.Size;

@Getter
@Setter
@Entity
@ToString
@Table(name = "products")
public class Product {
    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    private Long id;

    @Size(min = 2, max = 30, message = "The value should be 2 or more characters but not more than 30.")
//    @Pattern(regexp = "^[\\p{IsAlphabetic}]+", message = "The product name can only contain letters and the following characters: .-,'")
    @Column(name = "product_name")
    private String productName;

    @Column(name = "quantity")
    private Long quantity;

    @ManyToOne
    @JoinColumn(name = "list_id")
    private ShoppingList shoppingList;
}
