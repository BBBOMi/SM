<%@ page import="com.skhu.sm.dto.Report" %>
<%@ page language="java" contentType="application/vnd.word;charset=euc-kr" pageEncoding="euc-kr" %>
<%
    Report report = (Report) request.getAttribute("report");
    String fileName = new String(report.getA_name().getBytes("euc-kr"),"8859_1");
    String temp = new String("����".getBytes("euc-kr"),"8859_1");
    String name = fileName + "_" + report.getR_weeks() + temp + "_report";

    response.setHeader("Content-Disposition", "attachment;filename=" + name + ".doc");
    //response.setHeader("Content-Disposition", "attachment;filename=" + name + ".xls");
    response.setHeader("Content-Description", "JSP Generated Data");
    //response.setContentType("application/vnd.ms-excel");
    response.setContentType("application/vnd.ms-word");

%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://www.springframework.org/security/tags" prefix="sec" %>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>

<h3>${report.r_weeks} ���� Ȱ�� ����</h3>
    <center>
    <table board="1">
        <tbody>
            <tr>
                <td>�̹���</td>
                <td><img src=${report.r_photoUrl} style="width: 100px; height: 100px;"/></td>
            </tr>
            <tr>
                <td>Ȯ�� ����</td>
                <td>
                    <c:choose>
                        <c:when test="${report.r_type == 0}">
                            ��Ȯ��
                        </c:when>
                        <c:when test="${report.r_type == 1}">
                            Ȯ��
                        </c:when>
                        <c:when test="${report.r_type == 2}">
                            �ݷ�
                        </c:when>
                    </c:choose>
                </td>
            </tr>
            <tr>
                <td>���� �̸�</td>
                <td>${report.r_writerName}(${report.r_writerId})</td>
            </tr>
            <tr>
                <td>���� �̸�</td>
                <td>���� �й�</td>
            </tr>
            <c:forEach var="mentee" items="${mentee}">
            <tr>
                <td>${mentee.u_name}</td>
                <td>${mentee.u_id}</td>
            </tr>
            </c:forEach>
            <tr>
                <td>Ȱ�� ��¥</td>
                <td>${report.r_date}</td>
            </tr>
            <tr>
                <td>Ȱ�� �ð�</td>
                <td>${report.r_time}�ð�</td>
            </tr>
            <tr>
                <td>Ȱ�� ����</td>
                <td>${report.r_contents}</td>
            </tr>
            <tr>
                <td>Ȱ�� �Ұ�</td>
                <td>${report.r_review}</td>
            </tr>
            <tr>
                <td>����</td>
                <td>${report.r_rank}</td>
            </tr>
            <tr>
                <td>'C'������ ��� ���� ���</td>
                <td>${report.r_reason}</td>
            </tr>
            <tr>
                <td>������ �ڸ�Ʈ</td>
                <td>${report.r_comment}</td>
            </tr>
        </tbody>
    </table>
    </center>