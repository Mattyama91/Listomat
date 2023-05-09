package pl.listomat.controller;

import lombok.Getter;
import org.mindrot.jbcrypt.BCrypt;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.*;
import pl.listomat.model.User;
import pl.listomat.repository.UserRepository;

import javax.servlet.ServletRequest;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

@Controller
@SessionAttributes("loguser")
public class UserController {
    private final UserRepository userRepository;

    public UserController(UserRepository userRepository) {
        this.userRepository = userRepository;
    }

    @GetMapping("/login")
    public String showLogin(Model model, ServletRequest request) {
        HttpServletRequest req = (HttpServletRequest) request;
        HttpSession session = req.getSession();

        session.invalidate();
        model.addAttribute("user", new User());
        return "login";
    }

    @PostMapping("/login")
    public String loginUser(Model model, User user) {
        User comfirmUser = userRepository.findUserByEmail(user.getEmail());
        try {
            if (BCrypt.checkpw(user.getPassword(), comfirmUser.getPassword())) {
                model.addAttribute("loguser", comfirmUser);
                return "redirect: /app/index";
            } else {
                return "login";
            }
        } catch (NullPointerException e) {
            return "login";
        }
    }

    @GetMapping("/register")
    public String showRegistry(Model model) {
        model.addAttribute("user", new User());
        return "register";
    }

    @PostMapping("/save")
    public String saveUser(@ModelAttribute("user") User user) {
        user.setPassword(BCrypt.hashpw(user.getPassword(), BCrypt.gensalt()));
        userRepository.save(user);
        return "redirect: /login";
    }

    @GetMapping("/app/user")
    public String editUserForm() {
        return "editUser";
    }

    @PostMapping("/app/user")
//    @ResponseBody
    public String editUser(Model model, User loguser) {
//        return loguser.toString();
//        userRepository.save(loguser);
        model.addAttribute("loguser", userRepository.save(loguser));
        return "editUser";
    }

    @GetMapping("/app/user/logout/comfirm")
    public String logoutUserForm() {
        return "logout";
    }

    @GetMapping("/app/user/logout")
    public String logoutUser(ServletRequest request) {
        HttpServletRequest req = (HttpServletRequest) request;
        HttpSession session = req.getSession();
        session.removeAttribute("loguser");

        session.invalidate();

        return "redirect: /login";
    }
}
