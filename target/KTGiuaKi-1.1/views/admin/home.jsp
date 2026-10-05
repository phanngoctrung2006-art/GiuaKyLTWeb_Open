<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="jakarta.tags.core" %>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>Bảng điều khiển - Quản trị</title>
</head>
<body>
<div class="d-flex justify-content-between align-items-center mb-4 pb-2 border-bottom">
    <h2 class="h3 fw-bold text-dark mb-0">📊 BẢNG ĐIỀU KHIỂN HỆ THỐNG</h2>
    <span class="text-muted">Hệ thống quản trị Video & Người dùng</span>
</div>

<div class="row g-4 mb-4">
    <!-- Card Users -->
    <div class="col-md-4">
        <div class="card bg-primary text-white shadow-sm border-0 h-100">
            <div class="card-body d-flex align-items-center justify-content-between p-4">
                <div>
                    <h6 class="text-uppercase mb-2 text-white-50">Tổng số Người dùng</h6>
                    <h2 class="display-5 fw-bold mb-0">${totalUsers}</h2>
                </div>
                <div class="fs-1 text-white-50">
                    <i class="bi bi-people-fill"></i>
                </div>
            </div>
            <div class="card-footer bg-transparent border-0 pt-0 pb-3">
                <a href="${pageContext.request.contextPath}/admin/users" class="text-white text-decoration-none fw-semibold">
                    Quản trị Users <i class="bi bi-arrow-right"></i>
                </a>
            </div>
        </div>
    </div>

    <!-- Card Categories -->
    <div class="col-md-4">
        <div class="card bg-success text-white shadow-sm border-0 h-100">
            <div class="card-body d-flex align-items-center justify-content-between p-4">
                <div>
                    <h6 class="text-uppercase mb-2 text-white-50">Tổng số Danh mục</h6>
                    <h2 class="display-5 fw-bold mb-0">${totalCategories}</h2>
                </div>
                <div class="fs-1 text-white-50">
                    <i class="bi bi-folder-fill"></i>
                </div>
            </div>
            <div class="card-footer bg-transparent border-0 pt-0 pb-3">
                <a href="${pageContext.request.contextPath}/home" class="text-white text-decoration-none fw-semibold">
                    Xem Danh mục <i class="bi bi-arrow-right"></i>
                </a>
            </div>
        </div>
    </div>

    <!-- Card Videos -->
    <div class="col-md-4">
        <div class="card bg-warning text-dark shadow-sm border-0 h-100">
            <div class="card-body d-flex align-items-center justify-content-between p-4">
                <div>
                    <h6 class="text-uppercase mb-2 text-dark-50">Tổng số Video</h6>
                    <h2 class="display-5 fw-bold mb-0">${totalVideos}</h2>
                </div>
                <div class="fs-1 text-dark-50">
                    <i class="bi bi-film"></i>
                </div>
            </div>
            <div class="card-footer bg-transparent border-0 pt-0 pb-3">
                <a href="${pageContext.request.contextPath}/home" class="text-dark text-decoration-none fw-semibold">
                    Xem Danh sách Video <i class="bi bi-arrow-right"></i>
                </a>
            </div>
        </div>
    </div>
</div>

<div class="card shadow-sm border-0">
    <div class="card-header bg-white py-3">
        <h5 class="card-title mb-0 fw-bold">🚀 Lối tắt chức năng Quản trị</h5>
    </div>
    <div class="card-body">
        <div class="d-flex gap-3">
            <a href="${pageContext.request.contextPath}/admin/users" class="btn btn-primary">
                <i class="bi bi-people me-1"></i> Quản lý danh sách Users (6 user/trang)
            </a>
            <a href="${pageContext.request.contextPath}/admin/users/create" class="btn btn-success">
                <i class="bi bi-person-plus me-1"></i> Thêm User mới
            </a>
            <a href="${pageContext.request.contextPath}/home" class="btn btn-outline-secondary">
                <i class="bi bi-eye me-1"></i> Xem giao diện người dùng
            </a>
        </div>
    </div>
</div>
</body>
</html>
