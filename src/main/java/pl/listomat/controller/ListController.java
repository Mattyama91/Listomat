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

import javax.servlet.http.HttpSession;
import javax.validation.Valid;

@Controller
@RequestMapping("app/list")
@SessionAttributes("sessionList")
public class ListController {
    private ShoppingListRepository shoppingListRepository;
    private ProductRepository productRepository;

    public ListController(ShoppingListRepository shoppingListRepository, ProductRepository productRepository) {
        this.shoppingListRepository = shoppingListRepository;
        this.productRepository = productRepository;
    }

    @PostMapping("/filter")
    public String filterList(@RequestParam String lName, Model model, HttpSession session) {
        User user = (User) session.getAttribute("loguser");
        model.addAttribute("shoppingLists", shoppingListRepository.findShoppingListByName(user.getId(), lName));
        return "index";
    }

    @GetMapping("/add")
    public String listAddForm(Model model) {
        model.addAttribute("shoppingList", new ShoppingList());
        return "addShoppingList";
    }

    @PostMapping("/save")
    public String listSave(Model model, HttpSession session, @Valid ShoppingList shoppingList, BindingResult result) {
        if (result.hasErrors()) {
            return "addShoppingList";
        }
        User user = (User) session.getAttribute("loguser");
        model.addAttribute("names", productRepository.findProductUserId(user.getId()));
        model.addAttribute("listId", shoppingListRepository.save(shoppingList).getId());
        model.addAttribute("product", new Product());
        return "addProduct";
    }

    @GetMapping("/comfirm/{id}")
    public String comfirmForm(Model model, @PathVariable Long id) {
        model.addAttribute("id", id);
        return "comfirmList";
    }

    @GetMapping("/delete/{id}")
    public String listDetele(@PathVariable Long id) {
        productRepository.deleteProductByShoppingListId(id);
        shoppingListRepository.deleteById(id);
        return "redirect:/app/index";
    }

    @PostMapping("/update")
    public String listUpdate(Model model, @Valid ShoppingList shoppingList, BindingResult result) {
        if (result.hasErrors()) {
            return "editList";
        }
        model.addAttribute("sessionList", shoppingListRepository.save(shoppingList));
        model.addAttribute("product", new Product());
        return "addProduct";
    }

    @GetMapping("/edit/{id}")
    public String listEditForm(Model model, @PathVariable Long id) {
        model.addAttribute("list_id", id);
        model.addAttribute("product", new Product());
        model.addAttribute("products", productRepository.findProductByShoppingListId(id));
        return "editList";
    }

    @PostMapping("/edit/{id}")
    public String listEdit(Model model, @PathVariable Long id, @Valid Product product, BindingResult result) {
        Product addProduct = product;
        addProduct.setId(null);

//        if (result.hasErrors()) {
//            return "editList";
//        }
        model.addAttribute("list_id", id);
        model.addAttribute("product", new Product());
        model.addAttribute("products", productRepository.findProductByShoppingListId(productRepository.save(addProduct).getShoppingList().getId()));
        return "editList";
    }
}
