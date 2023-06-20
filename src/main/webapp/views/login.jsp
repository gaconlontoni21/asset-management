<%@include file="/common/lib.jsp"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta charset="utf-8">
        <meta name="viewport" content="width=device-width, initial-scale=1">
        <%@include file="/common/assets/css.jsp"%>
        <link href="data:image/x-icon;base64,AAABAAEAEBAQAAEABAAoAQAAFgAAACgAAAAQAAAAIAAAAAEABAAAAAAAgAAAAAAAAAAAAAAAEAAAAAAAAAAAAAAA/4QAAP+7cwDZcAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAACIiIiIwAAAAIiIiIjMAAAAiIiIiMzAAACIiIiIzMwAAIiIiIjMzAAAiIiIiMzMAACIiIiIzMwAAIiIiIjMzAAARERERMzMAAAERERETMwAAABEREREzAAAAARERERMAAAAAEREREQAAAAAAAAAAD//wAA//8AAOAPAADgBwAA4AMAAOABAADgAQAA4AEAAOABAADgAQAA4AEAAPABAAD4AQAA/AEAAP4BAAD//wAA" rel="icon" type="image/x-icon" />
        <link rel="stylesheet" type="text/css" href="<c:url value="/templates/css/login.css"></c:url>"/>
            <title>Đăng nhập</title>
        </head>
        <body>
        <%@include file="/common/web/message_dialog.jsp"%>
        <div class="container-fluid vh-100">
            <div class="row justify-content-center align-items-center d-flex">
                <div class="col-4 my-auto">
                    <div class="card">
                        <div class="card-header">
                            <h5 class="card-title text-primary text-center my-auto"> 
                                <i class="fas fa-cubes mr-2"></i>
                                HỆ THỐNG QUẢN LÝ TÀI SẢN
                            </h5>
                        </div>
                        <div class="card-body">
                            <form id="form">
                                <div class="form-row">
                                    <div class="form-group col-12">
                                        <label class="form-label" for="username">Tên đăng nhập</label>
                                        <input type="text" id="username" name="username" class="form-control" autofocus/>
                                    </div>
                                    <div class="form-group col-12">
                                        <label class="form-label" for="password">Mật khẩu</label>
                                        <input type="password" id="password" name="password" autocomplete="current-password" class="form-control"/>
                                    </div>
                                    <div class="form-group col-12">
                                        <button class="btn btn-primary form-control" id="loginBtn" type="button">Đăng nhập</button>
                                    </div>
                                </div>
                            </form>
                        </div>
                    </div>
                </div>
            </div>
        </div>
        <%@include file="/common/assets/js.jsp"%>
        <script type="module" src="<c:url value="/templates/js/login.js"></c:url>"></script>
    </body>
</html>

