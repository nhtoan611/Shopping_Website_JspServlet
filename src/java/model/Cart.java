/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package model;

import java.util.HashMap;
import java.util.Map;

/**
 *
 * @author nhtoan
 */
public class Cart {
    private HashMap<Long, Item> cartItems;

    public Cart() {
        cartItems=new HashMap<>();
    }

    public Cart(HashMap<Long, Item> cartItems) {
        this.cartItems = cartItems;
    }

    public HashMap<Long, Item> getCartItems() {
        return cartItems;
    }

    public void setCartItems(HashMap<Long, Item> cartItems) {
        this.cartItems = cartItems;
    }
    
    //them san pham moi vao gio hang
    public void plusToCart(Long key, Item item){
        boolean check= cartItems.containsKey(key);
        if(check){
            int quantity_old=item.getQuantity();
            item.setQuantity(quantity_old+1);
            cartItems.put(key, item);
        }else{
            cartItems.put(key, item);
        }
    }
    //Lay san pham khoi gio hang
    public void subToCart(Long key, Item item){
        boolean check= cartItems.containsKey(key);
        if(check){
            int quantity_old=item.getQuantity();
            if(quantity_old<=1){
                cartItems.remove(key);
            }else{
                item.setQuantity(quantity_old-1);
                cartItems.put(key, item);
            }
        }
    }
    //Xoa tat ca san pham khoi gio hang
    public void removeToCart(Long key){
        boolean check= cartItems.containsKey(key);
        if(check){
            cartItems.remove(key);
        }
    }
    //Dem so san pham trong gio hang
    public int countItem(){
        return cartItems.size();
    }
    public double totalCart(){
        double count =0;
        for(Map.Entry<Long,Item> list: cartItems.entrySet()){
            count += list.getValue().getProduct().getProductPrice() * list.getValue().getQuantity();
        }
        return count;
    }
//    public static void main(String[] args) {
//        Cart cart=new Cart();
//    }
}
