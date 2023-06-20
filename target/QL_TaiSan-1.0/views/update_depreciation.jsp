<%@include file="/common/lib.jsp"%>
<%@taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<div class="modal fade" id="update_modal" tabindex="-1" role="dialog" aria-labelledby="update_asset" aria-hidden="true" data-backdrop="static">
    <div class="modal-dialog" role="document" style="min-width:90%">
        <div class="modal-content">
            <div class="modal-header">
                <h5 class="modal-title text-primary"><c:if test="${isUpdatePage == false}">LẬP KHẤU HAO</c:if><c:if test="${isUpdatePage == true}">CHI TIẾT KHẤU HAO</c:if></h5>
                    <button type="button" class="close" data-dismiss="modal" aria-label="Close">
                        <span aria-hidden="true">&times;</span>
                    </button>
                </div>
                <div class="modal-body">
                    <form id="save-form" method="POST">
                        <div class="form-row">
                            <div class="form-group col-sm-6 col-md-4 col-lg-3">
                                <label>Mã số</label>
                                    <input type="number" class="form-control" name="id" value="${depreciationSchedule.id}" readonly>
                        </div>
                        <div class="form-group col-sm-6 col-md-4 col-lg-3">
                            <label>Người lập</label>
                            <c:set var="creatorId" value="${depreciationSchedule.creator.getId()}"/>
                            <c:set var="creatorFullName" value="${depreciationSchedule.creator.getFullName()}"/>
                            <c:set var="sessionUserId" value="${sessionUser.id}"/>
                            <c:set var="sessionUserFullName" value="${sessionUser.getFullName()}"/>
                            <input type="text" class="form-control" name="creatorId" <c:if test="${isUpdatePage == true}">data-value="${creatorId}" value="${creatorId} - ${creatorFullName}"</c:if> <c:if test="${isUpdatePage == false}">data-value="${sessionUserId}" value="${sessionUserId} - ${sessionUserFullName}"</c:if>readonly>
                            </div>
                            <div class="form-group col-sm-6 col-md-4 col-lg-3">
                                <label>Ngày lập</label>
                                    <input autocomplete="off" type="text" class="form-control datepicker" name="depreciationDate" value="<fmt:formatDate value="${depreciationSchedule.depreciationDate}" pattern="dd/MM/yyyy"/>">
                        </div>
                        <div class="form-group col-sm-6 col-md-4 col-lg-3">
                            <label>Phương pháp khấu hao</label>
                            <input type="text" class="form-control action" action="searchDepreciationMethod" autocomplete="off" name="depreciationMethodId" aria-haspopup="false" aria-expanded="false" placeholder="Tìm và chọn phương pháp khấu hao" data-value="${depreciationSchedule.depreciationMethod.id}" value="${depreciationSchedule.depreciationMethod.name}">
                            <div class="dropdown-menu" display-id="false">
                                <c:if test="${fn:length(depreciationMethods) == 0}">
                                    <div class="dropdown-item emptyRow">
                                        <div class="text-center text-secondary font-italic">Không có dữ liệu</div>
                                    </div>
                                </c:if>
                                <c:forEach var="depreciationMethod" items="${depreciationMethods}">   
                                    <a class="dropdown-item border-bottom" href="javascript:void(0)">
                                        <div class="row">
                                            <div class="col-sm-5 d-flex align-items-center">
                                                <span data-value="${depreciationMethod.id}">Mã: ${depreciationMethod.id}</span>
                                            </div>
                                            <div class="col-sm-7 d-flex align-items-center">
                                                <span data-value="${depreciationMethod.name}">Tên: ${depreciationMethod.name}</span>
                                            </div>
                                        </div>
                                    </a>
                                </c:forEach>
                            </div>
                        </div>
                        <div class="form-group col-sm-6 col-md-4 col-lg-3">
                            <label>Kỳ kế toán</label>
                            <input type="text" class="form-control action" action="searchAccountingPeriod" autocomplete="off" name="accountingPeriodId" aria-haspopup="false" aria-expanded="false" placeholder="Tìm và chọn kỳ kế toán" data-value="${depreciationSchedule.accountingPeriod.id}" value="${depreciationSchedule.accountingPeriod.name}">
                            <div class="dropdown-menu" getDepreciationDetailList="true">
                                <c:if test="${fn:length(accountingPeriods) == 0}">
                                    <div class="dropdown-item emptyRow">
                                        <div class="text-center text-secondary font-italic">Không có dữ liệu</div>
                                    </div>
                                </c:if>
                                <c:forEach var="accountingPeriod" items="${accountingPeriods}">   
                                    <a class="dropdown-item border-bottom" href="javascript:void(0)">
                                        <div class="row">
                                            <div class="col-sm-3 d-flex align-items-center">
                                                <span data-value="${accountingPeriod.id}">Mã: ${accountingPeriod.id}</span>
                                            </div>
                                            <div class="col-sm-9 d-flex align-items-center">
                                                <span data-value="${accountingPeriod.name}">Tên: ${accountingPeriod.name}</span>
                                            </div>
                                        </div>
                                    </a>
                                </c:forEach>
                            </div>
                        </div>
                    </div>
                    <div class="form-row mt-4">
                        <div class="w-100 table-wrapper-modal border-bottom">
                            <table class="table table-hover">
                                <thead class="sticky-top"1>
                                    <tr class="text-primary text-center">
                                        <th class="d-none"></th>
                                        <th class="text-center">Ảnh</th>
                                        <th>Tên tài sản</th>
                                        <th>TG trích khấu hao</th>
                                        <th>Phần trăm khấu hao</th>
                                        <th>Tổng giá trị</th>
                                        <th>Khấu hao kỳ</th>
                                        <th>Khấu hao tích lũy</th>
                                        <th>Giá trị còn lại</th>
                                    </tr>
                                </thead>
                                <tbody>
                                    <c:if test="${fn:length(depreciationSchedule.depreciationDetailList) == 0}">
                                        <tr class="text-center emptyRow">
                                            <td colspan="12" class="text-center">
                                                Không có dữ liệu
                                            </td>
                                        </tr>
                                    </c:if>
                                    <c:forEach var="depreciationDetail" items="${depreciationSchedule.depreciationDetailList}">
                                        <tr class="text-center">
                                            <td class="d-none">${depreciationDetail.asset.id}</td>
                                            <td class="text-center">
                                                <img src="${depreciationDetail.asset.image}" alt=" " class="table-img">
                                            </td>
                                            <td>${depreciationDetail.asset.name}</td>
                                            <td>${depreciationDetail.depreciationPeriod}</td>
                                            <td>${depreciationDetail.percentageDepreciation}</td>
                                            <td>${depreciationDetail.totalValue}</td>
                                            <td>${depreciationDetail.periodDepreciationExpense}</td>
                                            <td>${depreciationDetail.accumulatedDepreciation}</td>
                                            <td>${depreciationDetail.remainingValue}</td>
                                        </tr>
                                    </c:forEach>
                                </tbody>
                            </table>
                        </div>
                    </div>
                    <div class="row mt-2">
                        <div class="col-sm-2" >
                        </div>
                        <div class="col-sm-4">
                        </div>
                        <div class="col-sm-6 text-secondary text-right">
                            Tổng số <span id="modalNumRecords">${fn:length(depreciationSchedule.depreciationDetailList)}</span> bản ghi
                        </div>
                    </div>
                </form>
            </div>
            <div class="modal-footer">
                <button type="button" class="btn btn-secondary" data-dismiss="modal">Đóng</button>
                <button type="button" class="btn btn-primary action <c:if test="${isUpdatePage == true}">d-none</c:if>" action="saveAndClose">Lưu và đóng</button>
                <button type="button" class="btn btn-primary action <c:if test="${isUpdatePage == true}">d-none</c:if>" action="saveAndNew">Lưu và tạo mới</button>
            </div>
        </div>
    </div>
</div>