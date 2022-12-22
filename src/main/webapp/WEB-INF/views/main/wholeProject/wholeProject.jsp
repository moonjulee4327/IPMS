<%@ page language="java" contentType="text/html; charset=UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="tiles" uri="http://tiles.apache.org/tags-tiles" %>
<%@ taglib prefix="sec" uri="http://www.springframework.org/security/tags" %>
<c:set var="contextPath" value="${pageContext.request.contextPath}"/>
<c:set var="mvo" value="${SPRING_SECURITY_CONTEXT.authentication.principal}"/>
<c:set var="auth" value="${SPRING_SECURITY_CONTEXT.authentication.authorities}"/>
<div class="app-content container center-layout mt-2" style="overflow: auto">
    <div class="content-overlay"></div>
    <div class="content-wrapper">
        <div class="content-body"><!-- Search form-->
            <section id="search-images" class="card overflow-hidden">
                <div class="card-header">
                    <h4 class="card-title" style="font-size: xx-large"><strong>전체 프로젝트</strong></h4>
                    <a class="heading-elements-toggle"><i class="fa fa-ellipsis-v font-medium-3"></i></a>
                </div>
                <div class="card-content collapse show">
                    <div class="card-body pb-0">
                    </div>
                    <!--Search Navbar-->
                    <div class="todo-fixed-search d-flex justify-content-between align-items-center">
                        <div class="sidebar-toggle d-block d-lg-none">
                            <i class="feather icon-menu"></i>
                        </div>
                        <fieldset class="form-group position-relative has-icon-left m-0 flex-grow-1 pl-2">
                            <input type="text" class="form-control todo-search" id="todo-search"
                                   placeholder="Search Task">
                            <div class="form-control-position">
                                <i class="feather icon-search"></i>
                            </div>
                        </fieldset>
                        <div class="todo-sort dropdown mr-1">
                            <button class="btn dropdown-toggle sorting" type="button" id="sortDropdown"
                                    data-toggle="dropdown" aria-haspopup="true" aria-expanded="false">
                                <i class="feather icon-filter"></i>
                                <span>Sort</span>
                            </button>
                            <div class="dropdown-menu dropdown-menu-right" aria-labelledby="sortDropdown"
                                 x-placement="bottom-end"
                                 style="position: absolute; will-change: transform; top: 0px; left: 0px; transform: translate3d(111px, 37px, 0px);">
                                <a class="dropdown-item ascending" href="#">최신순</a>
                                <a class="dropdown-item descending" href="#">조회순</a>
                            </div>
                        </div>
                    </div>
                    <!--/ Search Navbar-->
                    <!--Search Result-->
                    <div id="search-results" class="card-body">
                        <div class="my-gallery" itemscope="" itemtype="http://schema.org/ImageGalle
                    ry"
                             data-pswp-uid="1">
                            <div class="card-deck-wrapper">
                                <div class="card-deck">
                                    <c:forEach var="item" items="${list}" varStatus="idx">
                                        <div class="grid-item" style="width:300px;margin-left:10px;">
                                            <figure class="card card-img-top border-grey border-lighten"
                                                    itemprop="associatedMedia" itemscope
                                                    itemtype="http://schema.org/ImageObject">
                                                <a href="/main/projectDetail/${item.projId}" itemprop="contentUrl"
                                                   data-size="480x360"><img class="gallery-thumbnail card-img-top"
                                                                            src="/resources/stack-admin-v4.0/stack-admin/app-assets/images/gallery/1.jpg"
                                                                            itemprop="thumbnail"
                                                                            alt="Image description">
                                                </a>
                                                <div class="card-body px-0">
                                                    <p><span class="text-bold-600"></span> ${item.teamId} <span
                                                            class="font-small-2 text-muted float-right">${item.projId}</span>
                                                    </p>
<%--                                                    <p class="card-text">${item.projSmry}</p>--%>
                                                </div>
                                            </figure>
                                        </div>
                                    </c:forEach>


                                </div>
                            </div>
                        </div>
                        <div class="text-center">
                            <nav aria-label="Page navigation">
                                <ul class="pagination pagination-separate pagination-round pagination-flat"
                                    style="text-align: center;margin-left: 500px">
                                    <%--                                    <c:if test="${pageMaker.prev}">--%>
                                    <%--                                        <li class="page-item">--%>
                                    <%--                                            <a class="page-link" href="${pageMaker.startPage-1}" aria-label="Previous">--%>
                                    <%--                                                <span aria-hidden="true">« Prev</span>--%>
                                    <%--                                                <span class="sr-only">Previous</span>--%>
                                    <%--                                            </a></li>--%>
                                    <%--                                    </c:if>--%>
                                    <%--                                    <c:forEach begin="${pageMaker.startPage}" end="${pageMaker.endPage}" var="num">--%>
                                    <%--                                        <li class="page-item active${pageMaker.cri.pageNum==num?"active":""}"><a--%>
                                    <%--                                                class="page-link" href="${num}">${num}</a></li>--%>
                                    <%--                                    </c:forEach>--%>
                                    <%--                                    <c:if test="${pageMaker.next}">--%>
                                    <%--                                        <li class="page-item">--%>
                                    <%--                                            <a class="page-link" href="${pageMaker.startPage+1}" aria-label="Next">--%>
                                    <%--                                                <span class="sr-only">Next</span>--%>
                                    <%--                                            </a>--%>
                                    <%--                                        </li>--%>
                                    <%--                                    </c:if>--%>
                                    <%--                                    <form id="actionForm" action="/main/wholeProject" method="get">--%>
                                    <%--                                        <input type="hidden" name="pageNum" value="${pageMaker.cri.pageNum}"/>--%>
                                    <%--                                        <input type="hidden" name="amount" value="${pageMaker.cri.amount}"/>--%>
                                    <%--                                    </form>--%>
                                </ul>
                            </nav>
                        </div>
                    </div>
                    <!-- Root element of PhotoSwipe. Must have class pswp. -->
                    <div class="pswp" tabindex="-1" role="dialog" aria-hidden="true">
                        <!-- Background of PhotoSwipe.
                       It's a separate element as animating opacity is faster than rgba(). -->
                        <div class="pswp__bg"></div>
                        <!-- Slides wrapper with overflow:hidden. -->
                        <div class="pswp__scroll-wrap">
                            <!-- Container that holds slides.
                          PhotoSwipe keeps only 3 of them in the DOM to save memory.
                          Don't modify these 3 pswp__item elements, data is added later on. -->
                            <div class="pswp__container">
                                <div class="pswp__item"></div>
                                <div class="pswp__item"></div>
                                <div class="pswp__item"></div>
                            </div>
                            <!-- Default (PhotoSwipeUI_Default) interface on top of sliding area. Can be changed. -->

                        </div>
                    </div>
                </div>
                <!--/ PhotoSwipe -->
            </section>
        </div>
    </div>
</div>
<script>
    var actionForm = $("#actionForm");
    $(".page-link ").on("click", function (e) {
        e.preventDefault();

        var targetPage = $(this).attr("href");
        console.log(targetPage);
        actionForm.find("input[name='pageNum']").val(targetPage);
        actionForm.submit();
    });

</script>