<%@include file="/common/lib.jsp"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<div class="modal fade" id="update_modal" tabindex="-1" role="dialog" aria-labelledby="update_asset" aria-hidden="true" data-backdrop="static">
    <div class="modal-dialog modal-lg" role="document">
        <div class="modal-content">
            <div class="modal-header">
                <h5 class="modal-title text-primary"><c:if test="${isUpdatePage == false}">TẠO NHÀ CUNG CẤP</c:if><c:if test="${isUpdatePage == true}">SỬA NHÀ CUNG CÁP</c:if></h5>
                    <button type="button" class="close" data-dismiss="modal" aria-label="Close">
                        <span aria-hidden="true">&times;</span>
                    </button>
                </div>
                <div class="modal-body">
                        <form id="save-form" method="<c:if test="${isUpdatePage == true}">PUT</c:if><c:if test="${isUpdatePage == false}">POST</c:if>" >
                        <div class="form-row">
                            <div class="form-group col-md-6 col-lg-4">
                                <label for="inputId">Mã nhà cung cấp</label>
                                    <input type="number" class="form-control" <c:if test="${isUpdatePage == true}">name="id"</c:if> value="${supplier.id}" readonly>
                            </div>
                            <div class="form-group col-md-6 col-lg-4">
                                <label for="inputName">Tên</label>
                                <input type="text" class="form-control" name="name" value="${supplier.name}">
                        </div>
                        <div class="form-group col-md-6 col-lg-4">
                            <label for="inputId">Số điện thoại</label>
                            <input type="text" class="form-control" name="phoneNumber" value="${supplier.phoneNumber}">
                        </div>
                    </div>
                    <div class="form-row">
                        <div class="form-group col-12">
                            <label for="inputId">Địa chỉ</label>
                            <textarea type="text" class="form-control" name="address">${supplier.address}</textarea>
                        </div>
                    </div>
            </div>
            <div class="modal-footer">
                <button type="button" class="btn btn-secondary" data-dismiss="modal">Đóng</button>
                <button type="button" class="btn btn-primary action" action="saveAndClose">Lưu và đóng</button>
                <button type="button" class="btn btn-primary action <c:if test="${isUpdatePage == true}">d-none</c:if>" action="saveAndNew">Lưu và tạo mới</button>
            </div>
        </div>
    </div>
</div>