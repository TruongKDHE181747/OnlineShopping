/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package model;

import dal.ProductDAO;
import dal.SizeDAO;
import java.util.ArrayList;
import java.util.List;

public class Cart {

    private List<CartItem> items;

    public Cart(String txt) {
        items = new ArrayList<>();

        if (txt.isBlank() || txt.isEmpty()) {
            return;
        }
        ProductDAO daoP = new ProductDAO();
        SizeDAO daoS = new SizeDAO();

        String[] itemCart = txt.split("#");
        for (String o : itemCart) {
            try {
                String[] s = o.split(":");
                Product product = daoP.getProductById(Integer.parseInt(s[0]));
                Size size = daoS.getSizeById(Integer.parseInt(s[1]));
                int quantity = Integer.parseInt(s[2]);

                if (quantity > 0) {

                    CartItem existItem = findCartItemByProductSize(product, size);

                    if (existItem != null) {
                        existItem.setQuantity(existItem.getQuantity() + quantity);
                    } else {
                        items.add(new CartItem(product, size, quantity));
                    }
                }
            } catch (NumberFormatException ex) {
            }
        }
    }

    public String generateText() {
        String txt = "";
        for (CartItem item : items) {
            if (txt.isBlank() || txt.isEmpty()) {
                txt += item.getProduct().getProduct_id() + ":" + item.getSize().getSize_id() + ":" + item.getQuantity();
            } else {
                txt += "," + item.getProduct().getProduct_id() + ":" + item.getSize().getSize_id() + ":" + item.getQuantity();
            }
        }
        return txt;
    }

    private CartItem findCartItemByProductSize(Product product, Size size) {
        for (CartItem item : items) {
            if (item.getProduct().getProduct_id() == product.getProduct_id()
                    && item.getSize().getSize_id() == size.getSize_id()) {
                return item;
            }
        }
        return null;
    }

    public List<CartItem> getItems() {
        return items;
    }

    public void removeAll() {
        items = null;
    }

    public static void main(String[] args) {
        Cart c = new Cart("1:1:1#1:2:1#1:1:1#1:1:1");

        System.out.println(c.generateText());
    }
}
