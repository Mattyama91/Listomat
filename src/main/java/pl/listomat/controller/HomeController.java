package pl.listomat.controller;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import pl.listomat.model.User;
import pl.listomat.repository.ProductRepository;
import pl.listomat.repository.ShoppingListRepository;

import javax.servlet.http.HttpSession;

@Controller
@RequestMapping("/app")
public class HomeController {
    private ShoppingListRepository shoppingListRepository;
    private ProductRepository productRepository;

    public HomeController(ShoppingListRepository shoppingListRepository, ProductRepository productRepository) {
        this.shoppingListRepository = shoppingListRepository;
        this.productRepository = productRepository;
    }
    @GetMapping("/index")
//    @ResponseBody
    public String index(Model model, HttpSession session) {
        User user = (User) session.getAttribute("loguser");
        model.addAttribute("shoppingLists", shoppingListRepository.findShoppingListByUserId(user.getId()));
        return "index";
    }

    @GetMapping("/product/show/{id}")
    public String listShow(Model model, @PathVariable Long id) {
        model.addAttribute("products", productRepository.findProductByShoppingListId(id));
        model.addAttribute("shoppingList", shoppingListRepository.findById(id));
        return "showProducts";
    }
}
