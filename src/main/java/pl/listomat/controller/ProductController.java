package pl.listomat.controller;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.*;
import pl.listomat.model.Product;
import pl.listomat.model.ShoppingList;
import pl.listomat.repository.ProductRepository;
import pl.listomat.repository.ShoppingListRepository;


import javax.servlet.ServletRequest;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;
import javax.validation.Valid;
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

    @PostMapping("/add/{id}")
//    @ResponseBody
    public String productSave(Model model, @PathVariable Long id, @Valid Product product, BindingResult result) {
        Product addProduct = product;
        addProduct.setId(null);

        if (result.hasErrors()) {
            return "addProduct";
        }
        model.addAttribute("listId", id);
        model.addAttribute("product", new Product());
        model.addAttribute("products", productRepository.findProductByShoppingListId(productRepository.save(addProduct).getShoppingList().getId()));
        return "addProduct";
    }

    @GetMapping("/comfirm/{listId}/{id}")
    public String comfirmForm(Model model, @PathVariable Long listId, @PathVariable Long id) {
        model.addAttribute("listId", listId);
        model.addAttribute("id", id);
        return "comfirmProduct";
    }

    @GetMapping("delete/{listId}/{id}")
    public String productDetele(Model model, @PathVariable Long listId, @PathVariable Long id, ServletRequest request) {

        HttpServletRequest req = (HttpServletRequest) request;
        HttpSession session = req.getSession();

        productRepository.deleteById(id);
        model.addAttribute("product", new Product());
//        ShoppingList shoppingList = (ShoppingList) session.getAttribute("sessionList");
        model.addAttribute("products", productRepository.findProductByShoppingListId(listId));
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
