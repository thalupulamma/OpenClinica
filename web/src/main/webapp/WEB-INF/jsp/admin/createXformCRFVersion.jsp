<%@ page contentType="text/html; charset=UTF-8" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>

<fmt:setBundle basename="org.akaza.openclinica.i18n.notes" var="restext"/>
<fmt:setBundle basename="org.akaza.openclinica.i18n.words" var="resword"/>
<fmt:setBundle basename="org.akaza.openclinica.i18n.workflow" var="resworkflow"/>
<fmt:setBundle basename="org.akaza.openclinica.i18n.page_messages" var="respage"/>

<c:choose>
<c:when test="${userBean.sysAdmin && module=='admin'}">
 <c:import url="../include/admin-header.jsp"/>
</c:when>
<c:otherwise>
 <c:import url="../include/managestudy-header.jsp"/>
</c:otherwise>
</c:choose>


<!-- move the alert message to the sidebar-->
<jsp:include page="../include/sideAlert.jsp"/>
<!-- then instructions-->

<tr id="sidebar_Instructions_open" style="display: all">

        <td class="sidebar_tab">

        <a href="javascript:leftnavExpand('sidebar_Instructions_open');
        leftnavExpand('sidebar_Instructions_closed');">
            <img src="images/sidebar_collapse.gif" border="0" align="right" hspace="10"></a>

        <b><fmt:message key="instructions" bundle="${resword}"/></b>

        <div class="sidebar_tab_content">
          <b><fmt:message key="create_CRF" bundle="${resword}"/> : </b>
          <fmt:message key="br_create_new_CRF_entering" bundle="${respage}"/><br/><br/>
          <b><fmt:message key="create_CRF_version" bundle="${resword}"/> : </b>
          <fmt:message key="br_create_new_CRF_uploading" bundle="${respage}"/><br/><br/>
          <b><fmt:message key="revise_CRF_version" bundle="${resword}"/> : </b>
          <fmt:message key="br_if_you_owner_CRF_version" bundle="${respage}"/><br/><br/>
          <b><fmt:message key="CRF_spreadsheet_template" bundle="${resword}"/> : </b>
          <fmt:message key="br_download_blank_CRF_spreadsheet_from" bundle="${respage}"/><br/><br/>
          <b><fmt:message key="example_CRF_br_spreadsheets" bundle="${resword}"/> : </b>
          <fmt:message key="br_download_example_CRF_instructions_from" bundle="${respage}"/><br/>
          
        
        </div>

        </td>

    </tr>
    <tr id="sidebar_Instructions_closed" style="display: none">
        <td class="sidebar_tab">

        <a href="javascript:leftnavExpand('sidebar_Instructions_open');
        leftnavExpand('sidebar_Instructions_closed');">
            <img src="images/sidebar_expand.gif" border="0" align="right" hspace="10"></a>

        <b><fmt:message key="instructions" bundle="${resword}"/></b>

        </td>
  </tr>
<jsp:include page="../include/sideInfo.jsp"/>


<jsp:useBean scope='session' id='version' class='org.akaza.openclinica.bean.submit.CRFVersionBean'/>
<jsp:useBean scope='session' id='userBean' class='org.akaza.openclinica.bean.login.UserAccountBean'/>
<jsp:useBean scope='request' id='crfName' class='java.lang.String'/>

<h1>
<span class="title_manage">
 <c:choose>
     <c:when test="${empty crfName}">
         <fmt:message key="create_a_new_CRF_case_report_form" bundle="${resworkflow}"/>
     </c:when>
     <c:otherwise>
        <fmt:message key="create_CRF_version" bundle="${resworkflow}"/> <c:out value="${crfName}"/>
     </c:otherwise>
 </c:choose>

</span>
</h1>

<script type="text/JavaScript" language="JavaScript">
  //<!--
 function myCancel() {

    cancelButton=document.getElementById('cancel');
    if ( cancelButton != null) {
      if(confirm('<fmt:message key="sure_to_cancel" bundle="${resword}"/>')) {
       window.location.href="ListCRF?module=" + "<c:out value="${module}"/>";
       return true;
      } else {
        return false;
       }
     }
     return true;

  }
  //-->
  </script>

<form>

<div style="width: 400px">
<div class="box_T"><div class="box_L"><div class="box_R"><div class="box_B"><div class="box_TL"><div class="box_TR"><div class="box_BL"><div class="box_BR">







<div class="textbox_center">



<c:choose>
 <c:when test="${not empty errorList}">
  <p>WARNING!  Found validation errors while importing CRF.  Import cancelled.  Please resolve the errors listed below and re-import the CRF.
  </p>
  <br>
  <div>
   <table style="border: 1px solid black;border-collapse: collapse;width:100%">
    <c:forEach items="${errorList}" var="error">
     <tr>
      <th style="border: 1px solid black;border-collapse: collapse;padding: 5px;text-align:left"><b>Object Type:</b></td>
      <th style="border: 1px solid black;border-collapse: collapse;padding: 5px;text-align:left"><b>Name:</b></td>  
      <th style="border: 1px solid black;border-collapse: collapse;padding: 5px;text-align:left"><b>Error Code:</b></td>  
     </tr>
     <tr>
      <td style="border: 1px solid black;border-collapse: collapse;padding: 5px;text-align:left"><c:out value="${error.objectName}"/></td>
      <td style="border: 1px solid black;border-collapse: collapse;padding: 5px;text-align:left"><c:out value="${error.defaultMessage}"/></td>  
      <td style="border: 1px solid black;border-collapse: collapse;padding: 5px;text-align:left"><c:out value="${error.code}"/></td>  
     </tr>
    </c:forEach>
   </table>
  </div>
 </c:when>
<c:otherwise>
 <div> SUCCESS.  CRF was successfully imported.</div>
</c:otherwise>
</c:choose>



</div>







</div></div></div></div></div></div></div></div>
</div>

<input type="button" onclick="confirmExit('ListCRF?module=<c:out value="${module}"/>')" name="exit" value="<fmt:message key="exit" bundle="${resword}"/> "class="button_medium"/>

<br clear="all">
</form>

<c:choose>
  <c:when test="${userBean.sysAdmin && module=='admin'}">
  <c:import url="../include/workflow.jsp">
   <c:param name="module" value="admin"/>
  </c:import>
 </c:when>
  <c:otherwise>
   <c:import url="../include/workflow.jsp">
   <c:param name="module" value="manage"/>
  </c:import>
  </c:otherwise>
 </c:choose>

<jsp:include page="../include/footer.jsp"/>