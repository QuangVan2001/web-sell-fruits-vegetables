<%@page import="com.vnpay.common.Config"%>
<%@page contentType="application/json; charset=UTF-8"%>
<%-- 
    Document   : vnpay_ipn
    Created on : Sep 29, 2015, 7:23:56 PM
    Author     : xonv
    Description: IPN URL su dung de nhan ket qua thanh toan tu server của VNPAY
--%>

<%@page import="java.util.Iterator"%>
<%@page import="java.util.Collections"%>
<%@page import="java.util.List"%>
<%@page import="java.util.ArrayList"%>
<%@page import="java.util.Enumeration"%>
<%@page import="java.util.Map"%>
<%@page import="java.util.HashMap"%>

<%
    //Begin process return from VNPAY
    Map fields = new HashMap();
    for (Enumeration params = request.getParameterNames(); params.hasMoreElements();) {
        String fieldName = (String) params.nextElement();
        String fieldValue = request.getParameter(fieldName);
        if ((fieldValue != null) && (fieldValue.length() > 0)) {
            fields.put(fieldName, fieldValue);
        }
    }

    String vnp_SecureHash = request.getParameter("vnp_SecureHash");
    if (fields.containsKey("vnp_SecureHashType")) {
        fields.remove("vnp_SecureHashType");
    }
    if (fields.containsKey("vnp_SecureHash")) {
        fields.remove("vnp_SecureHash");
    }
    String signValue = Config.hashAllFields(fields);
    if (signValue.equals(vnp_SecureHash)) {
        //Kiem tra chu ky OK
        /* Kiem tra trang thai don hang trong DB: checkOrderStatus, 
        - Neu trang thai don hang OK, tien hanh cap nhat vao DB, tra lai cho VNPAY RspCode=00
        - Neu trang thai don hang (da cap nhat roi) => khong cap nhat vao DB, tra lai cho VNPAY RspCode=02
         */
        boolean checkOrderStatus = true;

        if (checkOrderStatus) {
            if ("00".equals(request.getParameter("vnp_ResponseCode"))) {
                //Xu ly thanh toan thanh cong
                // out.print("GD Thanh cong");
            } else {
                //Xu ly thanh toan khong thanh cong
                //  out.print("GD Khong thanh cong");
            }
            out.print ("{\"RspCode\":\"00\",\"Message\":\"Confirm Success\"}");
        } else {
            //Don hang nay da duoc cap nhat roi, Merchant khong cap nhat nua (Duplicate callback)
            out.print("{\"RspCode\":\"02\",\"Message\":\"Order already confirmed\"}");
        }

    } else {
        out.print("{\"RspCode\":\"97\",\"Message\":\"Invalid Checksum\"}");
    }
%>
