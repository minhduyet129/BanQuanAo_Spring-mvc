<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@taglib prefix="f" uri="http://www.springframework.org/tags/form"%>
<%@ taglib prefix = "fmt" uri = "http://java.sun.com/jsp/jstl/fmt" %>
<!DOCTYPE html>
<html lang="en">
    <head>
        <meta charset="utf-8">
        <meta http-equiv="X-UA-Compatible" content="IE=edge">
        <meta name="viewport" content="width=device-width, initial-scale=1">
        <title>E-SHOP HTML Template</title>
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
        <jsp:include page="menu.jsp" flush="true"></jsp:include>
        </div>
        <!-- /container -->
    </div>
    <!-- /NAVIGATION -->
    <!-- section -->

    <!-- BREADCRUMB -->
    <div id="breadcrumb">
        <div class="container">
            <ul class="breadcrumb">
                <li><a href="#">Home</a></li>
                <li class="active">Checkout</li>
            </ul>
        </div>
    </div>
    <!-- /BREADCRUMB -->

    <!-- section -->
    <div class="section">
        <!-- container -->
        <div class="container">
            <!-- row -->


        <% if (session.getAttribute("myCartItems") != null) {%>
        <div class="row">
            <div class="col-md-12">
                <form id="checkout-form">
                    <div class="section-title">
                        <h3 class="title">Chi ti???t ????n h??ng</h3>
                        
                    </div>
                    <table class="shopping-cart-table table">
                        <thead>
                            <tr>
                                <th>???nh</th>
                                <th>Product</th>
                                <th class="text-center">Price</th>
                                <th class="text-center">Quantity</th>
                                <th class="text-center">Total</th>
                                <th class="text-right"></th>
                            </tr>
                        </thead>
                        <tbody>
                            <c:forEach var="map" items="${myCartItems}">
                                <tr>
                                    <td class="thumb"><img src="${map.value.sanPham.anh}" alt=""></td>
                                    <td class="details">
                                        <a href="#">${map.value.sanPham.tenSp}</a>
                                    </td>
                                    <td class="price text-center"><strong>$${map.value.sanPham.gia}</strong><br><del class="font-weak"></del></td>
                                    <td class="qty text-center">
                                        <a class="fa fa-arrow-left" href = "giam.htm?maSp=${map.value.sanPham.maSp}"/>
                                        &nbsp;&nbsp;
                                        <input class="input" type="number" value="${map.value.soLuong}" readonly="true"/>
                                        &nbsp;&nbsp;
                                        <a class="fa fa-arrow-right" href = "tang.htm?maSp=${map.value.sanPham.maSp}"/>
                                    </td>
                                    </td>
                                    <td class="total text-center"><strong class="primary-color"><fmt:formatNumber value="${map.value.soLuong * map.value.sanPham.gia}"/></strong></td>
                                    <td class="text-right"><button class="main-btn icon-btn" onclick="location.href = 'remove.htm?maSp=${map.value.sanPham.maSp}'"><i class="fa fa-close"></i></button></td>
                                </tr>
                            </c:forEach>
                        </tbody>
                    </table>
                </form>
            </div>
            <div class="col-md-6">
                <div class="shiping-methods">
                    <div class="section-title">
                        <h4 class="title">Ph????ng th???c v???n chuy???n</h4>
                    </div>

                    <c:forEach var="vc" items="${vanchuyen}">
                        <div class="input-checkbox">
                            
                                <input type="checkbox" onclick="location.href = 'checkedvanchuyen.htm?maVc=${vc.maVc}'" id="shipping-1" >
                            
                            
                            <label for="shipping-1">${vc.tenVc} -  <fmt:formatNumber value="${vc.gia}"/> VN??</label>
                            <div class="caption">
                                <p>${vc.mota}
                                <p>
                            </div>
                        </div>
                    </c:forEach>
                </div>
            </div>

            <f:form id="checkout-form" class="clearfix" action="muahang.htm" commandName="donHang" method="get">
                <div class="col-md-6">
                    <div class="billing-details">
                        <div class="section-title">
                            <h3 class="title">Chi ti???t kh??ch h??ng</h3>
                        </div>
                        <% if (session.getAttribute("ten") != null) {%>
                        <div class="form-group">
                            <f:input class="input" type="hidden" path="maKh" value='<%=session.getAttribute("ma")%>'/>
                        </div>
                        <div class="form-group">
                            <f:input class="input" type="text" path="tenKh" placeholder="H??? v?? t??n" value='<%=session.getAttribute("ten")%>' required="required"/>
                        </div>
                        <div class="form-group">
                            <f:input class="input" type="email" path="email" placeholder="Email" value='<%=session.getAttribute("email")%>' required="required"/>
                        </div>
                        <div class="form-group">
                            <f:input class="input" type="text" path="diaChi" placeholder="?????a ch???" value='<%=session.getAttribute("diachi")%>' required="required"/>
                        </div>
                        <div class="form-group">
                            <f:input class="input" type="text" path="soDienThoai" placeholder="S??? ??i???n tho???i" value='<%=session.getAttribute("sodienthoai")%>' required="required"/>
                        </div>
                        <% } else { %>
                        <h4 class="color1">B???n ch??a ????ng nh???p t??i kho???n? <a href="loginuser.htm" class="btn btn-info">????ng nh???p ngay</a></h4>
                        <% }%>
                    </div>
                </div>
                <div class="col-md-12">
                    <div class="order-summary clearfix">
                        <div class="section-title">
                            <h3 class="title">T???ng gi?? th??nh</h3>
                        </div>
                        <table class="shopping-cart-table table">
                            <tfoot>
                                <tr>
                                    <th class="empty" colspan="3"></th>
                                    <th>Ph????ng th???c thanh to??n</th>
                                    <td colspan="2"><f:select class="browser-default custom-select custom-select-lg mb-3" path="maTt" items="${thanhtoan}" itemLabel="tenTt" itemValue="maTt"/><br></td>
                                </tr>
                                <tr>
                                    <th class="empty" colspan="3"></th>
                                    <th>Gi?? s???n ph???m</th>
                                    <th colspan="2" class="sub-total"><h4><fmt:formatNumber value="${sessionScope.myCartTotal}"/></h4></th>
                            </tr>
                            <tr>

                                <th class="empty" colspan="3"></th>
                                <th>Gi?? v???n chuy???n</th>
                                    <% if (session.getAttribute("mavanchuyen") != null) {%>
                                <td colspan="2"><h4>${mavanchuyen.gia}</h4><f:input path="maVc" type="hidden" value="${mavanchuyen.maVc}"/></td>
                                        <% } else { %>
                                <td colspan="2"><div><h4  class="color">B???n c???n l???a ch???n ph????ng th???c v???n chuy???n</h4></div></td>

                                <% } %>
                            </tr>

                            <tr>
                                <th class="empty" colspan="3"></th>
                                <th>T???ng</th>
                                <th colspan="2" class="total"><spam><fmt:formatNumber value="${sessionScope.myCartTotal + mavanchuyen.gia}"/> </spam>VN?? 
                            <f:input path="tongTien"  type="hidden"  value="${sessionScope.myCartTotal + mavanchuyen.gia}"/> </th>
                            </tr>
                            </tfoot>
                        </table>
                        <% if (session.getAttribute("mavanchuyen") != null) {%>
                        <% if (session.getAttribute("ten") != null) {%>
                        <div class="pull-right">
                            <f:button onclick="return confirm('B???n c?? mu???n thanh to??n kh??ng')" class="primary-btn">Thanh to??n</f:button>
                            </div>
                        <% } else { %>
                        <div class="pull-right">
                            <a href="loginuser.htm" onclick="return confirm('B???n c???n ????ng nh???p')" class="primary-btn">Thanh to??n</a>
                        </div>
                        <% }%>
                        <% }%>


                    </div>
                </div>
            </f:form>
        </div>
        <% } else { %>
        <div class="text-center">
        <h3 class="color">Kh??ng c?? s???n ph???m n??o trong gi??? h??ng</h3>
        <a href="redirect.jsp" ><img src="https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcQGydwbs-dgjc77D9Ur7jBeiUf4sO5QV2B1YDMF0kBhqr10V3-v" width="150px" height="150px" /></a>
            </div>
        <% }%>


            <!-- /row -->
    </div>
    <!-- /container -->
</div>
<!-- /section -->


<jsp:include page="footer.jsp" flush="true"></jsp:include>
<script src="/views/js/jquery.min.js"></script>
<script src="/views/js/bootstrap.min.js"></script>
<script src="/views/js/slick.min.js"></script>
<script src="/views/js/nouislider.min.js"></script>
<script src="/views/js/jquery.zoom.min.js"></script>
<script src="/views/js/main.js"></script>

</body>

</html>

