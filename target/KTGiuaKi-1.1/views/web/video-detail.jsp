<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="jakarta.tags.core" %>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>${video.title} - Chi tiết Video</title>
</head>
<body>
<div class="container my-4">
    <!-- Nút quay lại -->
    <div class="mb-3">
        <a href="${pageContext.request.contextPath}/home?categoryId=${video.categoryId}" class="btn btn-outline-secondary btn-sm">
            &laquo; Quay lại danh sách
        </a>
    </div>

    <!-- Khung thông tin Video theo mẫu Câu 4 -->
    <div class="card shadow-sm border p-4 bg-white">
        <div class="row g-4 align-items-start">
            <!-- Cột Poster [poster] -->
            <div class="col-md-5 text-center">
                <c:choose>
                    <c:when test="${not empty video.poster}">
                        <img src="${pageContext.request.contextPath}/image?fname=${video.poster}" 
                             alt="${video.title}" class="img-fluid rounded shadow-sm border w-100" 
                             style="max-height: 350px; object-fit: cover;"
                             onerror="this.src='https://placehold.co/400x250?text=Poster';">
                    </c:when>
                    <c:otherwise>
                        <img src="https://placehold.co/400x250?text=Poster" 
                             alt="Poster" class="img-fluid rounded border w-100">
                    </c:otherwise>
                </c:choose>
            </div>

            <!-- Cột Thông tin chi tiết -->
            <div class="col-md-7">
                <div class="d-flex flex-column gap-2 fs-5">
                    <div>
                        <strong class="text-secondary">Tiêu đề:</strong> 
                        <span class="fw-bold text-primary">${video.title}</span>
                    </div>

                    <div>
                        <strong class="text-secondary">Mã video:</strong> 
                        <span class="badge bg-dark">${video.videoId}</span>
                    </div>

                    <div>
                        <strong class="text-secondary">Category name:</strong> 
                        <span class="badge bg-info text-dark">${video.categoryName != null ? video.categoryName : 'Không có'}</span>
                    </div>

                    <div>
                        <strong class="text-secondary">View:</strong> 
                        <span class="text-danger fw-bold">${video.views}</span> lượt xem
                    </div>

                    <div class="d-flex gap-3 mt-2">
                        <span class="badge bg-primary fs-6 py-2 px-3">
                            🔗 Share(${video.shareCount})
                        </span>
                        <span class="badge bg-danger fs-6 py-2 px-3">
                            ❤️ Like(${video.likeCount})
                        </span>
                    </div>
                </div>
            </div>
        </div>

        <!-- Khối Mô tả (description) ở phía dưới -->
        <hr class="my-4">
        <div>
            <h5 class="fw-bold text-dark mb-2">Mô tả video:</h5>
            <div class="p-3 bg-light rounded border text-muted" style="min-height: 80px; white-space: pre-line;">
                ${not empty video.description ? video.description : 'Không có mô tả cho video này.'}
            </div>
        </div>
    </div>
</div>
</body>
</html>
