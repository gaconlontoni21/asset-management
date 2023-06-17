<%@include file="/common/lib.jsp"%>
<%@taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta charset="utf-8">
        <meta name="viewport" content="width=device-width, initial-scale=1">
        <%@include file="/common/assets/main_css.jsp"%>
        <%@include file="/common/assets/datepicker_css.jsp"%>
        <link href="data:image/x-icon;base64,AAABAAEAEBAQAAEABAAoAQAAFgAAACgAAAAQAAAAIAAAAAEABAAAAAAAgAAAAAAAAAAAAAAAEAAAAAAAAAAAAAAA/4QAAP+7cwDZcAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAACIiIiIwAAAAIiIiIjMAAAAiIiIiMzAAACIiIiIzMwAAIiIiIjMzAAAiIiIiMzMAACIiIiIzMwAAIiIiIjMzAAARERERMzMAAAERERETMwAAABEREREzAAAAARERERMAAAAAEREREQAAAAAAAAAAD//wAA//8AAOAPAADgBwAA4AMAAOABAADgAQAA4AEAAOABAADgAQAA4AEAAPABAAD4AQAA/AEAAP4BAAD//wAA" rel="icon" type="image/x-icon" />
        <title>Nhập kho</title>
    </head>
    <body>
        <div class="container-fluid">
            <%@include file="/common/web/sidebar.jsp"%>
            <%@include file="/common/web/message_dialog.jsp"%>
            <div class="content-wrapper">
                <div class="form-wrapper">
                    <div class="row p-3 border-bottom" id="control-div">
                        <div class="col-3 col-sm-3 col-md-2 col-lg-1 col-xl-1">
                            <button id="hide-sidebar-button" class="btn form-control btn-primary"><i class="fas fa-bars"></i></button>
                        </div>
                        <div class="col-9 col-sm-9 col-md-4 col-lg-6 col-xl-6">
                            <h5 class="text-primary">NHẬP KHO</h5>
                        </div>
                        <div class="col-12 col-sm-6 col-md-4 col-lg-3 col-xl-3 mt-2-lg-0 d-flex align-items-center">
                            <div class="input-group mb-3">
                                <div class="input-group-prepend">
                                    <span class="input-group-text bg-white">
                                        <i class="fa fa-search text-dark"></i>
                                    </span>
                                </div>
                                <input type="text" class="form-control" placeholder="Tìm theo mã hóa đơn" id="search-input">
                            </div>
                        </div>
                        <div class="col-12 col-sm-6 col-md-2 col-lg-2 col-xl-2">                        
                            <button class="btn form-control btn-primary" data-value="assets/add" type="button" name="add">
                                <i class="fas fa-plus mr-2"></i>Tạo mới</button>
                        </div>
                    </div>
                    <div class="row p-3 align-items-center">
                        <div class="col-lg-6 col-md-8 col-sm-10 col-12 text-secondary ">
                            <div class="form-row align-items-center">
                                <div class="col-lg-2 col-md-2 col-sm-2 col-2">
                                    Ngày lập:
                                </div>
                                <div class="col-lg-5 col-md-5 col-sm-5 col-5 p-1">
                                    <input id="startDate" placeholder="Từ" autocomplete="off" type="text" class="form-control datepicker text-dark font-weight-bold invoiceDate" name="invoiceDate" value="<fmt:formatDate value="${invoice.invoiceDate}" pattern="dd/MM/yyyy"/>">
                                </div>
                                <div class="col-lg-5 col-md-5 col-sm-5 col-5 p-1">
                                    <input id="endDate" placeholder="Đến" autocomplete="off" type="text" class="form-control datepicker text-dark font-weight-bold invoiceDate" name="invoiceDate" value="<fmt:formatDate value="${invoice.invoiceDate}" pattern="dd/MM/yyyy"/>">
                                </div>
                            </div>
                        </div>
                        <div class="text-lg-right text-md-right text-sm-right col-lg-6 col-md-4 col-sm-2 col-12 text-secondary">
                            <button class="btn btn-secondary reloadBtn"><i class="fas fa-sync"></i></button>
                        </div>
                    </div>
                    <div class="table-wrapper border-bottom">
                        <table class="table table-hover">
                            <thead class="sticky-top">
                                <tr class="text-primary">
                                    <th class="col-2 text-center">Mã nhập kho</th>
                                    <th>Ngày nhập kho</th>
                                    <th>Người nhập kho</div>
                                    <th>Mã hóa đơn tham chiếu</div>
                                </tr>
                            </thead>
                            <tbody>
                                <c:if test="${fn:length(inventoryTransactions) == 0}">
                                    <tr class="text-center text-center text-secondary emptyRow">
                                        <td colspan="12">
                                            Không có dữ liệu
                                        </td>
                                    </tr>
                                </c:if>
                                <c:forEach var="inventoryTransaction" items="${inventoryTransactions}">
                                    <tr>
                                        <td class="text-center">${inventoryTransaction.id}</td>
                                        <td class="dateIndex"><fmt:formatDate value="${inventoryTransaction.receiptDate}" pattern="dd/MM/yyyy"/></td>
                                        <td>${inventoryTransaction.warehouseReceiver.id} - ${inventoryTransaction.warehouseReceiver.getFullName()}</td>
                                        <td><c:if test="${inventoryTransaction.invoice.id == null}">-</c:if><c:if test="${inventoryTransaction.invoice.id != null}">${inventoryTransaction.invoice.id}</c:if></td>
                                        </tr> 
                                </c:forEach>
                            </tbody>
                        </table>
                    </div>
                    <div class="row mt-2 justify-content-end">
                        <div class="col-sm-6"></div>
                        <div class="col-sm-6 text-secondary text-right mr-3">
                            Tổng số <span id="numRecords">${fn:length(inventoryTransactions)}</span> bản ghi
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </div>
    <%@include file="/common/assets/main_js.jsp"%>
    <%@include file="/common/assets/datepicker_js.jsp"%>
    <script type="module" src="<c:url value='/templates/js/app.js'></c:url>"></script>
</body>
</html>