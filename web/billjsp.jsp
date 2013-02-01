<%-- 
    Document   : billjsp
    Created on : Jan 31, 2013, 10:21:14 PM
    Author     : production
--%>

<%@page import="java.text.DecimalFormat"%>
<%@page import="java.util.Map"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <link rel="stylesheet" type="text/css" href="restaurantcss.css">
        <title>Time for the bill</title>
    </head>
    <body>
        <h2>Bill for the Servlet Slophouse</h2>
        <hr>
    
        <%
            DecimalFormat df = new DecimalFormat("$#0.00");
            double totalBill;
            double theTax;
            double suggestedTip;
            
            final double TAX_RATE = .055;
            final double TIP_RATE = .15;
            
                        
            Map bill = (Map) request.getAttribute("total");
            String meal, beverage;
            double mealPrice, beveragePrice;
            meal = bill.get("meal").toString();
            mealPrice = Double.parseDouble(bill.get("mealprice").toString());
            beverage = bill.get("beverage").toString();
            beveragePrice = Double.parseDouble(bill.get("beverageprice").toString());
            
            totalBill = beveragePrice + mealPrice;
            theTax = totalBill * TAX_RATE;
            suggestedTip = totalBill * TIP_RATE;
            
            out.print("<table width=400>");
            out.print("<tr><td width=270>Your meal was a " + meal + " at a cost of </td><td align = \"right\">" + 
                    df.format(mealPrice) + "</td></tr>");
            out.print("<tr><td>Your beverage was " + beverage + " at a cost of </td><td align = \"right\">" + 
                    df.format(beveragePrice) + "</td></tr>");
            out.print("<tr><td>Your total before tax was </td><td align = \"right\">" + df.format(totalBill) + "</td></tr>");
            out.print("<tr><td>The tax on the meal was </td><td align = \"right\">" + df.format(theTax) + "</td></tr>");
            out.print("<tr><td>The suggest tip is </td><td align = \"right\">" + df.format(suggestedTip) + "</td></tr>");
            out.print("<tr><td>The total with tip is </td><td align = \"right\">" + df.format(totalBill + theTax + suggestedTip) + "</td></tr>");
            out.print("</table>");
            out.print("<hr>");
            out.print("<h3 text-align: center\">Please come again...</h3>");
        %>
</body>
</html>