<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@taglib prefix="f" uri="http://www.springframework.org/tags/form"%>
<!DOCTYPE html>
<html lang="en">

    <head>
        <meta charset="utf-8">
        <meta http-equiv="X-UA-Compatible" content="IE=edge">
        <meta name="viewport" content="width=device-width, initial-scale=1">
        <title>E-SHOP HTML Template</title>
        <link href="//maxcdn.bootstrapcdn.com/bootstrap/3.3.0/css/bootstrap.min.css" rel="stylesheet" id="bootstrap-css">
        <script src="//maxcdn.bootstrapcdn.com/bootstrap/3.3.0/js/bootstrap.min.js"></script>
        <script src="//code.jquery.com/jquery-1.11.1.min.js"></script>
        <link href="https://fonts.googleapis.com/css?family=Hind:400,700" rel="stylesheet">
        <link type="text/css" rel="stylesheet" href="/views/css/bootstrap.min.css" />
        <link type="text/css" rel="stylesheet" href="/views/css/slick.css" />
        <link type="text/css" rel="stylesheet" href="/views/css/slick-theme.css" />
        <link type="text/css" rel="stylesheet" href="/views/css/nouislider.min.css" />
        <link rel="stylesheet" href="/views/css/font-awesome.min.css">
        <link type="text/css" rel="stylesheet" href="/views/css/style.css" />
    </head>
    <body>
        <header>
            <jsp:include page="header.jsp" flush="true"></jsp:include>
            </header>
            <div id="navigation">
                <!-- container -->
                <div class="container">
                    <div id="responsive-nav">
                        <!-- category nav -->
                        <div class="category-nav show-on-click">
                            <span class="category-header" style="cursor:pointer">DANH MỤC SẢN PHẨM <i class="fa fa-list"></i></span>
                            <ul class="category-list">
                            <c:forEach var="item" items="${nhomsanpham}">
                                <li class="dropdown side-dropdown" style="cursor:pointer">
                                    <a onclick="location.href = 'searchbynhomsp.htm?maNhomSp=${item.maNhomSp}'" class="dropdown-toggle" data-toggle="dropdown" aria-expanded="true">${item.tenNhomSp}<i class="fa fa-angle-right"></i></a>
                                </li>
                            </c:forEach>
                        </ul>
                    </div>
                </div>
                <div class="menu-nav">
                    <span class="menu-header">Menu <i class="fa fa-bars"></i></span>
                    <ul class="menu-list">
                        <li><a href="redirect.jsp">TRANG CHỦ</a></li>
                        <li><a href="checkout.htm">GIỎ HÀNG</a></li>
                        <li><a href="#">THÔNG TIN SHOP</a></li>
                        <li><a href="#">SẢN PHẨM ĐƯỢC ƯA THÍCH</a></li>
                        
                    </ul>
                </div>
                <!-- menu nav -->
            </div>
        </div>
        <!-- /container -->
    </div>
    <!-- /NAVIGATION -->
    <!-- section -->

    <!------ Include the above in your HEAD tag ---------->

    <div class="container chitietdonhang">
        <table class="shopping-cart-table table">
            <thead>
                <tr>
                    <th class="text-center">Tên khách hàng</th>
                    <th class="text-center">Địa chỉ</th>
                    <th class="text-center">Số điện thoại</th>
                    <th class="text-center">Tổng tiền </th>
                    <th class="text-center">Ngày mua </th>
                    <th></th>
                </tr>
            </thead>
            <tbody>
                <c:forEach items="${donhang}" var="dh">
                    <tr>
                        <td class="thumb text-center">${dh.tenKh}</td>
                        <td class="price text-center"><strong>${dh.diaChi}</strong><br><del class="font-weak"></del></td>
                        <td class="price text-center"><strong>${dh.soDienThoai}</strong><br><del class="font-weak"></del></td>
                        <td class="total text-center"><strong class="primary-color">${dh.tongTien}</strong></td>
                        <td class="thumb text-center">${dh.ngayMua}</td>
                        <td><h4><a href="chitietdonhang.htm?maDh=${dh.maDh}">Chi tiết đơn hàng</a></h4></td>
                    </tr>
                </c:forEach>
            </tbody>
        </table>
    </div>

    <jsp:include page="footer.jsp" flush="true"></jsp:include>
    <script src="/views/js/jquery.min.js"></script>
    <script src="/views/js/bootstrap.min.js"></script>
    <script src="/views/js/slick.min.js"></script>
    <script src="/views/js/nouislider.min.js"></script>
    <script src="/views/js/jquery.zoom.min.js"></script>
    <script src="/views/js/main.js"></script>
    
</body>

</html>
