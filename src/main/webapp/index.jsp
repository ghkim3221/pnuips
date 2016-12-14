<%@ page import="kr.ac.pusan.pnuips.model.sell.Sell" %>
<%@ page import="java.util.List" %>
<jsp:useBean id="sellProcessor" class="kr.ac.pusan.pnuips.processor.SellProcessor"/>
<html>
<head>
    <meta charset="UTF-8">
    <title>PNUIPS</title>

    <jsp:include page="header.jsp"/>
</head>
<body>
<nav class="navbar navbar-inverse" style="margin-bottom: 0">
    <div class="container-fluid">
        <div class="navbar-header">
            <button class="navbar-toggle collapsed" type="button" data-toggle="collapse" data-target="#navbar"
                    aria-expanded="false" aria-controls="navbar">
                <span class="sr-only">Toggle navigation bar</span>
                <span class="icon-bar"></span>
                <span class="icon-bar"></span>
                <span class="icon-bar"></span>
            </button>
            <a class="navbar-brand" href="index.jsp">PNUIPS</a>
        </div>
        <div id="navbar" class="navbar-collapse collapse">
            <ul class="nav navbar-nav">
                <li class="active"><a href="#">Home</a></li>
                <li><a href="bestseller.jsp">Best Seller</a></li>
            </ul>
            <ul class="nav navbar-nav navbar-right">
                <%
                    if (session.getAttribute("signin") == null) {
                %>
                <li><a href="signin.jsp"><span class="glyphicon glyphicon-log-in"></span> Sign in</a></li>
                <li><a href="signup.jsp"><span class="glyphicon glyphicon-user"></span> Sign up</a></li>
                <%
                } else {
                %>
                <li><a href="mypage.jsp"><span class="glyphicon glyphicon-user"></span> My Page</a></li>
                <li><a href="signout.jsp"><span class="glyphicon glyphicon-log-out"></span> Sign out</a></li>
                <%
                    }
                %>
            </ul>
        </div>
    </div>
</nav>
<div class="jumbotron text-center" style="margin-top: 0;">
    <h1>PNUIPS</h1>
    <p>PNU Item Purchase System</p>
</div>
<div class="container">
    <div class="panel panel-default">
        <div class="panel-heading">Item List</div>
        <div class="panel-body">
            <table class="table table-striped">
                <thead>
                <tr>
                    <th>seller</th>
                    <th>name</th>
                    <th>brand</th>
                    <th>price</th>
                    <th>numberOfStock</th>
                    <th>numberOfSaes</th>
                </tr>
                </thead>
                <tbody style="cursor: hand;">
                <%
                    int start = 0;
                    if (request.getParameter("start") != null) {
                        start = Integer.parseInt(request.getParameter("start").toString());
                    }
                    List<Sell> sellList = sellProcessor.searchSellList(start);

                    for (Sell sell : sellList) {
                %>
                <tr onclick="location.href='item.jsp?itemcode=<%=sell.getItem().getItemcode()%>&sellercode=<%=sell.getSeller().getSellercode()%>'">
                    <td><%=sell.getSeller().getSellername()%>
                    </td>
                    <td><%=sell.getItem().getItemname()%>
                    </td>
                    <td><%=sell.getItem().getBrand()%>
                    </td>
                    <td><%=sell.getPrice()%>
                    </td>
                    <td><%=sell.getNumberOfStock()%>
                    </td>
                    <td><%=sell.getNumberOfSales()%>
                    </td>
                </tr>
                <%
                    }
                %>
                </tbody>
            </table>
        </div>
        <div class="panel-footer">
            <ul class="pager">
                <li><a href="index.jsp?start=<%=Math.min(start - 10, 0)%>">Previous</a></li>
                <li><a href="index.jsp?start=<%=start + 10%>">Next</a></li>
            </ul>
        </div>
    </div>
</div>
</body>
</html>
