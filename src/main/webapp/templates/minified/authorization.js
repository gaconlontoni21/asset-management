import{showErrorChildModal as i,sendRequest as n,getURL as t}from"./common.js";export function init(){$("body").on("shown.bs.modal","#permission_modal",function(){$(".container").children("div:nth-child(2)").find("input").each(function(){var i=$(this).closest(".row").children().length,n=$(this).closest(".row").find("input").filter(":checked").length;$(this).closest(".container").children("div:first-child").find("input").prop("checked",i===n)}),$(".container").children("div:first-child").find("input").click(function(){$(this).closest(".container").find("div:nth-child(2)").find("input").prop("checked",$(this).is(":checked"))}),$(".container").children("div:nth-child(2)").find("input").click(function(){var i=$(this).closest(".row").children().length,n=$(this).closest(".row").find("input").filter(":checked").length;$(this).closest(".container").children("div:first-child").find("input").prop("checked",i===n)})})}export function save(){$("body").on("click","#saveBtn",function(){var e=[];$(".container").each(function(){$(this).children("div:nth-child(2)").find("input").filter(":checked").each(function(){var i=$(this).attr("id").toString().split("-"),n={};n.resourceId=i[1],n.actionId=i[0],n.username=$('input[name="username"]').val(),e.push(n)})}),0===e.length&&e.push({resourceId:null,actionId:null,username:$('input[name="username"]').val()}),n(t("accounts/authorization"),"PUT",JSON.stringify(e),"application/json",function(){$("#permission_modal").modal("hide")},function(n){$("#message-dialog").css("z-index",parseInt($("#permission_modal").css("z-index"))+1),i(n.responseText)})})}