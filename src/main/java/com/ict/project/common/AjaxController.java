package com.ict.project.common;

import java.util.ArrayList;
import java.util.Arrays;
import java.util.List;

import javax.servlet.http.HttpSession;

import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;

import com.google.gson.Gson;

@RestController
public class AjaxController {

    @RequestMapping(value = "data.do", produces = "application/json; charset=utf-8")
    public List<CartItems> getCartItems(@RequestBody String jsonData, HttpSession session) {
        Gson gson = new Gson();
        CartItems[] cartItems = gson.fromJson(jsonData, CartItems[].class);
        List<CartItems> cartItemsList = new ArrayList<>();
        cartItemsList.addAll(Arrays.asList(cartItems));
        session.setAttribute("cartItemsList", cartItemsList);
     
      
        return cartItemsList;
    }
 

}