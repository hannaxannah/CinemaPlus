

// form submit 체크 되도록 설정
$(document).ready(function() {
    $("form[name='boardForm']").submit(function() {
        if ($("#select_type").val() == "") {
            alert("문의선택을 입력하세요");
            $("#select_type").focus();
            return false;
        }
        if ($("#question_type").val() == "") {
            alert("문의유형을 입력하세요");
            $("#question_type").focus();
            return false;
        }
        if ($("#subject").val() == "") {
            alert("제목을 입력하세요");
            $("#subject").focus();
            return false;
        }
        if ($("#content").val() == "") {
            alert("내용을 입력하세요");
            $("#content").focus();
            return false;
        }
        if ($("#upload").val() == "") {
            alert("사진첨부를 등록해주세요");
            $("#upload").focus();
            return false;
        }


        var form = $('form')[0];
        var formData = new FormData(form);

        $.ajax({
            type:"post",
            enctype:'multipart/form-data',
            url:'./insert.in',
            data:formData,
            dataType:'json',
            processData:false,
            contentType:false,
            cache:false,
            success:function(data){
               if (data.result === 'success') {
                   alert('문의가 등록되었습니다.');
                   location.href = './list.in';
               } else {
                   alert('문의 등록을 실패하였습니다.');
               }
            },
            error:function(e){
                alert('서버 처리 중 오류가 발생하였습니다.');
            }
        });

        return false;
    });
});