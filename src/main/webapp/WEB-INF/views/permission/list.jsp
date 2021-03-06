<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@taglib uri="/struts-tags" prefix="s" %>
<!DOCTYPE html>
<html>
<head>
    <meta http-equiv="Content-Type" content="text/html; charset=utf-8"/>
    <link href="/style/basic_layout.css" rel="stylesheet" type="text/css">
    <link href="/style/common_style.css" rel="stylesheet" type="text/css">
    <script type="text/javascript" src="/js/jquery/jquery.js"></script>
    <script src="/js/commonAll.js"></script>
    <script type="text/javascript" src="/js/plugins/jquery-artDialog/jquery.artDialog.source.js?skin=blue"></script>
    <script type="text/javascript" src="/js/system/permission.js"></script>
    <title>PSS-权限管理</title>
    <style>
        .alt td {
            background: black !important;
        }
    </style>
</head>
<body>
<%--////////////////////////////////////////////////////////--%>
<%@include file="/WEB-INF/views/common/common_msg.jsp"%>
<%--////////////////////////////////////////////////////////--%>
<s:form id="searchForm" namespace="/" action="permission" method="post">
    <div id="container">
        <div class="ui_content">
            <div class="ui_text_indent">
                <div id="box_border">
                    <div id="box_top">搜索</div>
                    <div id="box_bottom">
                        <s:url namespace="/" action="permission_reload" var="url"/>
                        <input type="button" value="加载权限" class="ui_input_btn01 btn_reload"
                               data-url="<s:property value="#url"/>"/>
                    </div>
                </div>
            </div>
        </div>
        <div class="ui_content">
            <div class="ui_tb">
                <table class="table" cellspacing="0" cellpadding="0" width="100%" align="center" border="0">
                    <tr>
                        <th width="30"><input type="checkbox" id="all"/></th>
                        <th>编号</th>
                        <th>权限表达式</th>
                        <th>权限名称</th>
                        <th></th>
                    </tr>
                    <tbody>
                    <s:iterator value="#pageResult.listData">
                        <tr>
                            <td><input type="checkbox" name="IDCheck" autocomplete="off" class="acb"
                                       data-eid="<s:property value="id"/>"/></td>
                            <td><s:property value="id"/></td>
                            <td><s:property value="expression"/></td>
                            <td><s:property value="name"/></td>
                            <td>
                                <s:url namespace="/" action="permission_delete" var="deleteUrl">
                                    <s:param name="permission.id" value="id"/>
                                </s:url>
                                <a href="javascript:;" class="btn_delete" data-url="<s:property value="#deleteUrl"/>">删除</a>
                            </td>
                        </tr>
                    </s:iterator>
                    </tbody>
                </table>
            </div>
                <%--分页条--%>
            <%@ include file="/WEB-INF/views/common/common_page.jsp" %>
        </div>
    </div>
</s:form>
</body>
</html>

