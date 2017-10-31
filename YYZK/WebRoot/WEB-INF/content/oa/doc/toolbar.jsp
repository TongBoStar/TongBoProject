<%@ page contentType="text/html;charset=UTF-8" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="/struts-tags" prefix="s"%>
<c:set var="ctx" value="${pageContext.request.contextPath}"/>
<div id='toolbar1' class='flexpaper_toolbar flexpaper_toolbarstd'>
    <img src='${ctx}/resources/plugins/flexpaper/images/flat/printer.png' class='flexpaper_tbbutton flexpaper_bttnPrint' title='Print' alt='Print' onclick='$FlexPaper("documentViewer").printPaper();' />
    <img src='${ctx}/resources/plugins/flexpaper/images/flat/bar.png' class='flexpaper_tbseparator' alt='' />
    <img src='${ctx}/resources/plugins/flexpaper/images/flat/document.png' border='0' class='flexpaper_bttnSinglePage flexpaper_tbbutton_pressed flexpaper_tbbutton flexpaper_tbbutton_viewmode flexpaper_viewmode' onclick='$FlexPaper("documentViewer").switchMode("Portrait")' title='Single Page' alt='Single Page' />
    <img src='${ctx}/resources/plugins/flexpaper/images/flat/twodocuments.png' border='0' class='flexpaper_bttnTwoPage flexpaper_tbbutton flexpaper_tbbutton_viewmode flexpaper_viewmode' title='Two Pages' alt='Two Pages' onclick='$FlexPaper("documentViewer").switchMode("TwoPage")'  />
    <img src='${ctx}/resources/plugins/flexpaper/images/flat/thumbs.png' border='0' class='flexpaper_bttnThumbView flexpaper_tbbutton flexpaper_tbbutton_viewmode flexpaper_viewmode' title='Thumb View' alt='Thumb View' onclick='$FlexPaper("documentViewer").switchMode("Tile")'  />
    <img src='${ctx}/resources/plugins/flexpaper/images/flat/fit.png' class='flexpaper_bttnFitWidth flexpaper_tbbutton flexpaper_tbbutton_fitmode flexpaper_fitmode' title='Fit Width' alt='Fit Width' onclick='$FlexPaper("documentViewer").fitWidth()'  />
    <img src='${ctx}/resources/plugins/flexpaper/images/flat/pagefit.png' class='flexpaper_bttnFitHeight flexpaper_tbbutton flexpaper_tbbutton_fitmode flexpaper_fitmode' title='Fit Page' alt='Fit Page' onclick='$FlexPaper("documentViewer").fitHeight()'  />
    <img src='${ctx}/resources/plugins/flexpaper/images/flat/flip.png' class='flexpaper_tbbutton' title='Rotate' alt='Rotate' onclick='$FlexPaper("documentViewer").rotate()'  />
    <img src='${ctx}/resources/plugins/flexpaper/images/flat/bar.png' class='flexpaper_tbseparator' alt='' />
    <div class='${ctx}/resources/plugins/flexpaper/flexpaper_slider flexpaper_zoomSlider'><div class='flexpaper_handle'></div></div>
    <input type='text' class='flexpaper_tbtextinput flexpaper_txtZoomFactor' style='width:36px;' />
    <img src='${ctx}/resources/plugins/flexpaper/images/flat/fullscreen.png' class='flexpaper_bttnFullScreen flexpaper_tbbutton' title='Fullscreen' alt='Fullscreen' onclick='jQuery("#documentViewer").showFullScreen();'  />
    <img src='${ctx}/resources/plugins/flexpaper/images/flat/bar.png' class='flexpaper_tbseparator' alt='' />
    <img src='${ctx}/resources/plugins/flexpaper/images/flat/icon-arrow-left.png' class='flexpaper_bttnPrevPage flexpaper_tbbutton' onclick='$FlexPaper("documentViewer").prevPage()' title='Previous Page' alt='Previous Page'/>
    <input type='text' class='flexpaper_txtPageNumber flexpaper_tbtextinput' style='width:36px;' />
    <div class='flexpaper_lblTotalPages flexpaper_tblabel'> / </div>
    <img src='${ctx}/resources/plugins/flexpaper/images/flat/icon-arrow-right.png' class='flexpaper_bttnPrevNext flexpaper_tbbutton' onclick='$FlexPaper("documentViewer").nextPage()' title='Next Page' alt='Next Page'/>
    <img src='${ctx}/resources/plugins/flexpaper/images/flat/bar.png' class='flexpaper_tbseparator' alt='' />
    <img src='${ctx}/resources/plugins/flexpaper/images/flat/textselect.png' class='flexpaper_bttnTextSelect flexpaper_tbbutton' title='Select Text' alt='Select Text' onclick="$FlexPaper('documentViewer').setCurrentCursor('TextSelectorCursor')"/>
    <img src='${ctx}/resources/plugins/flexpaper/images/flat/hand.png' class='flexpaper_bttnHand flexpaper_tbbutton flexpaper_tbbutton_pressed' title='Drag Cursor' alt='Drag Cursor'  onclick="$FlexPaper('documentViewer').setCurrentCursor('ArrowCursor')"/>
    <img src='${ctx}/resources/plugins/flexpaper/images/flat/bar.png' class='flexpaper_tbseparator' alt='' />
    <input type='text' class='flexpaper_txtSearch flexpaper_txtSearchText flexpaper_tbtextinput' style='width:56px;margin-left:4px;' />
    <img src='${ctx}/resources/plugins/flexpaper/images/flat/find.png' class='flexpaper_bttnTextSearch flexpaper_tbbutton' onclick='$FlexPaper("documentViewer").searchText(jQuery(this).parent().find(".flexpaper_txtSearch").val());' title='Search' alt='Search'/>
    <img src='${ctx}/resources/plugins/flexpaper/images/flat/bar.png' class='flexpaper_tbseparator' alt='' />
</div>
