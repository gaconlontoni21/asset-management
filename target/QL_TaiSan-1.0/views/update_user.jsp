<%@include file="/common/lib.jsp"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<%@taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<div class="modal fade" id="update_modal" tabindex="-1" role="dialog" aria-labelledby="update_asset" aria-hidden="true" data-backdrop="static">
    <div class="modal-dialog modal-lg" role="document">
        <div class="modal-content">
            <div class="modal-header">
                <h5 class="modal-title text-primary"><c:if test="${isUpdatePage == false}">TẠO NGƯỜI DÙNG</c:if><c:if test="${isUpdatePage == true}">SỬA NGƯỜI DÙNG</c:if></h5>
                    <button type="button" class="close" data-dismiss="modal" aria-label="Close">
                        <span aria-hidden="true">&times;</span>
                    </button>
                </div>
                <div class="modal-body">
                        <form id="save-form" method="<c:if test="${isUpdatePage == true}">PUT</c:if><c:if test="${isUpdatePage == false}">POST</c:if>" >
                        <div class="form-row">
                            <div class="form-group col-md-6 col-lg-4">
                                <label for="inputId">Mã người dùng</label>
                                    <input type="number" class="form-control" <c:if test="${isUpdatePage == true}">name="id"</c:if> value="${user.id}" readonly>
                            </div>
                            <div class="form-group col-md-6 col-lg-4">
                                <label>Ngày sinh</label>
                                <input autocomplete="off" type="text" class="form-control datepicker" name="dateOfBirth" value="<fmt:formatDate value="${user.dateOfBirth}" pattern="dd/MM/yyyy"/>">
                        </div>
                        <div class="form-group col-md-6 col-lg-4">
                            <label>Họ</label>
                            <input type="text" class="form-control" name="lastName" value="${user.lastName}">
                        </div>
                        <div class="form-group col-md-6 col-lg-4">
                            <label>Tên</label>
                            <input type="text" class="form-control" name="firstName" value="${user.firstName}">
                        </div>
                        <div class="form-group col-md-6 col-lg-4">
                            <label for="searchDepartment">Phòng ban</label>
                            <input type="text" class="form-control action" action="searchDepartment" autocomplete="off" name="departmentId" id="searchDepartment" aria-haspopup="false" aria-expanded="false" data-value="${user.department.id}" placeholder="Tìm và chọn phòng ban" value="${user.department.name}">
                            <div class="dropdown-menu" aria-labelledby="searchDepartment" id="searchDepartmentDropdown">
                                <c:if test="${fn:length(departments) == 0}">
                                    <div class="dropdown-item emptyRow">
                                        <div class="text-center text-secondary font-italic">Không có dữ liệu</div>
                                    </div>
                                </c:if>
                                <c:forEach var="department" items="${departments}">   
                                    <a class="dropdown-item border-bottom" href="javascript:void(0)">
                                        <div class="row">
                                            <div class="col-sm-6 d-flex align-items-center">
                                                <span data-value="${department.id}">Mã phòng ban: ${department.id}</span>
                                            </div>
                                            <div class="col-sm-4 d-flex align-items-center">
                                                <span data-value="${department.name}">Tên phòng ban: ${department.name}</span>
                                            </div>
                                        </div>
                                    </a>
                                </c:forEach>
                            </div>
                        </div>
                        <div class="form-group col-md-6 col-lg-4">
                            <label>Tài khoản</label>
                            <input type="text" class="form-control action" action="searchAccount" autocomplete="off" name="accountUsername" id="searchAccount" aria-haspopup="false" aria-expanded="false" data-value="${user.account.username}" placeholder="Tìm và chọn tài khoản" value="${user.account.username}">
                            <div class="dropdown-menu" display-id="true">
                                <c:if test="${fn:length(accounts) == 0}">
                                    <div class="dropdown-item emptyRow">
                                        <div class="text-center text-secondary font-italic">Không có dữ liệu</div>
                                    </div>
                                </c:if>
                                <c:forEach var="account" items="${accounts}">   
                                    <a class="dropdown-item border-bottom" href="javascript:void(0)">
                                        <div class="row">
                                            <div class="col-sm-6 d-flex align-items-center">
                                                <span data-value="${account.username}">Tên tài khoản: ${account.username}</span>
                                            </div>
                                            <div class="col-sm-4 d-flex align-items-center">
                                                <span data-value="${account.status}">Trạng thái: ${account.status}</span>
                                            </div>
                                        </div>
                                    </a>
                                </c:forEach>
                            </div>
                        </div>
                    </div>
                    <div class="form-row">
                        <div class="form-group col-sm-12">
                            <label>Địa chỉ</label>
                            <textarea type="text" class="form-control" name="address">${user.address}</textarea>
                        </div>
                    </div>
                    <div class="form-row">
                        <div class="form-group col-md-12 col-lg-4">
                            <label>Ảnh đại diện</label>
                            <div class="input-group">
                                <input type="file" class="d-none" id="inputImageFile" accept="image/*"/>
                                <img src="${user.avatar}" 
                                     class="img-fluid rounded btn border border-secondary img-thumb" role="button" id="inputImage" alt="Chưa có ảnh">
                            </div>
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