import{getFormData as t}from"./common.js";export function getData(){let a=t("#save-form");return a.avatar=$("#inputImage").attr("src"),a.departmentId=$("input.action").filter(function(){return"searchDepartment"===$(this).attr("action")}).attr("data-value"),a.accountUsername=$("input.action").filter(function(){return"searchAccount"===$(this).attr("action")}).attr("data-value"),a}