<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="jakarta.tags.core" %>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>Trang Chủ - Danh sách Video theo Category</title>
    <style>
        .video-card {
            border: 1px solid #dee2e6;
            border-radius: 6px;
            padding: 12px;
            background: #fff;
            height: 100%;
            display: flex;
            flex-direction: column;
            justify-content: space-between;
        }
        .video-poster-box {
            width: 100%;
            height: 180px;
            background-color: #f8f9fa;
            border: 1px dashed #ced4da;
            display: flex;
            align-items: center;
            justify-content: center;
            margin-bottom: 12px;
            overflow: hidden;
            border-radius: 4px;
        }
        .video-poster-box img {
            width: 100%;
            height: 100%;
            object-fit: cover;
        }
        .video-info-line {
            font-size: 0.95rem;
            margin-bottom: 4px;
        }
        .category-header-title {
            background-color: #f8f9fa;
            border-left: 5px solid #0d6efd;
            padding: 10px 16px;
            font-weight: bold;
            margin-bottom: 20px;
        }
    </style>
</head>
<body>
<div class="container my-3">

    <!-- Danh sách tabs chọn danh mục (Category) -->
    <div class="mb-4">
        <h6 class="text-muted fw-bold text-uppercase mb-2">Chọn Danh Mục:</h6>
        <div class="d-flex flex-wrap gap-2">
            <c:forEach items="${categories}" var="c">
                <a href="${pageContext.request.contextPath}/home?categoryId=${c.categoryId}" 
                   class="btn btn-sm ${selectedCategoryId == c.categoryId ? 'btn-primary' : 'btn-outline-primary'} rounded-pill px-3 fw-semibold">
                    ${c.categoryname} (${c.videoCount})
                </a>
            </c:forEach>
        </div>
    </div>

    <!-- Tiêu đề Category Name (Số lượng Video) - Giải quyết Câu 6 -->
    <div class="category-header-title d-flex justify-content-between align-items-center shadow-sm">
        <h4 class="mb-0 text-primary">
            <c:choose>
                <c:when test="${not empty selectedCategory}">
                    ${selectedCategory.categoryname} (${selectedCategory.videoCount})
                </c:when>
                <c:otherwise>
                    Tất cả danh mục (${totalVideos})
                </c:otherwise>
            </c:choose>
        </h4>
        <small class="text-muted">Phân trang: <strong>3 video / trang</strong></small>
    </div>

    <!-- Danh sách Video theo Category (Lưới 3 cột - Giải quyết Câu 5) -->
    <div class="row g-4">
        <c:choose>
            <c:when test="${not empty videoList}">
                <c:forEach items="${videoList}" var="v">
                    <div class="col-md-4">
                        <div class="video-card shadow-sm">
                            <div>
                                <!-- Khung ảnh Poster [poster] -->
                                <div class="video-poster-box">
                                    <a href="${pageContext.request.contextPath}/video/detail?id=${v.videoId}" class="w-100 h-100 d-block">
                                        <c:choose>
                                            <c:when test="${not empty v.poster}">
                                                <img src="${pageContext.request.contextPath}/image?fname=${v.poster}" 
                                                     alt="${v.title}" 
                                                     onerror="this.src='https://placehold.co/400x250?text=Poster';">
                                            </c:when>
                                            <c:otherwise>
                                                <div class="text-center text-muted pt-5">
                                                    <i class="bi bi-image fs-1"></i><br>
                                                    <span>[poster]</span>
                                                </div>
                                            </c:otherwise>
                                        </c:choose>
                                    </a>
                                </div>

                                <!-- Tiêu đề -->
                                <div class="video-info-line">
                                    <strong>Tiêu đề:</strong> 
                                    <a href="${pageContext.request.contextPath}/video/detail?id=${v.videoId}" class="text-decoration-none fw-bold text-dark">
                                        ${v.title}
                                    </a>
                                </div>

                                <!-- Mã video -->
                                <div class="video-info-line">
                                    <strong>Mã video:</strong> <span class="text-secondary">${v.videoId}</span>
                                </div>

                                <!-- Category name -->
                                <div class="video-info-line">
                                    <strong>Category name:</strong> <span class="badge bg-secondary">${v.categoryName != null ? v.categoryName : 'Không có'}</span>
                                </div>

                                <!-- View -->
                                <div class="video-info-line">
                                    <strong>View:</strong> <span class="text-success fw-bold">${v.views}</span>
                                </div>
                            </div>

                            <!-- Share và Like -->
                            <div class="mt-3 pt-2 border-top d-flex justify-content-between align-items-center">
                                <span class="badge bg-primary fs-6 py-1 px-2">
                                    Share(${v.shareCount})
                                </span>
                                <span class="badge bg-danger fs-6 py-1 px-2">
                                    Like(${v.likeCount})
                                </span>
                                <a href="${pageContext.request.contextPath}/video/detail?id=${v.videoId}" class="btn btn-outline-primary btn-sm">
                                    Chi tiết &raquo;
                                </a>
                            </div>
                        </div>
                    </div>
                </c:forEach>
            </c:when>
            <c:otherwise>
                <div class="col-12 text-center py-5">
                    <div class="alert alert-warning d-inline-block px-5">
                        <i class="bi bi-info-circle me-2"></i> Không có video nào thuộc danh mục này!
                    </div>
                </div>
            </c:otherwise>
        </c:choose>
    </div>

    <!-- Thanh phân trang << 1 2 3 4 5 >> theo đúng định dạng đề thi -->
    <c:if test="${totalPages > 1}">
        <div class="d-flex justify-content-center mt-4">
            <nav aria-label="Page navigation">
                <ul class="pagination pagination-lg">
                    <!-- Nút << -->
                    <li class="page-item ${currentPage <= 1 ? 'disabled' : ''}">
                        <a class="page-link" href="${pageContext.request.contextPath}/home?categoryId=${selectedCategoryId}&page=${currentPage - 1}" aria-label="Previous">
                            &lt;&lt;
                        </a>
                    </li>

                    <!-- Các trang số: 1 2 3 4 5 ... -->
                    <c:forEach begin="1" end="${totalPages}" var="i">
                        <li class="page-item ${currentPage == i ? 'active' : ''}">
                            <a class="page-link" href="${pageContext.request.contextPath}/home?categoryId=${selectedCategoryId}&page=${i}">
                                ${i}
                            </a>
                        </li>
                    </c:forEach>

                    <!-- Nút >> -->
                    <li class="page-item ${currentPage >= totalPages ? 'disabled' : ''}">
                        <a class="page-link" href="${pageContext.request.contextPath}/home?categoryId=${selectedCategoryId}&page=${currentPage + 1}" aria-label="Next">
                            &gt;&gt;
                        </a>
                    </li>
                </ul>
            </nav>
        </div>
    </c:if>
</div>
</body>
</html>
