
function replyInsert(){
    const movie_code = $("#movie_code").val();
    const individual_content = $("#individual_content").val();
    if (!individual_content) {
        alert("답글을 입력하세요");
        $("#individual_content").focus();
        return false;
    }

    $.ajax({
        url: './individualReplyUpdate.in',
        type: 'POST',
        data: {
            movie_code,
            individual_content
        },
        success: function (response) {
            if (response.result === 'success') {
                alert('답글을 등록하였습니다.');
                location.reload();
            } else {
				if (response.errorCode === 1) {
					alert('로그인을 하여 주세요');
					location.href=response.redirectUrl;
				} else {
					alert('처리 중 오류가 발생하였습니다.')
				}
            }
        }
    });
}

function replyUpdate(){
    const movie_code = $("#movie_code").val();
    const individual_content = $("#individual_content").val();
    if (!individual_content) {
        alert("답글을 입력하세요");
        $("#individual_content").focus();
        return false;
    }

    $.ajax({
        url: './individualReplyUpdate.in',
        type: 'POST',
        data: {
            movie_code,
            individual_content
        },
        success: function (response) {
            if (response.result === 'success') {
                alert('답글을 수정하였습니다.');
                location.reload();
            } else {
              if (response.errorCode === 1) {
					alert('로그인을 하여 주세요');
					location.href=response.redirectUrl;
				} else {
					alert('처리 중 오류가 발생하였습니다.')
				}
            }
        }
    });
}

function replyDelete(){
    const movie_code = $("#movie_code").val();

    $.ajax({
        url: './individualReplyUpdate.in',
        type: 'POST',
        data: {
            movie_code,
            individual_content: '',
        },
        success: function (response) {
            if (response.result === 'success') {
                alert('답글을 삭제하였습니다.');
                location.reload();
            } else {
                if (response.errorCode === 1) {
					alert('로그인을 하여 주세요');
					location.href=response.redirectUrl;
				} else {
					alert('처리 중 오류가 발생하였습니다.')
				}
            }
        }
    });
}