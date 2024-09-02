////package com.example.java4.restcontrollers;
//<<<<<<< HEAD
////
////import com.example.java4.entities.Account;
////import org.springframework.stereotype.Controller;
////import org.springframework.ui.Model;
////import org.springframework.web.bind.annotation.GetMapping;
////import org.springframework.web.bind.annotation.RequestMapping;
////@Controller
////@RequestMapping("login")
////public class LoginController {
////    @RequestMapping(name="login", method = RequestMethod.POST)
//=======
////import com.example.java4.request.login.LoginRequest;
////import com.example.java4.entities.Account;
////import org.springframework.stereotype.Controller;
////import org.springframework.ui.Model;
////import org.springframework.web.bind.annotation.*;
////@Controller
////@RequestMapping("login")
////public class LoginController {
////    //@RequestMapping(name="login", method = RequestMethod.POST)
//>>>>>>> 5491a23ce5729ebe4a6844bb45135dc974e31d1d
////    Account accRem = new Account();
////
////    public void handleSubmit(Account acc){
////        System.out.println("handle submit data:"+acc);
////    }
////    @GetMapping("/create")
////    public String getLoginForm(Model model)
////    {
////        String name = "SD18203";
////        model.addAttribute("data",accRem);
////        return "admin/login/Login";
////    }
////    @PostMapping("enter")
////    public String login(
//<<<<<<< HEAD
////        @RequestParam("email") Optional<String> username,
////        @RequestParam("password") String pwd,
//=======
//////        @RequestParam("email") Optional<String> username,
//////        @RequestParam("password") String pwd,
//>>>>>>> 5491a23ce5729ebe4a6844bb45135dc974e31d1d
////            LoginRequest req,
////            Model model
////    ) {
////        System.out.println("LoginController@login");
////        System.out.println(req.getEmail());
////        System.out.println(req.getPassword());
////        Account acc = new Account(req.getEmail(), req.getPassword());
////        handleSubmit(acc);
////        accRem=acc;
////        model.addAttribute("data",acc);
////        return "admin/login/Login";
////    }
////}