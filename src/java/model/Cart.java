/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package model;

import dal.ProductDAO;
import java.util.ArrayList;
import java.util.List;

public class Cart {

    private List<CartItem> items;

    public Cart(String txt) {
        items = new ArrayList<>();

        if (txt.isBlank() || txt.isEmpty()) {
            return;
        }
        ProductDAO dao = new ProductDAO();

        String[] itemCart = txt.split("#");
        for (String o : itemCart) {
            try {
                String[] s = o.split(":");
                Product p = dao.getProductById(Integer.parseInt(s[0]));
                int quantity = Integer.parseInt(s[1]);

                CartItem existItem = findCartItemByProduct(p);

                if (existItem != null) {
                    existItem.setQuantity(existItem.getQuantity()+ quantity);
                }else{
                    items.add(new CartItem(p, quantity));
                }

                

            } catch (NumberFormatException ex) {
            }
        }
    }

    private CartItem findCartItemByProduct(Product product) {
        for (CartItem item : items) {
            if (item.getProduct().getProduct_id() == product.getProduct_id()) {
                return item;
            }
        }
        return null;
    }

    public List<CartItem> getItems() {
        return items;
    }

    public void addItem(CartItem item) {
        items.add(item);
    }

    public void removeAll() {
        items = null;
    }

}
