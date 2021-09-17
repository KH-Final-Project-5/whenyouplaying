package com.commons;

import org.springframework.web.servlet.HandlerInterceptor;
import org.springframework.web.servlet.ModelAndView;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

public class LoginInterceptor implements HandlerInterceptor {
    @Override
    public boolean preHandle(HttpServletRequest request, HttpServletResponse response, Object handler) throws Exception {


        if (request.getRequestURI().contains("/category.do")
                || request.getRequestURI().contains("Detail.do")
                || request.getRequestURI().contains("main.do")
                || request.getRequestURI().contains("loginform.do")
                || request.getRequestURI().contains("prsearch.do")
                || request.getRequestURI().contains("login.do")) {
            return true;
        } else if (request.getSession().getAttribute("user") == null) {
            response.sendRedirect("/loginform.do");
            return false;
        }
//        전문가 등록을 눌렀을 때
            /*if (request.getRequestURI().contains("/talentform.do") &&
                    request.getSession().getAttribute("user") == null) {
                response.sendRedirect("/loginform.do");
                return false;
//            쪽지 창 그냥 들어갈 때
            } else if (request.getRequestURI().contains("/messagechk.do") &&
                    request.getSession().getAttribute("user") == null) {

            }*/
        return true;

    }

    @Override
    public void postHandle(HttpServletRequest request, HttpServletResponse response, Object handler, ModelAndView modelAndView) throws Exception {

    }

    @Override
    public void afterCompletion(HttpServletRequest request, HttpServletResponse response, Object handler, Exception ex) throws Exception {

    }
}
