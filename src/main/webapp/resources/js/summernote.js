
	$('#write').click(function() {
		// 다른 input도 검증.
		if($('#contents', '#title').summernote('isEmpty')){
			alert('필수(*)를 모두 입력해주세요');
		} else {
			$('#frm').submit();
		}
	});

	// summernote -------------
	$('#contents').summernote({
		callbacks:{
			onImageUpload:function(files){
				var formData = new FormData();
				formData.append('file',files[0])	//controller parameter - Multipartfile file 
				$.ajax({
					type:"POST",
					url:"../ajax/summerFileUpload",
					data:formData,
					enctype:"multipart/form-data",
					contentType:false,
					cache:false,
					processData:false,
					success:function(data){
						data = data.trim();
						$('#contents').summernote('editor.insertImage', data);
					}
				});
			},
			// onImageUpload End
			
			onMediaDelete:function(files){
				var fileName = $(files[0]).attr('src');
				$.ajax({
					type:'POST',
					url:"../ajax/summerFileDelete",
					data:{fileName:fileName},	// {파라미터명 : 변수명}
					success:function(data){
						data.trim();
						console.log(data);
					}
				});
			}
			// onMediaDelete End
		}	
	});
	