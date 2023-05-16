<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<style>
    .toast-container{
        user-select : none;
    }

    #liveToastBtn{
        display:none;
    }

</style>


<button type="button" class="btn btn-primary" id="liveToastBtn">Show live toast</button>

<div class="toast-container position-fixed bottom-0 end-0 p-3 top-0 start-50 translate-middle-x">
                                    <%-- text-bg-danger : 빨간색 배경 , text-bg-primary : 파랑색 배경 --%>


        <div id="liveToast" class="toast align-items-center 
            <c:if test="${alertType == 'fail'}" >
                text-bg-danger
            </c:if>
            <c:if test="${alertType == 'success'}" >
                text-bg-primary
            </c:if>

        border-0" role="alert" aria-live="assertive" aria-atomic="true">



        <div class="d-flex">

            <div class="toast-body" id="toastBody">
                ${message}
            </div>

            <button type="button" class="btn-close btn-close-white me-2 m-auto" data-bs-dismiss="toast" aria-label="Close"></button>
        </div>

    </div>

</div>

<script>

const toastTrigger = document.getElementById('liveToastBtn');
const toastLiveExample = document.getElementById('liveToast');
const toastBody = document.getElementById('toastBody');
if (toastTrigger) {
    toastTrigger.addEventListener('click', () => {
    const toast = new bootstrap.Toast(toastLiveExample);

    toast.show();
    });
}

</script>
<c:if test="${signUpPage}" >
</c:if>


