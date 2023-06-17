<%@include file="/common/lib.jsp"%>
<%@taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<div class="modal fade" id="update_modal" tabindex="-1" role="dialog" aria-labelledby="update_asset" aria-hidden="true" data-backdrop="static">
    <div class="modal-dialog" role="document" style="min-width:90%">
        <div class="modal-content">
            <div class="modal-header">
                <h5 class="modal-title text-primary"><c:if test="${isUpdatePage == false}">NHẬP KHO MỚI</c:if><c:if test="${isUpdatePage == true}">SỬA NHẬP KHO</c:if></h5>
                    <button type="button" class="close" data-dismiss="modal" aria-label="Close">
                        <span aria-hidden="true">&times;</span>
                    </button>
                </div>
                <div class="modal-body">
                        <form id="save-form" method="<c:if test="${isUpdatePage == true}">PUT</c:if><c:if test="${isUpdatePage == false}">POST</c:if>" >
                        <div class="form-row">
                            <div class="form-group col-sm-6 col-md-4 col-lg-3">
                                <label for="inputId">Mã nhập kho</label>
                                    <input type="number" class="form-control" name="id" value="${inventoryTransaction.id}" readonly>
                        </div>
                        <div class="form-group col-sm-6 col-md-4 col-lg-3">
                            <label for="warehouseReceiverId">Người nhập kho</label>
                            <c:set var="warehouseReceiverId" value="${inventoryTransaction.warehouseReceiver.getId()}"/>
                            <c:set var="warehouseReceiverFullName" value="${inventoryTransaction.warehouseReceiver.getFullName()}"/>
                            <c:set var="sessionPersonId" value="${sessionPerson.id}"/>
                            <c:set var="sessionPersonFullName" value="${sessionPerson.getFullName()}"/>
                            <input type="text" class="form-control" name="warehouseReceiverId" <c:if test="${isUpdatePage == true}">data-value="${warehouseReceiverId}" value="${warehouseReceiverId} - ${warehouseReceiverFullName}"</c:if> <c:if test="${isUpdatePage == false}">data-value="${sessionPersonId}" value="${sessionPersonId} - ${sessionPersonFullName}"</c:if>readonly>
                            </div>
                            <div class="form-group col-sm-6 col-md-4 col-lg-3">
                                <label>Ngày nhập kho</label>
                                    <input autocomplete="off" type="text" class="form-control datepicker" name="receiptDate" value="<fmt:formatDate value="${inventoryTransaction.receiptDate}" pattern="dd/MM/yyyy"/>">
                        </div>
                        <div class="form-group col-sm-6 col-md-4 col-lg-3">
                            <label>Mã hóa đơn tham chiếu</label>
                            <input type="text" class="form-control action" action="searchInvoice" autocomplete="off" name="invoiceId" aria-haspopup="false" aria-expanded="false" placeholder="Tìm và chọn hóa đơn" value="${inventoryTransaction.invoice.id}">
                            <div class="dropdown-menu" aria-labelledby="searchInvoice" display-id="true">
                                <c:if test="${fn:length(invoices) == 0}">
                                    <div class="dropdown-item emptyRow">
                                        <div class="text-center text-secondary font-italic">Không có dữ liệu</div>
                                    </div>
                                </c:if>
                                <c:forEach var="invoice" items="${invoices}">   
                                    <a class="dropdown-item border-bottom" href="javascript:void(0)">
                                        <div class="row">
                                            <div class="col-sm-8 d-flex align-items-center">
                                                <span data-value="${invoice.id}">Mã: ${invoice.id}</span>
                                            </div>
                                            <div class="col-sm-4 d-flex align-items-center">
                                                <span>Số: ${invoice.number}</span>
                                            </div>
                                        </div>
                                    </a>
                                </c:forEach>
                            </div>
                        </div>
                    </div>
                    <div class="form-row">
                        <div class="dropdown col-sm-12">
                            <input type="text" class="form-control action" action="searchAsset" autocomplete="off" aria-haspopup="false" aria-expanded="false" placeholder="Tìm và thêm tài sản">
                            <div class="dropdown-menu" aria-labelledby="searchAsset">
                                <c:if test="${fn:length(assetWithQuantityList) == 0}">
                                    <div class="dropdown-item emptyRow">
                                        <div class="text-center text-secondary font-italic">Không có dữ liệu</div>
                                    </div>
                                </c:if>
                                <c:forEach var="asset" items="${assets}" varStatus="status">   
                                    <a class="dropdown-item table-item border-bottom" href="javascript:void(0)">
                                        <div class="row">
                                            <div class="col-sm-2 d-flex align-items-center">
                                                Ảnh: <img src="${asset.image}" class="ml-2" alt=" ">
                                            </div>
                                            <div class="col-sm-1 d-flex align-items-center">
                                                <span data-value="${asset.id}">Mã: ${asset.id}</span>
                                            </div>
                                            <div class="col-sm-2 d-flex align-items-center">
                                                <span>Tên: ${asset.name}</span>
                                            </div>
                                            <div class="col-sm-1 d-flex align-items-center">
                                                <span>Đơn vị tính: ${asset.unit}</span>
                                            </div>
                                            <div class="col-sm-6"></div>
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
                                        <th class="col-1"></th>
                                        <th class="col-1">Ảnh</th>
                                        <th class="col-2">Tên mặt hàng</th>
                                        <th class="col-2">Đơn giá(Đ)</th>
                                        <th class="col-1">Số lượng</th>
                                        <th class="col-1">VAT(%)</th>
                                        <th class="col-2">Tiền trước thuế</th>
                                        <th class="col-2">Tiền trước thuế</th>
                                        <th class="col-2">Tổng</th>
                                    </tr>
                                </thead>
                                <tbody>
                                    <tr class="text-center emptyRow <c:if test="${fn:length(inventoryTransaction.inventoryTransactionDetailList) != 0}">d-none</c:if>">
                                            <td colspan="12" >
                                                Không có dữ liệu
                                            </td>
                                        </tr>
                                    <c:forEach var="inventoryTransactionDetail" items="${inventoryTransaction.inventoryTransactionDetailList}">
                                        <tr class="text-center">
                                            <td class="d-flex justify-content-center align-items-center">
                                                <button class="btn form-control btn-delete text-danger" data-value="${inventoryTransactionDetail.asset.id}"><span class="fa fa-times"></span></button>
                                            </td>
                                            <td>
                                                <img src="${inventoryTransactionDetail.asset.image}" alt=" " class="table-img">
                                            </td>
                                            <td>${inventoryTransactionDetail.asset.name}</td>
                                            <td>
                                                <input type="text" class="form-control text-center text-dark checkNumberType" min="0" value="${inventoryTransactionDetail.price}">
                                            </td>
                                            <td>
                                                <input type="text" class="form-control text-center text-dark checkNumberType" min="1" value="${inventoryTransactionDetail.quantity}">
                                            </td>
                                            <td>
                                                <input type="text" class="form-control text-center text-dark checkNumberType" min="0" value="${inventoryTransactionDetail.VAT}">
                                            </td>
                                            <td class="text-danger"></td>
                                            <td class="text-danger"></td>
                                            <td class="text-danger"></td>
                                        </tr>
                                    </c:forEach>
                                    <c:forEach var="addedAsset" items="${addedAssets}">
                                        <tr class="text-center">
                                            <td>
                                                <button class="btn form-control btn-delete text-danger" data-value="${addedAsset.id}" ><span class="fa fa-times"></span></button>
                                            </td>
                                            <td>
                                                <img src="${addedAsset.image}" alt=" " class="table-img">
                                            </td>
                                            <td>${addedAsset.name}</td>
                                            <td>
                                                <input type="text" class="form-control text-center text-dark checkNumberType" min="0" value="${addedAsset.price}">
                                            </td>
                                            <td>
                                                <input type="text" class="form-control text-center text-dark checkNumberType" min="1" value="1">
                                            </td>
                                            <td>
                                                <input type="text" class="form-control text-center text-dark checkNumberType" min="0" value="0">
                                            </td>
                                            <td class="text-danger"></td>
                                            <td class="text-danger"></td>
                                            <td class="text-danger"></td>
                                        </tr>
                                    </c:forEach>
                                </tbody>
                            </table>
                        </div>
                    </div>
                    <div class="row mt-2">
                        <div class="col-sm-2" >
                            Tiền trước thuế:
                        </div>
                        <div class="col-sm-4">
                            <span id="subTotal" class="text-danger"></span>
                        </div>
                        <div class="col-sm-6 text-secondary text-right">
                            Tổng số <span id="modalNumRecords">${fn:length(inventoryTransaction.inventoryTransactionDetailList)}</span> bản ghi
                        </div>
                    </div>
                    <div class="row mt-2">
                        <div class="col-sm-2" >
                            Tiền thuế:
                        </div>
                        <div class="col-sm-10">
                            <span id="vat" class="text-danger"></span>
                        </div>
                    </div>
                    <div class="row mt-2">
                        <div class="col-sm-2">
                            Tổng:
                        </div>
                        <div class="col-sm-10">
                            <span id="total" class="text-danger"></span>
                        </div>
                    </div>
                </form>
            </div>
            <div class="modal-footer">
                <button type="button" class="btn btn-secondary" data-dismiss="modal">Đóng</button>
                <button type="button" class="btn btn-primary action" action="saveAndClose">Lưu và đóng</button>
                <button type="button" class="btn btn-primary action <c:if test="${isUpdatePage == true}">d-none</c:if>" action="saveAndNew">Lưu và tạo mới</button>
            </div>
        </div>
    </div>
</div>