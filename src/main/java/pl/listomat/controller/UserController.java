package pl.listomat.controller;

import lombok.Getter;
import lombok.extern.slf4j.Slf4j;
import org.mindrot.jbcrypt.BCrypt;
import org.springframework.orm.jpa.JpaSystemException;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.*;
import org.springframework.web.util.WebUtils;
import pl.listomat.model.User;
import pl.listomat.repository.UserRepository;

import javax.servlet.ServletRequest;
import javax.servlet.http.Cookie;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import javax.validation.Valid;
import java.util.regex.Matcher;
import java.util.regex.Pattern;

@Slf4j
@Controller
@SessionAttributes("loguser")
public class UserController {
    private final UserRepository userRepository;

    public UserController(UserRepository userRepository) {
        this.userRepository = userRepository;
    }

    @GetMapping("/login")
    public String showLogin(Model model) {
        model.addAttribute("user", new User());
        return "login";
    }

    @PostMapping("/login")
    public String loginUser(HttpServletRequest request, Model model, User user) {
        User comfirmUser = userRepository.findUserByEmail(user.getEmail());
        try {
            if (BCrypt.checkpw(user.getPassword(), comfirmUser.getPassword())) {
                model.addAttribute("loguser", comfirmUser);
                return "redirect: /app/index";
            } else {
                request.setAttribute("alert", "Invalid email address or password.");
                return "login";
            }
        } catch (NullPointerException e) {
            request.setAttribute("alert", "Invalid email address or password.");
            return "login";
        }
    }

    @GetMapping("/register")
    public String showRegistry(Model model) {
        model.addAttribute("user", new User());
        return "register";
    }

    @PostMapping("/save")
    public String saveUser(HttpServletRequest request, @Valid User user, BindingResult result) {
        String regex = "^(?=.*[A-Za-z])(?=.*\\d)(?=.*[@$!%*#?&])[A-Za-z\\d@$!%*#?&]{8,}$";

        if (result.hasErrors()) {
            return "register";
        }
        if (!user.getPassword().matches(regex)) {
            request.setAttribute("alert", "min. 8 characters, including one capital letter");
            return "register";
        }

        if (!user.getPassword().equals(user.getRepassword())) {
            request.setAttribute("alert", "The passwords should be the same");
            return "register";
        }
        try {
            user.setPassword(BCrypt.hashpw(user.getPassword(), BCrypt.gensalt()));
            userRepository.save(user);
            return "redirect: /login";
        } catch (JpaSystemException e) {
            request.setAttribute("loginAlert", "It looks like you already have an account with us. Please try to log in again.");
            return "register";
        }
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
//    public String logoutUser(ServletRequest request, HttpServletRequest request) {
    public String logoutUser(ServletRequest r, HttpServletRequest request, HttpServletResponse response) {
        HttpServletRequest req = (HttpServletRequest) r;
        HttpSession session = req.getSession();
        session.removeAttribute("loguser");

        session.invalidate();
        request.getSession(false);
        Cookie c = WebUtils.getCookie(request, "JSESSIONID");
        c.setMaxAge(0);
        response.addCookie(c);

        return "redirect: /login";
    }
}
