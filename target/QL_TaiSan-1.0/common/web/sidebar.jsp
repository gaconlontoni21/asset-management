<%@include file="/common/lib.jsp"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<div class="side-bar">
    <header>
        <button type="button" class="close text-right text-light" data-dismiss="modal" id="closeSidebarBtn">
            <span aria-hidden="true">&times;</span>
        </button>
        <img src="${sessionUser.avatar}" alt="Ảnh đại diện">
        <h1 class="full-name">${sessionUser.getFullName()}</h1>
    </header>
    <div class="menu">
        <div class="item">
            <a href="javascript:void(0)" data-value="dashboard">
                <i class="fas fa-building"></i>Tổng quan
            </a>
        </div>
        <div class="item">
            <a href="javascript:void(0)" class="sub-btn">
                <i class="fas fa-cube"></i>Tài Sản
                <i class= "fas fa-angle-right dropdown"></i>
            </a>
            <div class="sub-menu">
                <a href="javascript:void(0)" class="sub-item" data-value="assets">
                    <i class="fas fa-cubes"></i>Danh mục tài sản
                </a>
                <a href="javascript:void(0)" class="sub-item" data-value="assetTypes">
                    <i class="fas fa-sitemap"></i>Loại tài sản
                </a>
            </div>
        </div>
        <div class="item">
            <a href="javascript:void(0)" class="sub-btn">
                <i class="fas fa-box-open"></i>Kho
                <i class= "fas fa-angle-right dropdown"></i>
            </a>
            <div class="sub-menu">
                <a href="javascript:void(0)" class="sub-item" data-value="inventory">
                    <i class="fas fa-list-ol"></i>Tồn kho
                </a>
                <a href="javascript:void(0)" class="sub-item" data-value="invoices">
                    <i class="fas fa-file-signature"></i>Hóa đơn
                </a>
                <a href="javascript:void(0)" class="sub-item" data-value="inventoryTransactions">
                    <i class="fas fa-file-import"></i>Nhập kho
                </a>
                <a href="javascript:void(0)" class="sub-item" data-value="assetTransfer">
                    <i class="fas fa-repeat"></i>Chuyển tài sản
                </a>
                <a href="javascript:void(0)" class="sub-item" data-value="assetDispose">
                    <i class="fas fa-ban"></i>Chuyển hủy
                </a>
                <a href="javascript:void(0)" class="sub-item" data-value="departmentalAssets">
                    <i class="fas fa-check-square"></i>Tài sản phòng ban
                </a>
            </div>
        </div>
        <div class="item">
            <a href="javascript:void(0)" class="sub-btn">
                <i class="fas fa-chart-line"></i>Khấu hao
                <i class= "fas fa-angle-right dropdown"></i>
            </a>
            <div class="sub-menu">
                <a href="javascript:void(0)" class="sub-item" data-value="depreciation">
                    <i class="fas fa-chart-line"></i>Tính khấu hao
                </a>
                <a href="javascript:void(0)" class="sub-item" data-value="accountingPeriods">
                    <i class="fas fa-calendar-alt"></i>Kỳ kế toán
                </a>
                <a href="javascript:void(0)" class="sub-item" data-value="accountingPeriodTypes">
                    <i class="fas fa-calendar-week"></i>Loại kỳ kế toán
                </a>
                <a href="javascript:void(0)" class="sub-item" data-value="depreciationMethods">
                    <i class="fas fa-cogs"></i>Phương pháp KH
                </a>
            </div>
        </div>
        <div class="item">
            <a href="javascript:void(0)" data-value="departments">
                <i class="fas fa-building"></i>Phòng Ban
            </a>
        </div>
        <div class="item">
            <a href="javascript:void(0)" data-value="users">
                <i class="fas fa-user"></i>Người Dùng
            </a>
        </div>
        <div class="item">
            <a href="javascript:void(0)" data-value="accounts">
                <i class="fas fa-user-lock"></i>Tài khoản
            </a>
        </div>
        <div class="item">
            <a href="javascript:void(0)" data-value="suppliers">
                <i class="fas fa-user-tie"></i>Nhà cung cấp
            </a>
        </div>
        <div class="item">
            <a href="javascript:void(0)" class="sub-btn">
                <i class="fas fa-gear" ></i>Cài đặt
                <i class= "fas fa-angle-right dropdown"></i>
            </a>
            <div class="sub-menu">
                <a href="javascript:void(0)" class="sub-item" data-value="log">
                    <i class="fas fa-history"></i>Nhật ký thao tác
                </a>
                <a href="javascript:void(0)" class="sub-item" data-value="logout">
                    <i class="fas fa-power-off"></i>Đăng xuất
                </a>
            </div>
        </div>
    </div>
</div>