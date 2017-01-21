<%@page language="java" contentType="text/html; charset=utf-8" pageEncoding="utf-8"%>
<%@include file="/WEB-INF/jsp/common/taglib.jsp"%>
<section id="widget-grid" class="">
	<div class="row">
		<article class="col-sm-12 col-md-12 col-lg-12">
			<div class="jarviswidget" id="wid-id-0" 
			data-widget-colorbutton="false" data-widget-editbutton="false" 
			data-widget-deletebutton="false"
			data-widget-custombutton="false">
				<header>
					<span class="widget-icon"> <i class="fa fa-file"></i> </span>
					<h2><spring:message code="funcs.Department.list"></spring:message></h2>
				</header>
				<div>
					<div class="jarviswidget-editbox">
					</div>
					<div class="widget-body no-padding">
						<form:form action="department/list.do" class="smart-form smart-form-search" onsubmit="return ajaxSearch(this,'${targetPanel}')" commandName="department">
							<input type="hidden" name="pageNum" value="${pageBean.pageNum}"/>
							<input type="hidden" name="orderField" value="${pageBean.orderField}"/>
							<input type="hidden" name="orderDirection" value="${pageBean.orderDirection}"/>
							<input type="hidden" name="targetPanel" value="${targetPanel}"/>
							<div id="form-search-mobile" class="btn-header transparent pull-left" style="margin-top:-5px;">
								<span> <a href="javascript:void(0)" title="Search"><i class="fa fa-search"></i></a> </span>
							</div>
						    <fieldset>
							<div class="row">
							<%@include file="/WEB-INF/jsp/department/list-form.jsp" %>
								<section class="col col-2 pull-right">
										<a class="btn btn-primary smart-form-submit-btn pull-right" href="#" style="padding:5px 15px;"><i class="fa fa-search"></i> <spring:message code="base.function.query"/></a>
								</section>
							</div>
							</fieldset>
							<div style="padding:5px;" class="form-menu">
								<n:pv url="department/add.do">
								<a class="btn btn-primary" href="department/add.do" target="dialogTodo" title="<spring:message code="funcs.Department.add"></spring:message>"  id="addBtn"><i class="fa fa-plus"></i> <spring:message code="base.function.add"/></a>
								</n:pv>
								<n:pv url="department/delete.do">
								<a class="btn btn-danger" href="${basePath}department/delete.do?manageKeys={manageKeys}" target="ajaxTodo" confirm="<spring:message code="dwz.framework.dialog.confirmofdelete"></spring:message>" warn="<spring:message code="dwz.framework.dialog.pleaseselecttodelete"></spring:message>"><i class="fa fa-trash-o"></i> <spring:message code="base.function.delete"/></a>
								</n:pv>
								<n:pv url="department/update.do">
								<a class="btn btn-warning" href="department/update.do?manageKey={manageKeys}"  rel="manageKeys" target="dialogTodo" title="<spring:message code="funcs.Department.update"></spring:message>" data-mustone="true" data-onlyone="true"><i class="fa fa-edit"></i> <spring:message code="base.function.update"/></a>
								</n:pv>
								<n:pv url="department/detail.do">
								<a class="btn btn-primary" href="department/detail.do?manageKey={manageKeys}" rel="manageKeys" target="dialogTodo" title="<spring:message code="base.function.view"></spring:message>" style="padding:5px 15px;" data-mustone="true" data-onlyone="true" id="viewBtn"><i class="fa fa-eye"></i> <spring:message code="base.function.view"/></a>
								</n:pv>
								<n:pv url="department/history.do">
									<a class="btn btn-primary" href="department/history.do?manageKey={manageKeys}&list=yes" rel="manageKeys"  target="dialogTodo" title="<spring:message code="base.function.history"></spring:message>"  data-mustone="true" data-onlyone="true" id="viewBtn"><i class="fa fa-clock-o"></i> <spring:message code="base.function.history"/></a>
								</n:pv>
								<n:pv url="department/export.do">
									<a class="btn btn-primary" href="department/export.do" data-model="com.huqiao.smartadmin.sys.entity.Department"  target="nuiExport" title="<spring:message code="base.function.export"></spring:message>"  data-mustone="true" data-onlyone="true" id="viewBtn"><i class="fa fa-external-link"></i> <spring:message code="base.function.export"/></a>
								</n:pv>
								<!--在这里添加其他菜单按钮-->
							</div>
							<div class="dataTables_wrapper" style="border-bottom:1px solid #ddd;"> 
							<table id="dt_basic" class="table table-striped table-bordered table-hover" style="border:1px solid red;">
							<thead>
							<tr>
								<th align="center" width="16px">
										<label class="checkbox">
											<input type="checkbox" name="checkbox" class="smart-form-checkall" data-groupname="manageKeys">
										<i></i></label>
								</th>
								<%@include file="/WEB-INF/jsp/department/list-head.jsp" %>
							</tr>
							</thead>
							<tbody>
								<c:if test="${empty pageBean.list}">
									<tr>
										<td colspan="6">
											<center>
												<font style="color: gray;"><spring:message code="base.function.table.info.nodata" /> </font>
											</center>
										</td>
									</tr>
								</c:if>
								<c:forEach var="tempBean" items="${pageBean.list}"
									varStatus="stauts">
									<tr target="manageKeys" rel="${tempBean.manageKey}">
										<td align="center"  width="16">
										<label class="checkbox">
											<input name="manageKeys" type="checkbox" value="${tempBean.manageKey}"/><i></i>
										</label>
										</td>
										<%@include file="/WEB-INF/jsp/department/list-body.jsp" %>
									</tr>
								</c:forEach>
							</tbody>
						</table>
						</div>
						<%@include file="/WEB-INF/jsp/common/pageBar.jsp" %>
						</form:form>
					</div>
				</div>
			</div>
		</article>
	</div>
</section>
<%@include file="/WEB-INF/jsp/common/pageSetJS.jsp" %>