package Util;

import DAO.ProductDao;
import Model.CartModel;
import Model.Product;
import jakarta.servlet.http.Cookie;
import jakarta.servlet.http.HttpServletRequest;
import java.util.ArrayList;
import java.util.List;

/**
 *
 * @author Le Tan Kim
 */
public class Cart {

    public List<CartModel> createCart(String cartCookie, CartModel cartItem) {
        boolean isNewProduct = true;
        List<CartModel> carts = this.loadCart(cartCookie);
        ProductDao productDao = new ProductDao();
        for (CartModel c : carts) {
            if (c.getId() == cartItem.getId() && c.getColor().equals(cartItem.getColor())) {
                if (c.getNumberOfProduct() == productDao.getProductByID(c.getId()).getAvailable()) {
                    return carts;
                }
                c.setNumberOfProduct(c.getNumberOfProduct() + cartItem.getNumberOfProduct());
                isNewProduct = false;
            }
        }
        if (isNewProduct) {
            carts.add(cartItem);
        }
        return carts;
    }

    public String deleteItemCart(String cartCookie, int idCartItem) {
        List<CartModel> carts = this.loadCart(cartCookie);
        for (CartModel c : carts) {
            if (c.getId() == idCartItem) {
                carts.remove(c);
                break;
            }
        }
        return convertCart(carts);
    }

    public String minusItemCart(String cartCookie, int idCartItem) {
        List<CartModel> carts = this.loadCart(cartCookie);
        for (CartModel c : carts) {
            if (c.getId() == idCartItem) {
                if (c.getNumberOfProduct() == 1) {
                    carts.remove(c);
                } else {
                    c.setNumberOfProduct(c.getNumberOfProduct() - 1);
                }
                break;
            }
        }
        return convertCart(carts);
    }

    public String addItemCart(String cartCookie, int idCartItem) {
        List<CartModel> carts = this.loadCart(cartCookie);
        ProductDao productDao = new ProductDao();
        for (CartModel c : carts) {
            if (c.getId() == idCartItem) {
                if (c.getNumberOfProduct() < productDao.getProductByID(idCartItem).getAvailable()) {
                    c.setNumberOfProduct(c.getNumberOfProduct() + 1);
                }
                break;
            }
        }
        return convertCart(carts);
    }

//  quy tat cart "_" ngan cach giua cac thuoc tinh (id, numberOfProducy)
//  || ngan cach giua cac cartItem
    public String convertCart(List<CartModel> cart) {
        String cartReturn = "";
        for (CartModel c : cart) {
            String id = c.getId() + "";
            String numberOfProduct = c.getNumberOfProduct() + "";
            String color = c.getColor().replaceAll(" ", "00");
            String cartItem = id + "_" + numberOfProduct + "_" + color;
            cartReturn += (cartItem + "||");
        }
        return cartReturn.equals("") ? "" : cartReturn.substring(0, cartReturn.length() - 2);
    }

    public List<CartModel> loadCart(String cartCookie) {
        Validation validate = new Validation();
        List<CartModel> carts = new ArrayList<>();
        try {
            if (cartCookie.length() == 0) {
                return carts;
            }
            if (!cartCookie.contains("||")) {
                cartCookie += "||";
            }
            String[] cartsSplit = cartCookie.split("\\|\\|");
            for (String cart : cartsSplit) {
                String itemCart[] = cart.split("_");
                if (itemCart.length == 3) {
                    int id = validate.getInt(itemCart[0]);
                    int numberOfProduct = validate.getInt(itemCart[1]);
                    String colors[] = itemCart[2].split("00");
                    String color = "";
                    for (String c : colors) {
                        color += c + " ";
                    }
                    CartModel cartModel = new CartModel(id, numberOfProduct, color.trim());
                    carts.add(cartModel);
                }
            }

        } catch (Exception e) {
            System.out.println("Load cart: " + e);
        }
        return carts;
    }

    public int getNumberCart(HttpServletRequest request) {
        try {
            String cartCookie = "";
            Cookie[] cookies = request.getCookies();
            if (cookies != null) {
                for (Cookie cook : cookies) {
                    if (cook != null && cook.getName().equals("cart")) {
                        cartCookie = cook.getValue();
                        break;
                    }
                }
            }
            List<CartModel> carts = this.loadCart(cartCookie);
            int numberCart = 0;
            for (CartModel cart : carts) {
                numberCart += cart.getNumberOfProduct();
            }
            return numberCart;
        } catch (Exception e) {
            System.out.println("Get number cart: " + e);
        }
        return 0;
    }

    public int getMaxNumberProduct(HttpServletRequest request, int id, int number) {
        try {
            String cartCookie = "";
            Cookie[] cookies = request.getCookies();
            if (cookies != null) {
                for (Cookie cook : cookies) {
                    if (cook != null && cook.getName().equals("cart")) {
                        cartCookie = cook.getValue();
                        break;
                    }
                }
            }
            List<CartModel> carts = this.loadCart(cartCookie);
            int maxNumber = number;
            for (CartModel cart : carts) {
                if (cart.getId() == id) {
                    maxNumber = (number - cart.getNumberOfProduct());
                }
            }
            return maxNumber;
        } catch (Exception e) {
            System.out.println("Get max number cart: " + e);
        }
        return 0;
    }

    public String showCart(String cartCookie) {
        List<CartModel> carts = this.loadCart(cartCookie);
        if (carts.size() == 0) {
            return "<div class=\"cart-empty\">\n"
                    + "                  <img src=\"./uploads/base/empty-cart.png\" alt=\"Empty cart\">\n"
                    + "                  <p class=\"text\">No have product in cart</p>\n"
                    + "              </div>";
        }
        String cartShow = "<div class=\"wrapper-cart\">\n"
                + "                  <table class=\"table\">\n"
                + "                      <thead>\n"
                + "                        <tr>\n"
                + "                          <th class=\"with-img\" scope=\"col with-img\">Images</th>\n"
                + "                          <th class=\"width-20\" scope=\"col\">Product</th>\n"
                + "                          <th class=\"width-15\" scope=\"col\">Unit Price</th>\n"
                + "                          <th scope=\"col\">Quantity</th>\n"
                + "                          <th scope=\"col\">Color</th>\n"
                + "                          <th class=\"width-15\" scope=\"col\">Total</th>\n"
                + "                          <th class=\"width-10\" scope=\"col\">Remove</th>\n"
                + "                        </tr>\n"
                + "                      </thead>\n"
                + "                      <tbody>";
        ProductDao productDao = new ProductDao();
        CurrencyConverter currency = new CurrencyConverter();
        float total = 0;
        int totalNumberCart = 0;
        for (CartModel c : carts) {
            Product p = productDao.getProductByID(c.getId());
            float price = p.getNewPrice() > 0 ? p.getNewPrice() : p.getOldPrice();
            float totalItem = price * c.getNumberOfProduct();
            totalNumberCart += c.getNumberOfProduct();
            total += totalItem;
            cartShow += "<tr>\n"
                    + "                          <td>\n"
                    + "                              <img class=\"img-yourCard\" src=\"" + p.getMainImg() + "\" alt=\"" + p.getName() + "\" srcset=\"\">\n"
                    + "                          </td>      \n"
                    + "                          <td>\n"
                    + "                              " + p.getName() + "\n"
                    + "                          </td>\n"
                    + "                          <td>" + currency.currencyFormat(price, "VND") + "</td>\n"
                    + "<form action=\"cart\" method=\"post\">"
                    + " <td><div class=\"number-input\">\n"
                    + "                              <button\n name=\"btn-minus\""
                    + "                                onclick=\"this.parentNode.querySelector('input[type=number]').stepDown()\"\n"
                    + "                                class=\"minus\"\n"
                    + "                              ></button>\n"
                    + "<input type=\"hidden\" name=\"id\" value=\"" + p.getID() + "\"/>"
                    + "                              <input\n"
                    + "                                class=\"quantity\"\n"
                    + "                                max=\"" + p.getAvailable() + "\"\n"
                    + "                                name=\"quantity\"\n"
                    + "                                value=\"" + c.getNumberOfProduct() + "\" readonly\n"
                    + "                                type=\"number\"\n"
                    + "                              />\n"
                    + "                              <button name=\"btn-add\"\n"
                    + "                                onclick=\"this.parentNode.querySelector('input[type=number]').stepUp()\"\n"
                    + "                                class=\"plus\"\n"
                    + "                              ></button>\n"
                    + "                            </div>"
                    + "</form>"
                    + "                          </td>"
                    + "                          <td>" + currency.currencyFormat(totalItem, "VND") + "</td>\n"
                    + "                          <td>" + c.getColor() + "</td>\n"
                    + "                          <td>\n"
                    + "                              <a onclick=\"return confirm('Are you sure you want to remove it from your cart?')\" href=\"cart/delete/" + p.getID() + "\">\n"
                    + "                                  <i class='bx bx-x'></i>\n"
                    + "                              </a>\n"
                    + "                          </td>\n"
                    + "                        </tr>";
        }
        cartShow += "</tbody>\n"
                + "                    </table>\n"
                + "              </div>\n"
                + "              <div class=\"thanhToan-yourCart\">\n"
                + "                <div class=\"box-thanh-toan\">\n"
                + "                    <h2>\n"
                + "                        Cart Totals\n"
                + "                    </h2>\n"
                + "                    <ul>\n"
                + "                        <li><span>Number of cart</span> \n"
                + "                            <span class=\"subtotal\">" + totalNumberCart + "</span>\n"
                + "                        </li>\n"
                + "                        <li><spab>Total</spab>\n"
                + "                            <span class=\"total\">" + currency.currencyFormat(total, "VND") + "</span>\n"
                + "                        </li>\n"
                + "                    </ul>\n"
                + "                    <div class=\"box-button-order-buy\">\n"
                + "                      <a href=\"/product\" class=\"btn pay-cart-now no-border\">Continue buy</a>\n"
                + "                      <a href=\"/checkout/buy-cart\" class=\"btn pay-cart-now bg\">Order now</a>\n"
                + "                  </div>\n"
                + "                </div>\n"
                + "              </div>";
        return cartShow;
    }

    public String showMiniCart(HttpServletRequest request) {
        String cartCookie = "";
        Cookie[] cookie = request.getCookies();
        for (Cookie cook : cookie) {
            if (cook.getName().equals("cart")) {
                cartCookie = cook.getValue();
                break;
            }
        }
        List<CartModel> carts = this.loadCart(cartCookie);
        if (carts.size() == 0) {
            return "<div class=\"box-empty-cart\">\n"
                    + "                                                            <img src=\"./uploads/base/empty-cart.png\" alt=\"Empty cart\">\n"
                    + "                                                            <p class=\"text\">Empty cart</p>\n"
                    + "                                                        </div>";
        }
        ProductDao productDao = new ProductDao();
        CurrencyConverter currency = new CurrencyConverter();
        String cartShow = "<div class=\"header-cart-mini\">\n"
                + "                                <h2>Your cart</h2>\n"
                + "                                <span>(" + carts.size() + " item)</span>\n"
                + "                            </div>"
                + "         <div class=\"main-mini-cart\">\n"
                + "                                <ul class=\"list-mini-cart\">";
        float total = 0;
        int totalNumberCart = 0;
        for (CartModel c : carts) {
            Product p = productDao.getProductByID(c.getId());
            float price = p.getNewPrice() > 0 ? p.getNewPrice() : p.getOldPrice();
            float totalItem = price * c.getNumberOfProduct();
            totalNumberCart += c.getNumberOfProduct();
            total += totalItem;
            cartShow += "<li class=\"item-mini-cart\">\n"
                    + "                                        <img src=\"" + p.getMainImg() + "\" alt=\"" + p.getName() + "\"/>\n"
                    + "                                        <div class=\"content-mini-cart\">\n"
                    + "                                            <p class=\"item-cart-name\">\n"
                    + "                                               " + p.getName() + "\n"
                    + "                                            </p>\n"
                    + "                                            <span class=\"item-cart-number\">x" + c.getNumberOfProduct() + "</span>\n"
                    + "                                            <span class=\"item-cart-number\">" + c.getColor() + "</span>\n"
                    + "                                            <span class=\"item-cart-price\">" + currency.currencyFormat(totalItem, "VND") + "</span>\n"
                    + "                                        </div>\n"
                    + "                                    </li>";
        }
        cartShow += "</ul>\n"
                + "                                <div class=\"total-mini-cart\">\n"
                + "                                    <span class=\"total-mini-cart-title\">Subtotal</span>\n"
                + "                                    <span class=\"total-mini-cart-title active\">" + currency.currencyFormat(total, "VND") + "</span>\n"
                + "                                </div>\n"
                + "                                <div class=\".active\">\n"
                + "                                    <a href=\"/cart\"class=\"btn btn-mini-cart active\">\n"
                + "                                        View cart\n"
                + "                                    </a>\n"
                + "                                    <a href=\"/checkout/buy-cart\" class=\"btn btn-mini-cart\">Checkout</a>\n"
                + "                                </div>\n"
                + "                            </div>";
        return cartShow;
    }
}
