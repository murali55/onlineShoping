package com.first.dao;

import java.util.List;

import com.first.entites.CartItem;
import com.first.entites.CustomerOrder;
import com.first.entites.User;

public interface CartItemDao 
{
void addToCart(CartItem cartItem);
User getUser(String email);
List<CartItem> getCartItems(String email);
void removeCartItem(int cartItemId);
void updateCartItem(int cartItemId, int requestedQuantity);
CustomerOrder createCustomerOrder(CustomerOrder customerOrder);
}