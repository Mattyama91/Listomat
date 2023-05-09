package pl.listomat.controller;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.*;
import pl.listomat.model.Product;
import pl.listomat.model.ShoppingList;
import pl.listomat.repository.ProductRepository;
import pl.listomat.repository.ShoppingListRepository;


import javax.servlet.ServletRequest;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;
import java.util.List;

@Controller
@RequestMapping("app/product")
public class ProductController {
    private ProductRepository productRepository;
    private ShoppingListRepository shoppingListRepository;

    public ProductController(ProductRepository productRepository, ShoppingListRepository shoppingListRepository) {
        this.productRepository = productRepository;
        this.shoppingListRepository = shoppingListRepository;
    }

    @PostMapping("/add")
//    @ResponseBody
    public String productSave(Model model, Product product) {
        model.addAttribute("product", new Product());
        model.addAttribute("products", productRepository.findProductByShoppingListId(productRepository.save(product).getShoppingList().getId()));
        return "addProduct";
    }

    @GetMapping("/comfirm/{id}")
    public String comfirmForm(Model model, @PathVariable Long id) {
        model.addAttribute("id", id);
        return "comfirmProduct";
    }

    @GetMapping("delete/{id}")
    public String productDetele(Model model, @PathVariable Long id, ServletRequest request) {

        HttpServletRequest req = (HttpServletRequest) request;
        HttpSession session = req.getSession();

        productRepository.deleteById(id);
        model.addAttribute("product", new Product());
        ShoppingList shoppingList = (ShoppingList) session.getAttribute("sessionList");
        model.addAttribute("products", productRepository.findProductByShoppingListId(shoppingList.getId()));
        return "addProduct";
    }

    @GetMapping("/reload")
    private String productReload(Model model, ServletRequest request) {
        HttpServletRequest req = (HttpServletRequest) request;
        HttpSession session = req.getSession();

        model.addAttribute("product", new Product());
        ShoppingList shoppingList = (ShoppingList) session.getAttribute("sessionList");
        model.addAttribute("products", productRepository.findProductByShoppingListId(shoppingList.getId()));
        return "addProduct";
    }
}
