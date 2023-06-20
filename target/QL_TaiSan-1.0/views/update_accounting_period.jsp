<%@include file="/common/lib.jsp"%>
<%@taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<div class="modal fade" id="update_modal" tabindex="-1" role="dialog" aria-labelledby="update_asset" aria-hidden="true" data-backdrop="static">
    <div class="modal-dialog modal-lg" role="document">
        <div class="modal-content">
            <div class="modal-header">
                <h5 class="modal-title text-primary">TẠO KỲ KẾ TOÁN</h5>
                <button type="button" class="close" data-dismiss="modal" aria-label="Close">
                    <span aria-hidden="true">&times;</span>
                </button>
            </div>
            <div class="modal-body">
                <form id="save-form" method="POST">
                    <div class="form-row">
                        <div class="form-group col-md-6 col-lg-4">
                            <label for="inputId">Mã kỳ</label>
                            <input type="text" class="form-control" readonly>
                        </div>
                        <div class="form-group col-md-6 col-lg-4">
                            <label>Ngày bắt đầu</label>
                            <input autocomplete="off" type="text" class="form-control datepicker" name="startDate" >
                        </div>
                        <div class="form-group col-md-6 col-lg-4">
                            <label>Ngày kết thúc</label>
                            <input autocomplete="off" type="text" class="form-control datepicker" name="endDate" >
                        </div>
                        <div class="form-group col-md-6 col-lg-4">
                            <label>Tên kỳ</label>
                            <input type="text" class="form-control" name="name">
                        </div>
                        <div class="form-group col-md-6 col-lg-4">
                            <label>Loại kỳ</label>
                            <input type="text" class="form-control action" action="searchAccountingPeriodType" autocomplete="off" name="accountingPeriodTypeId" aria-haspopup="false" aria-expanded="false" placeholder="Tìm và chọn loại kỳ kế toán" data-value="${accountingPeriod.accountingPeriodType.id}" value="${accountingPeriod.accountingPeriodType.name}">
                            <div class="dropdown-menu" display-id="false">
                                <c:if test="${fn:length(accountingPeriodTypes) == 0}">
                                    <div class="dropdown-item emptyRow">
                                        <div class="text-center text-secondary font-italic">Không có dữ liệu</div>
                                    </div>
                                </c:if>
                                <c:forEach var="accountingPeriodType" items="${accountingPeriodTypes}">   
                                    <a class="dropdown-item border-bottom" href="javascript:void(0)">
                                        <div class="row">
                                            <div class="d-none">
                                                <span data-value="${accountingPeriodType.id}">Mã: ${accountingPeriodType.id}</span>
                                            </div>
                                            <div class="col-sm-7 d-flex align-items-center">
                                                <span data-value="${accountingPeriodType.name}">Tên: ${accountingPeriodType.name}</span>
                                            </div>
                                            <div class="col-sm-4 d-flex align-items-center">
                                                <span>Số tháng: ${accountingPeriodType.numberOfMonths}</span>
                                            </div>
                                        </div>
                                    </a>
                                </c:forEach>
                            </div>
                        </div>
                    </div>
                </form>
            </div>
            <div class="modal-footer">
                <button type="button" class="btn btn-secondary" data-dismiss="modal">Đóng</button>
                <button type="button" class="btn btn-primary action" action="saveAndClose">Lưu và đóng</button>
                <button type="button" class="btn btn-primary action" action="saveAndNew">Lưu và tạo mới</button>
            </div>
        </div>
    </div>
</div>