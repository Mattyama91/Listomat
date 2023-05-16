package pl.listomat.model;

import lombok.Getter;
import lombok.Setter;
import lombok.ToString;

import javax.persistence.*;
import javax.validation.constraints.Email;
import javax.validation.constraints.Pattern;
import javax.validation.constraints.Size;

@Getter
@Setter
@Entity
@ToString
@Table(name = "users")
public class User {
    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    private Long id;

    @Size(min = 2, max = 30, message = "The value should be 2 or more characters but not more than 30.")
    @Pattern(regexp = "^[\\p{IsAlphabetic}]+", message = "The first name can only contain letters and the following characters: .-,'")
    @Column(name = "first_name", nullable = false)
    private String firstName;

    @Size(min = 2, max = 30, message = "The value should be 2 or more characters but not more than 30.")
    @Pattern(regexp = "^[\\p{IsAlphabetic}]+", message = "The last name can only contain letters and the following characters: .-,'")
    @Column(name = "last_name", nullable = false)
    private String lastName;

    @Email(message = "Invalid e-mail address")
    @Column(name = "email", nullable = false, unique = true)
    private String email;

//    @Password(message = "Minimum eight characters, at least one letter, one number and one special character")
    @Column(name = "password")
    private String password;

    @Transient
    private String repassword;

}
