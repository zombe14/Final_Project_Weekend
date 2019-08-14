


	// summernote -------------
	$('#contents').summernote({
		height:500,
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
	