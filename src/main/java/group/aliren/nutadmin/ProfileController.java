package group.aliren.nutadmin;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
public class ProfileController {
    @RequestMapping("/profile")
    public String profilePage() {
        return "profile";
    }
}
