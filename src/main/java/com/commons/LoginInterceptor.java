package com.commons;

import org.springframework.web.servlet.HandlerInterceptor;
import org.springframework.web.servlet.ModelAndView;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

public class LoginInterceptor implements HandlerInterceptor {
    @Override
    public boolean preHandle(HttpServletRequest request, HttpServletResponse response, Object handler) throws Exception {

        /*HttpSession session = (HttpSession) request.getSession().getAttribute("user");

//        전문가 등록을 눌렀을 때
            if (request.getRequestURI().contains("/talentform.do") &&
                    session == null) {
                response.sendRedirect("/loginform.do");
                return false;
//            쪽지 창 그냥 들어갈 때
            } else if (request.getRequestURI().contains("/messagechk.do") &&
                    session == null) {
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
