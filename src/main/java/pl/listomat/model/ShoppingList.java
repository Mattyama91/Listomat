package pl.listomat.model;

import lombok.Getter;
import lombok.Setter;
import lombok.ToString;
import pl.listomat.model.User;

import javax.persistence.*;
import javax.validation.constraints.Pattern;
import javax.validation.constraints.Size;
import java.time.LocalDateTime;

@Getter
@Setter
@Entity
@ToString
@Table(name = "shopping_lists")
public class ShoppingList {
    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    private Long id;

    @Size(min = 2, max = 30, message = "The value should be 2 or more characters but not more than 30.")
    @Pattern(regexp = "^[A-Za-z,.'-]+", message = "The shopping list can only contain letters and the following characters: .-,'")
    @Column(name = "list_name")
    private String listName;

    @Column(name = "created_on")
    private LocalDateTime createdOn;

    @ManyToOne
    @JoinColumn(name = "user_id")
    private User user;

    @PrePersist
    public void prePersist() {
        createdOn = LocalDateTime.now();
    }
}
