<%-- 
    Document   : index
    Created on : Jul 28, 2023, 1:20:12 PM
    Author     : 1 9 9 8 N
--%>

<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="se" uri="http://www.springframework.org/security/tags" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>

<c:url value="/" var="action" />
<section class="container mt-3">
    <h1 class="text-center text-info mt-1">THỰC ĐƠN</h1>
    
    <se:authorize access="hasRole('ROLE_ADMIN')">
    <div>
        <a href="<c:url value="/products" />" class="btn btn-info">Thêm món mới</a>
    </div>
    </se:authorize>
    <c:choose>
        <c:when  test="${products.size() > 0}">
        <c:if test="${counter > 1}">
            <ul class="pagination mt-1">
                <li class="page-item"><a class="page-link" href="${action}">Tất cả</a></li>
                    <c:forEach begin="1" end="${counter}" var="i">
                        <c:url value="/" var="pageUrl">
                            <c:param name="page" value="${i}" />
                        </c:url>
                    <li class="page-item"><a class="page-link" href="${pageUrl}">${i}</a></li>
                    </c:forEach>
            </ul>
        </c:if>

        <table class="table table-hover ">
            <thead>
                <tr>
                    <th></th>
                    <th>Id</th>
                    <th>Tên món</th>
                    <th>Giá món</th>
                    <th>Danh mục</th>
                    <th></th>
                </tr>
            </thead>
            <tbody>
                <c:forEach items="${products}" var="p">
                    <tr>
                        <td>
                            <img src="${p.image}" alt="${p.name}" width="150" />
                        </td>
                        <td>${p.id}</td>
                        <td>${p.name}</td>
                        <td>${p.price} VND</td>
                        <td>${p.categoryId.name}</td>
                        <td>
                            <se:authorize access="hasRole('ROLE_ADMIN')">
                                <c:url value="/products/${p.id}" var="api" />
                                <a href="${api}" class="btn btn-info">Cập nhật</a>
                                <button class="btn btn-danger" onclick="deleteProduct('${api}')">Xóa</button>
                            </se:authorize>
                        </td>
                    </tr>
                </c:forEach>
            </tbody>
        </table>
         </c:when>
        <c:otherwise>
                <div role="alert" class="fade mt-5 alert alert-danger show text-center">Hết Hàng</div>          
        </c:otherwise>
    </c:choose>
</section>
    
<script src="<c:url value="/js/main.js"/>"></script>
