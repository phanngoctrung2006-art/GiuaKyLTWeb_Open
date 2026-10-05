<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="jakarta.tags.core" %>

<nav class="navbar navbar-expand-lg navbar-dark bg-primary px-4 py-2 shadow-sm">
    <div class="container-fluid">
        <a class="navbar-brand fw-bold fs-4" href="${pageContext.request.contextPath}/home">🎬 VideoApp</a>
        <button class="navbar-toggler" type="button" data-bs-toggle="collapse" data-bs-target="#mainNavbar">
            <span class="navbar-toggler-icon"></span>
        </button>
        <div class="collapse navbar-collapse" id="mainNavbar">
            <ul class="navbar-nav me-auto mb-2 mb-lg-0">
                <li class="nav-item">
                    <a class="nav-link text-white fw-semibold" href="${pageContext.request.contextPath}/home">Trang Chủ</a>
                </li>
                <li class="nav-item">
                    <a class="nav-link text-white fw-semibold" href="${pageContext.request.contextPath}/home">Sản phẩm</a>
                </li>
                <!-- Menu Trang quản trị: Chỉ hiển thị khi đăng nhập với vai trò Admin -->
                <c:if test="${sessionScope.user != null && sessionScope.user.admin}">
                    <li class="nav-item">
                        <a class="nav-link text-warning fw-bold" href="${pageContext.request.contextPath}/admin/home">
                            🛡️ Trang quản trị
                        </a>
                    </li>
                </c:if>
            </ul>

            <div class="d-flex align-items-center gap-2">
                <c:choose>
                    <c:when test="${not empty sessionScope.user}">
                        <span class="text-white me-2">
                            Xin chào, <strong>${sessionScope.user.fullname != null ? sessionScope.user.fullname : sessionScope.user.username}</strong>
                            <c:if test="${sessionScope.user.admin}">
                                <span class="badge bg-danger ms-1">Admin</span>
                            </c:if>
                        </span>
                        <c:if test="${sessionScope.user.admin}">
                            <a class="btn btn-warning btn-sm fw-semibold" href="${pageContext.request.contextPath}/admin/home">Quản trị</a>
                        </c:if>
                        <a class="btn btn-outline-light btn-sm" href="${pageContext.request.contextPath}/logout">Đăng xuất</a>
                    </c:when>
                    <c:otherwise>
                        <a class="btn btn-outline-light btn-sm" href="${pageContext.request.contextPath}/login">Đăng nhập</a>
                        <a class="btn btn-light btn-sm fw-semibold text-primary" href="${pageContext.request.contextPath}/register">Đăng ký</a>
                    </c:otherwise>
                </c:choose>
            </div>
        </div>
    </div>
</nav>