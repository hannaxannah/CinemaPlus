

// form submit 체크 되도록 설정
$(document).ready(function() {
    $("form[name='faq_Insertform']").submit(function() {
        if ($("#classification").val() == "") {
            alert("분류를 입력하세요");
            $("#faq_Insertform").focus();
            return false;
        }
        if ($("#question").val() == "") {
            alert("질문을 입력하세요");
            $("#question").focus();
            return false;
        }
        if ($("#qdate").val() == "") {
            alert("작성일을 입력하세요");
            $("#qdate").focus();
            return false;
        }
        if ($("#content").val() == "") {
            alert("내용을 입력하세요");
            $("#content").focus();
            return false;
        }


        var form = $('form')[0];
        var formData = new FormData(form);

        $.ajax({
            type:"post",
            enctype:'multipart/form-data',
            url:'./faqInsert.admin',
            data:formData,
            dataType:'json',
            processData:false,
            contentType:false,
            cache:false,
            success:function(data){
               if (data.result === 'success') {
                   alert('FAQ가 등록되었습니다.');
                   location.href = './faq.admin';
               } else {
                   alert('FAQ등록을 실패하였습니다.');
               }
            },
            error:function(e){
                alert('서버 처리 중 오류가 발생하였습니다.');
            }
        });

        return false;
    });
});