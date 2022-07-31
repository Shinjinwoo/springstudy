<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%-- <%@ include file="../inc/common_jsp_header.jsp" %> --%>
<%
    response.setHeader("cache-control","no-cache");
    response.setHeader("expires","-1");
    response.setHeader("pragma","no-cache");
    String PayMethod = request.getParameter("PayMethod");

//  WebParamCryptAES secu = new WebParamCryptAES((String)request.getAttribute("EncodeKey"));
//  String Amt = secu.decrypt((String)request.getAttribute("Amt"));
%>

<!doctype html>
<html lang="ko">

<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, user-scalable=no, initial-scale=1.0, maximum-scale=1.0, minimum-scale=1.0">
    <title>주문결과</title>
    <script src="/torder/script/jquery-1.12.4.js"></script>
    <script src="/torder/script/jquery-ui.js"></script>
    <script>
	function btnClick(){
		if('${PAY_GBN}'=='ORDER'){
			/*
            if('${OS_GBN}'=='AND'){
                window.WebOrderPayContentScreen.goBack("SORD_0302","${ORDERNO}","${CART_CNT}");      //Android
            }else{
                window.location = "pgreturn://SORD_0302/${ORDERNO}?CART_CNT=${CART_CNT}";             //IOS
            }
			*/
		}
	}

    $(function(){
    	btnClick();
    })

        // =========== Nexa 관련 스크립트 start ==============

        var PROV_CORP_ID = '${PROV_CORP_ID}';
        var BRAND_CODE   = '${BRAND_CODE}';
        var ORDERNO      = '${ORDERNO}';
        var ORDER_FLAG   = '${ORDER_FLAG}';
        var CARD_NO      = '${CARD_NO}';
        var MCHTNO       = '${MCHTNO}';

        // ============essential============    (http://support.tobesoft.co.kr tip board 2799 number reference)

        if (!window.NEXACROHTML) {
            window.NEXACROHTML = {};
        }

        window.NEXACROHTML.FireUserNotify = function(userdata) {

            if (window.NEXACROWEBBROWSER) {
                window.NEXACROWEBBROWSER.on_fire_onusernotify(
                        window.NEXACROWEBBROWSER, userdata);
            } else {

                window.document.title = userdata;
            }
        };

        window.onload = function() {

            var data  = "PROV_CORP_ID=" + PROV_CORP_ID + "|+|";
                data += "BRAND_CODE=" + BRAND_CODE + "|+|";
                data += "ORDERNO=" + ORDERNO + "|+|";
                data += "ORDER_FLAG=" + ORDER_FLAG + "|+|";
                data += "CARD_NO=" + CARD_NO + "|+|";
                data += "MCHTNO=" + MCHTNO;

            //window.NEXACROHTML.FireUserNotify(data);

            var wb = window.NEXACROWEBBROWSER;

            if (wb) {
                // web runtime environment, iOS/iPadOS NRE
                //alert(1);
                wb.on_fire_onusernotify(wb, data);
            } else if (typeof nexacro == "undefined") {
                // Windows NRE
                //alert(2);
                window.document.title = data;
            } else if (nexacro) {
                // Android NRE, macOS NRE
                //alert("3");
                window.nexacro.fireUserNotify(data);
            } else {
                window.nexacro.fireUserNotify(data);
            }
        };

	</script>
</head>

<body>
    <div id="container">
<!-- 	    <div class="content"> -->
<%-- 	        <p>PROV_CORP_ID&nbsp;:&nbsp;<c:out value="${PROV_CORP_ID}" /></p> --%>
<%-- 	        <p>BRAND_CODE&nbsp;:&nbsp;<c:out value="${BRAND_CODE}" /></p> --%>
<%-- 	        <p>ORDER_FLAG&nbsp;:&nbsp;<c:out value="${ORDER_FLAG}" /></p> --%>
<%-- 	        <p>ORDERNO&nbsp;:&nbsp;<c:out value="${ORDERNO}" /></p> --%>
<%-- 	        <p>CARD_NO&nbsp;:&nbsp;<c:out value="${CARD_NO}" /></p> --%>
<%-- 	        <p>MCHTNO&nbsp;:&nbsp;<c:out value="${MCHTNO}" /></p> --%>
<!-- 	    </div> -->
    </div>
</body>
</html>
