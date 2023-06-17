<%@include file="/common/lib.jsp"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<div class="modal fade" id="permission_modal" tabindex="-1" role="dialog" aria-labelledby="permission_modal" aria-hidden="true" data-backdrop="static">
    <div class="modal-dialog modal-lg" role="document" style="min-width:80%">
        <div class="modal-content">
            <div class="modal-header">
                <h5 class="modal-title text-primary">PHÂN QUYỀN CHI TIẾT</h5>
                <button type="button" class="close" data-dismiss="modal" aria-label="Close">
                    <span aria-hidden="true">&times;</span>
                </button>
            </div>
            <div class="modal-body">
                <c:forEach var="resource" items="${resources}">
                    <div class="container">
                        <div class="row">
                            <div class="col-12">
                                <div class="form-check">
                                    <input class="form-check-input" type="checkbox" id="${resource.id}" name="${resource.id}" value="${resource.id}" />
                                    <label class="form-check-label text-success" for="${resource.id}"> ${resource.name}</label>
                                </div>
                            </div>
                        </div>
                        <div class="row ml-2">
                            <c:forEach var="action" items="${resource.actions}">
                                <div class="col-sm-6 col-md-4 col-lg-3 mt-3">
                                    <div class="form-check form-check-inline">
                                        <input class="form-check-input" type="checkbox" id="${action.id}-${action.resource.id}" name="${action.id}-${action.resource.id}" value="${action.id}-${action.resource.id}" 
                                               <c:forEach var="authorization" items="${authorizations}">
                                                   <c:if test="${authorization.action.id eq action.id and authorization.action.resource.id eq resource.id}">
                                                       checked
                                                   </c:if>
                                               </c:forEach>
                                               />
                                        <label class="form-check-label" for="${action.id}-${action.resource.id}">${action.name}</label>
                                    </div>
                                </div>
                            </c:forEach>
                        </div>
                    </div>
                    <hr>
                </c:forEach>
            </div>
            <div class="modal-footer">
                <button type="button" class="btn btn-secondary" data-dismiss="modal">Đóng</button>
                <button type="button" class="btn btn-primary" id="saveBtn">Lưu và đóng</button>
            </div>
        </div>
    </div>
</div>