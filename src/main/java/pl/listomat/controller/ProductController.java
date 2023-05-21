package pl.listomat.controller;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.*;
import pl.listomat.model.Product;
import pl.listomat.model.ShoppingList;
import pl.listomat.model.User;
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
    public String productSave(Model model, HttpSession session, @RequestParam(required = false) String pName, @RequestParam(required = false) String pQuantity, @PathVariable Long id, @Valid Product product, BindingResult result) {
        Product addProduct = new Product();
//        if (product != null) {
        if (pName == null) {
            addProduct = product;
            addProduct.setId(null);

            if (result.hasErrors()) {
                return "addProduct";
            }
            User user = (User) session.getAttribute("loguser");
            model.addAttribute("names", productRepository.findProductUserId(user.getId()));
            model.addAttribute("listId", id);
            model.addAttribute("product", new Product());
            model.addAttribute("products", productRepository.findProductByShoppingListId(productRepository.save(addProduct).getShoppingList().getId()));
            return "addProduct";
        } else {
            addProduct.setProductName(pName);
            addProduct.setQuantity(Long.parseLong(pQuantity));
            addProduct.setShoppingList(shoppingListRepository.findById(id).get());
            User user = (User) session.getAttribute("loguser");
            model.addAttribute("names", productRepository.findProductUserId(user.getId()));
            model.addAttribute("listId", id);
            model.addAttribute("product", new Product());
            model.addAttribute("products", productRepository.findProductByShoppingListId(productRepository.save(addProduct).getShoppingList().getId()));
            return "addProduct";
        }
    }

    @GetMapping("/comfirm/{listId}/{id}")
    public String comfirmForm(Model model, @PathVariable Long listId, @PathVariable Long id) {
        model.addAttribute("listId", listId);
        model.addAttribute("id", id);
        return "comfirmProduct";
    }

    @GetMapping("delete/{listId}/{id}")
    public String productDetele(Model model, HttpSession session, @PathVariable Long listId, @PathVariable Long id, ServletRequest request) {

//        HttpServletRequest req = (HttpServletRequest) request;
//        HttpSession session = req.getSession();

        productRepository.deleteById(id);
        User user = (User) session.getAttribute("loguser");
        model.addAttribute("names", productRepository.findProductUserId(user.getId()));
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
