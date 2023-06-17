<%@include file="/common/lib.jsp"%><%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %><%@page contentType="text/html" pageEncoding="UTF-8"%><div class="modal fade" id="update_modal" tabindex="-1" role="dialog" aria-labelledby="update_asset" aria-hidden="true" data-backdrop="static"> <div class="modal-dialog modal-lg" role="document"> <div class="modal-content"> <div class="modal-header"> <h5 class="modal-title text-primary">CHI TIẾT NHẬT KÝ</h5> <button type="button" class="close" data-dismiss="modal" aria-label="Close"> <span aria-hidden="true">&times;</span> </button> </div><div class="modal-body p-0"> <div class="table-wrapper"> <table class="table table-hover"> <thead class="sticky-top"> <tr class="text-primary"> <th class="col-3">Trường dữ liệu</th> <th class="col-4">Giá trị cũ</div><th class="col-4">Giá trị mới</div></tr></thead> <tbody> <c:if test="${fn:length(log.logDetailList)==0}"> <tr class="text-center text-center text-secondary emptyRow"> <td colspan="12"> Không có dữ liệu </td></tr></c:if> <c:forEach var="logDetail" items="${log.logDetailList}"> <tr> <td>${logDetail.fieldName}</td><td> <c:if test="${logDetail.fieldName eq 'Ảnh'}"><img src="${logDetail.oldValue}" alt=" "/></c:if> <c:if test="${logDetail.fieldName ne 'Ảnh'}">${logDetail.oldValue}</c:if> </td><td> <c:if test="${logDetail.fieldName eq 'Ảnh'}"><img src="${logDetail.newValue}" alt=" "/></c:if> <c:if test="${logDetail.fieldName ne 'Ảnh'}">${logDetail.newValue}</c:if> </td></tr></c:forEach> <c:set var="assetNum" value="1"/> <c:forEach var="logAssetDetail" items="${log.logAssetDetailList}" varStatus="status"> <c:if test="${logAssetDetail.fieldName eq 'Ảnh'}"> <tr> <th colspan="3">Tài sản ${assetNum}</th> <c:set var="assetNum" value="${assetNum + 1}"/> </tr></c:if> <tr> <td>${logAssetDetail.fieldName}</td><td> <c:if test="${logAssetDetail.fieldName eq 'Ảnh'}"><img src="${logAssetDetail.oldValue}" alt=" "/></c:if> <c:if test="${logAssetDetail.fieldName ne 'Ảnh'}">${logAssetDetail.oldValue}</c:if> </td><td> <c:if test="${logAssetDetail.fieldName eq 'Ảnh'}"><img src="${logAssetDetail.newValue}" alt=" "/></c:if> <c:if test="${logAssetDetail.fieldName ne 'Ảnh'}">${logAssetDetail.newValue}</c:if> </td></tr></c:forEach> </tbody> </table> </div></div><div class="modal-footer"> <button type="button" class="btn btn-secondary" data-dismiss="modal">Đóng</button> </div></div></div></div>