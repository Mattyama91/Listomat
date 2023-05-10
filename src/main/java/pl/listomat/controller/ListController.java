package pl.listomat.controller;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.*;
import pl.listomat.model.Product;
import pl.listomat.model.ShoppingList;
import pl.listomat.repository.ProductRepository;
import pl.listomat.repository.ShoppingListRepository;

import javax.servlet.http.HttpSession;
import javax.transaction.Transactional;
import javax.validation.Valid;
import java.util.List;

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

    @GetMapping("/add")
    public String listAddForm(Model model) {
        model.addAttribute("shoppingList", new ShoppingList());
        return "addShoppingList";
    }

    @PostMapping("/save")
//    @ResponseBody
    public String listSave(@Valid Model model, ShoppingList shoppingList, BindingResult result) {
        if (result.hasErrors()) {
            return "addShoppingList";
        }
//        return shoppingList.toString();
        model.addAttribute("sessionList", shoppingListRepository.save(shoppingList));
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

    @GetMapping("/edit/{id}")
//    @ResponseBody
    public String listEditForm(Model model, @PathVariable Long id) {
//        return shoppingListRepository.findById(id).toString();
        model.addAttribute("editShoppingList", shoppingListRepository.findById(id));
        model.addAttribute("sessionList", shoppingListRepository.findById(id));
        model.addAttribute("product", new Product());
        model.addAttribute("products", productRepository.findProductByShoppingListId(id));
        return "editList";
    }

    @PostMapping("/edit")
    public String listEdit() {
        return "redirect:/app/index";
    }
}
