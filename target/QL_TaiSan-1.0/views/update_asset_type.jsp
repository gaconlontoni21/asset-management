<%@include file="/common/lib.jsp"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<div class="modal fade" id="update_modal" tabindex="-1" role="dialog" aria-labelledby="update_asset" aria-hidden="true" data-backdrop="static">
    <div class="modal-dialog modal-lg" role="document">
        <div class="modal-content">
            <div class="modal-header">
                <h5 class="modal-title text-primary"><c:if test="${isUpdatePage == false}">TẠO LOẠI TÀI SẢN</c:if><c:if test="${isUpdatePage == true}">SỬA LOẠI TÀI SẢN</c:if></h5>
                    <button type="button" class="close" data-dismiss="modal" aria-label="Close">
                        <span aria-hidden="true">&times;</span>
                    </button>
                </div>
                <div class="modal-body">
                        <form id="save-form" method="<c:if test="${isUpdatePage == true}">PUT</c:if><c:if test="${isUpdatePage == false}">POST</c:if>" >
                        <div class="form-row">
                            <div class="form-group col-md-6 col-lg-4">
                                <label for="inputId">Mã loại tài sản</label>
                                    <input type="number" class="form-control" <c:if test="${isUpdatePage == true}">name="id"</c:if> value="${assetType.id}" readonly>
                            </div>
                            <div class="form-group col-md-6 col-lg-4">
                                <label for="inputName">Tên</label>
                                <input type="text" class="form-control" name="name" value="${assetType.name}">
                        </div>
                        <div class="form-group col-md-6 col-lg-4">
                            <label for="inputDepreciationPeriod">Thời gian trích khấu hao(năm)</label>
                            <input type="number" class="form-control" name="depreciationPeriod" value="${assetType.depreciationPeriod}">
                        </div>
                    </div>
                </form>
            </div>
            <div class="modal-footer">
                <button type="button" class="btn btn-secondary" data-dismiss="modal">Đóng</button>
                <button type="button" class="btn btn-primary action" action="saveAndClose" >Lưu và đóng</button>
                <button type="button" class="btn btn-primary action <c:if test="${isUpdatePage == true}">d-none</c:if>" action="saveAndNew">Lưu và tạo mới</button>
            </div>
        </div>
    </div>
</div>