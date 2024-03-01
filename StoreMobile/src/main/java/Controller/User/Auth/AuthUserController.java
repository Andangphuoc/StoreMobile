package Controller.User.Auth;

import DAO.AccountDao;
import Model.Account;
import Util.MD5Hashing;
import java.io.IOException;
import java.io.PrintWriter;
import jakarta.servlet.ServletException;
import jakarta.servlet.http.Cookie;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;
import java.sql.Timestamp;
import java.time.LocalDateTime;

/**
 *
 * @author Le Tan Kim
 */
public class AuthUserController extends HttpServlet {

    // <editor-fold defaultstate="collapsed" desc="HttpServlet methods. Click on the + sign on the left to edit the code.">
    /**
     * Handles the HTTP <code>GET</code> method.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        String path = request.getRequestURI();
        if (path.endsWith("/auth/login")) {
            request.getRequestDispatcher("/user/login.jsp").forward(request, response);
        } else if (path.endsWith("/auth/register")) {
            request.getRequestDispatcher("/user/register.jsp").forward(request, response);
        } else {
            response.sendRedirect("/404");
        }
    }
    
    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        MD5Hashing md5 = new MD5Hashing();
        AccountDao adao = new AccountDao();
        HttpSession session = request.getSession();
        if (request.getParameter("submitLogin") != null) {
            String username = request.getParameter("loginName");
            String password = request.getParameter("loginPassword");
            Account a = adao.getAccountByUsername(username);
            String messageUserAuth = "";
            String passwordMD5 = md5.hashPassword(password);
            boolean isError = false;
            if (a == null && !isError) {
                messageUserAuth = "Your account no exist";
                isError = true;
            }
            if (!isError && a.getRole() != 0) {
                messageUserAuth = "Your account can not login here";
                isError = true;
            }
            if (!isError && a.getStatus() == 0) {
                messageUserAuth = "Your account is blocked";
                isError = true;
            }
            if (!isError && !passwordMD5.equals(a.getPassword())) {
                messageUserAuth = "Password is not valid";
                isError = true;
            }
            if (!messageUserAuth.equals("")) {
                request.setAttribute("messageUserAuth", messageUserAuth);
                request.getRequestDispatcher("/user/login.jsp").forward(request, response);
                return;
            }
            String isRemember = request.getParameter("remember");
            if (isRemember != null) {
                int cookieMaxAge = 3 * 24 * 60 * 60;
                Cookie usernameCookie = new Cookie("usernameUser", a.getUsername());
                Cookie roleUserCookie = new Cookie("usernameRole", a.getRole() + "");
                usernameCookie.setMaxAge(cookieMaxAge);
                roleUserCookie.setMaxAge(cookieMaxAge);
                roleUserCookie.setPath("/");
                usernameCookie.setPath("/");
                response.addCookie(usernameCookie);
                response.addCookie(roleUserCookie);
            } else {
                session.setAttribute("usernameUser", a.getUsername());
                session.setAttribute("usernameRole", a.getRole() + "");
            }
            response.sendRedirect("/");
        } else if (request.getParameter("register") != null) {
            String username = request.getParameter("username");
            Account accountCheck = adao.getAccountByUsername(username);
            if (accountCheck != null) {
                request.setAttribute("messageFailRegister", "Username is exist");
                request.getRequestDispatcher("/user/register.jsp").forward(request, response);
                return;
            }
            String email = request.getParameter("email");
            String phone = request.getParameter("phone");
            String password = request.getParameter("password");
            String passwordHash = md5.hashPassword(password);
            LocalDateTime dateTime = LocalDateTime.now();
            Timestamp dateCreate = Timestamp.valueOf(dateTime);
            Account account = new Account(0, null, email, phone, username, passwordHash, 0, dateCreate, 1);
            int result = adao.insertAccountUser(account);
            if (result > 0) {
                session.setAttribute("messageSuccessRegister", "Register successfully.");
                session.setMaxInactiveInterval(3);
                response.sendRedirect("/auth/login");
            } else {
                request.setAttribute("messageFailRegister", "Register fail. Try again");
                request.getRequestDispatcher("/user/register.jsp").forward(request, response);
            }
        }
    }
}
