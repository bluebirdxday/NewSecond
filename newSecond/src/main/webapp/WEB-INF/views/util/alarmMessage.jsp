<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<style>
    .toast-container{
        user-select : none;
    }

    #alarmToastBtn{
        display:none;
    }


</style>

<button type="button" class="btn btn-primary" id="alarmToastBtn">Show live toast</button>

<div class="toast-container position-fixed bottom-0 end-0 p-3">
  <div id="alarmToast" class="toast" role="alert" aria-live="assertive" aria-atomic="true">
    <div class="toast-header">
        <img src="/resources/src/img/bell.png" class="rounded me-2" alt="">
      <strong class="me-auto">알림</strong>
      <small id="alarm-time">just now</small>
      <button type="button" class="btn-close" data-bs-dismiss="toast" aria-label="Close"></button>
    </div>
    <div class="toast-body" id="alarmBody">
        ${alarm}
    </div>
  </div>
</div>

<script>
    const alarmTrigger = document.getElementById('alarmToastBtn');
    const alarmLiveExample = document.getElementById('alarmToast');
    const alarmBody = document.getElementById('alarmBody');
    if (alarmTrigger) {
    alarmTrigger.addEventListener('click', () => {
        const toast = new bootstrap.Toast(alarmLiveExample);

        toast.show();

        setTimeout(function(){
            toast.hide();
        }, 5000);

    });
    }
</script>
