<%-- 
    Document   : products
    Created on : Jul 22, 2023, 1:15:37 PM
    Author     : admin
--%>

<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@taglib prefix="form" uri="http://www.springframework.org/tags/form" %>

<h1 class="text-center text-info mt-1">QUẢN LÝ MÓN ĂN</h1>

<c:url value="/products" var="action" />
<form:form modelAttribute="product" action="${action}" method="post" enctype="multipart/form-data">
    <form:errors path="*" element="div" cssClass="alert alert-danger" />
    <form:hidden path="id" />
    <form:hidden path="image" />
    <div class="form-floating mb-3 mt-3">
        <form:input type="text" class="form-control" path="name" id="name" placeholder="Tên sản phẩm" name="name" />
        <label for="name">Tên món ăn</label>
        <form:errors path="name" element="div" cssClass="text-danger" />
    </div>
    <div class="form-floating">
        <form:textarea class="form-control" id="des" name="des" path="description" placeholder="Mô tả sản phẩm"></form:textarea>
            <label for="des">Mô tả món ăn</label>
        <form:errors path="description" element="div" cssClass="text-danger" />
    </div>
    <div class="form-floating mb-3 mt-3">
        <form:input type="number" class="form-control" path="price" id="price" placeholder="Giá sản phẩm" name="price" />
        <label for="name">Giá món</label>
    </div>
    <div class="form-floating">
        <form:select class="form-select" id="cate" name="cate" path="categoryId">
            <c:forEach items="${categories}" var="c">
                <c:choose>
                    <c:when test="${c.id == product.categoryId.id}"><option value="${c.id}" selected>${c.name}</option></c:when>
                    <c:otherwise><option value="${c.id}">${c.name}</option></c:otherwise>
                </c:choose>

            </c:forEach>
        </form:select>
        <label for="cate" class="form-label">Danh mục món ăn</label>
    </div>
    <div class="form-floating mb-3 mt-3">
        <form:input type="file" class="form-control" path="file" id="file"  />
        <label for="file">Ảnh minh họa</label>
        <c:if test="${product.image != null}">
            <img src="${product.image}" width="120" />
        </c:if>
    </div>
    <div class="form-floating mb-3 mt-3">
        <button type="submit" class="btn btn-info">
            <c:choose>
                <c:when test="${product.id != null}">Cập nhật món</c:when>
                <c:otherwise>Thêm món</c:otherwise>
            </c:choose>
        </button>
    </div>
</form:form>
