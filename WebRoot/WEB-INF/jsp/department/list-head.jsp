<%@page language="java" contentType="text/html; charset=utf-8" pageEncoding="utf-8"%>
	<th  data-sortfield="id" class="${nfn:sortClass(pageBean,'id')}"><spring:message code="base.function.table.head.no"/></th>
			<th align="center" data-sortfield="name" class="${nfn:sortClass(pageBean,'name')}">
			<spring:message code="props.com.huqiao.smartadmin.sys.entity.Department.name"/>
		</th>
			<th align="center" data-sortfield="status" class="${nfn:sortClass(pageBean,'status')}">
			<spring:message code="props.com.huqiao.smartadmin.sys.entity.Department.status"/>
		</th>
			<th align="center" data-sortfield="parent" class="${nfn:sortClass(pageBean,'parent')}">
			<spring:message code="props.com.huqiao.smartadmin.sys.entity.Department.parent"/>
		</th>
			<th align="center" data-sortfield="sort" class="${nfn:sortClass(pageBean,'sort')}">
			<spring:message code="props.com.huqiao.smartadmin.sys.entity.Department.sort"/>
		</th>