<%@include file="/common/lib.jsp"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<div class="modal fade" id="update_modal" tabindex="-1" role="dialog" aria-labelledby="update_asset" aria-hidden="true" data-backdrop="static">
    <div class="modal-dialog modal-lg" role="document">
        <div class="modal-content">
            <div class="modal-header">
                <h5 class="modal-title text-primary"><c:if test="${isUpdatePage == false}">TẠO TÀI KHOẢN</c:if><c:if test="${isUpdatePage == true}">SỬA TÀI KHOẢN</c:if></h5>
                    <button type="button" class="close" data-dismiss="modal" aria-label="Close">
                        <span aria-hidden="true">&times;</span>
                    </button>
                </div>
                <div class="modal-body">
                        <form id="save-form" method="<c:if test="${isUpdatePage == true}">PUT</c:if><c:if test="${isUpdatePage == false}">POST</c:if>" >
                        <div class="form-row">
                            <div class="form-group col-md-6 col-lg-4">
                                <label>Tên đăng nhập</label>
                                    <input type="text" class="form-control" name="username" value="${account.username}" <c:if test="${isUpdatePage == true}">readonly</c:if>>
                            </div>
                            <div class="form-group col-md-6 col-lg-4">
                                <label>Mật khẩu</label>
                                <input type="password" class="form-control" name="password" value="${account.password}">
                        </div>
                        <div class="form-group col-md-6 col-lg-4">
                            <label>Trạng thái</label>
                            <select class="form-control" name="status">
                                <option value="true" <c:if test="${account.status == true}">selected</c:if>>
                                        Hoạt động
                                    </option>
                                    <option value="false" <c:if test="${account.status == false}">selected</c:if>>
                                        Khóa
                                    </option>
                                </select>
                            </div>
                        </div>
                    </form>
                </div>
                <div class="modal-footer">
                    <button class="btn btn-primary mr-auto <c:if test="${isUpdatePage == false}">d-none</c:if> <c:if test="${isUpdatePage == true}">d-inline-block</c:if>" id="permissionBtn">
                        <i class="fas fa-user-shield mr-2"></i>Phân quyền
                    </button>
                    <button type="button" class="btn btn-secondary" data-dismiss="modal">Đóng</button>
                    <button type="button" class="btn btn-primary action" action="saveAndClose">Lưu và đóng</button>
                        <button type="button" class="btn btn-primary action <c:if test="${isUpdatePage == true}">d-none</c:if>" action="saveAndNew">Lưu và tạo mới</button>
            </div>
        </div>
    </div>
</div>