package pl.listomat.repository;

import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Modifying;
import org.springframework.data.jpa.repository.Query;
import org.springframework.data.repository.query.Param;
import pl.listomat.model.User;

public interface UserRepository extends JpaRepository<User, Long> {
    User findUserByEmail(String email);

    @Modifying
    @Query("UPDATE User u SET u.firstName =: firstName, u.lastName =: lastName, u.email =: email, u.password =: password WHERE u.id =: id")
    void updateUserById (@Param("firstName") String firstname, @Param("lastName") String lastName, @Param("email") String email, @Param("password") String password, @Param("id") Long id);
}
