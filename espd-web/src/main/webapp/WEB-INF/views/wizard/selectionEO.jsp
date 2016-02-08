<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="s" uri="http://www.springframework.org/tags" %>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<%@ taglib uri="http://tiles.apache.org/tags-tiles" prefix="tiles" %>
      
<%
      	request.setAttribute("suitabilityListEO", eu.europa.ec.grow.espd.xml.CriteriaTemplates.suitabilityListEO);
      request.setAttribute("economicListEO", eu.europa.ec.grow.espd.xml.CriteriaTemplates.economicListEO);
      request.setAttribute("technicalListEO", eu.europa.ec.grow.espd.xml.CriteriaTemplates.technicalListEO);
      %>

<tiles:importAttribute name="flow"/>

<script>
    $(function () {
        $("#espdform").validate({
            errorContainer: $("div.errorContainer"),
            errorPlacement: function ($error, $element) {
            	$element.parent().append($error);
            }
        });
    });
</script>

<form:form id="espdform" role="form" class="form-horizontal" method="post" commandName="espd" data-toggle="validator">

    <tiles:insertDefinition name="viewChangeRole">
        <tiles:putAttribute name="agent" value="eo"/>
        <tiles:putAttribute name="page" value="${flow}/ca/selection"/>
    </tiles:insertDefinition>
    
    <div class="panel-default">
        <tiles:insertDefinition name="progress">
			<tiles:putAttribute name="selection" value="true"/>
        </tiles:insertDefinition>
        
        <div class="errorContainer alert alert-danger" style="display: none">
            <ul class="fa-ul">
                <li>
                    <i class="info-label fa fa-exclamation-triangle fa-lg fa-li"></i>
					${div18n['correct_errors']}
                    <div class="errorLabelContainer">
                        <ul></ul>
                    </div>
                </li>
            </ul>
        </div>
        <form:errors path="*" cssClass="errorContainer alert alert-danger"></form:errors>
        <div class="paragraph"><h2>${span18n['createcasel_header']}</h2></div>
        <div class="alert alert-espd-info">
            <ul class="fa-ul">
                <li>
                    <i class="info-label fa fa-info-circle fa-lg fa-li"></i>${span18n['createcasel_alert']}
                </li>
            </ul>
        </div>
        
        <div class="panel panel-default espd-panel">
            <div class="espd-panel-heading" data-toggle="collapse" data-target="#eo-satisfies-all-section">
            	${span18n["all_selection_switch"]}
            </div>
            <div id="eo-satisfies-all-section" class="collapse in">
                <div class="espd-panel-body panel-body">
					<strong>${span18n['crit_selection_eo_declares_that']}</strong>
					<span data-i18n="crit_selection_eo_declares_that_tooltip" data-toggle="tooltip" title="${i18n['crit_selection_eo_satisfies_all_criteria']}"></span>
                </div>
                <div class="row criteria-row">
                    <div class="col-md-5 criteria-cell-left">
                        <div class="form-group">
                            <div class="col-md-12">
                                <strong>${span18n['crit_selection_eo_satisfies_all_criteria']}</strong>
                            </div>
                        </div>
                    </div>
                    <div class="col-md-7 criteria-cell-right">
                        <div class="col-md-12">
                            <div class="form-group">
							 	${span18n["crit_your_answer"]}
								<form:radiobutton path="selectionSatisfiesAll.answer" value="true" data-target-hide="${'#'}eo-satisfies-all-form"/>${span18n["yes"]}
								<form:radiobutton path="selectionSatisfiesAll.answer" value="false" data-target-show="${'#'}eo-satisfies-all-form"/>${span18n["no"]}
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </div>

        <div id="eo-satisfies-all-form" class="${espd['selectionSatisfiesAll'].answer ? 'collapse' : ''}">
  
			<tiles:insertDefinition name="panelTemplate">
				<tiles:putAttribute name="id" value="eo-suitability-section"/>
				<tiles:putAttribute name="title_code" value="createcasel_suitability"/>
				<tiles:putAttribute name="subtitle_code" value="crit_selection_eo_suitability_article"/>
				<tiles:putAttribute name="tooltip_code" value="crit_selection_eo_suitability_article_tooltip"/>
				<tiles:putAttribute name="criteriaList" value="${suitabilityListEO}"/>
			</tiles:insertDefinition>

			<tiles:insertDefinition name="panelTemplate">
				<tiles:putAttribute name="id" value="eo-economic-financial-section"/>
				<tiles:putAttribute name="title_code" value="createcasel_economic_and_financial_standing"/>
				<tiles:putAttribute name="subtitle_code" value="crit_selection_eo_economic_article"/>
				<tiles:putAttribute name="tooltip_code" value="crit_selection_eo_economic_article_tooltip"/>
				<tiles:putAttribute name="criteriaList" value="${economicListEO}"/>
			</tiles:insertDefinition>
			
			<tiles:insertDefinition name="panelTemplate">
				<tiles:putAttribute name="id" value="eo-technical-professional-section"/>
				<tiles:putAttribute name="title_code" value="createcasel_technical_professional_ability"/>
				<tiles:putAttribute name="subtitle_code" value="crit_selection_technical_professional_ability_article"/>
				<tiles:putAttribute name="tooltip_code" value="crit_selection_technical_professional_ability_article_tooltip"/>
				<tiles:putAttribute name="criteriaList" value="${technicalListEO}"/>
			</tiles:insertDefinition>

		</div>
        
        <tiles:insertDefinition name="footerButtons">
            <tiles:putAttribute name="prev" value="exclusion"/>
            <tiles:putAttribute name="next" value="finish"/>
        </tiles:insertDefinition>
    </div>
</form:form>