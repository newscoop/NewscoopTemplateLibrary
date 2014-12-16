{{ include file="_tpl/_html-head.tpl" }}

  <body>

{{ include file="_tpl/header.tpl" }}

  <div class="container">
	 <div class="row">
	 
		<div class="col-md-12">
			<h2>{{ $gimme->article->name }}</h2>		
			{{ $gimme->article->description }}
		</div>
	 
		<div class="col-md-6">  	

		{{block snippet_news_teaser}}{{/block}}		
		
		{{block snippet_video_embed}}{{/block}}	
		
		{{block snippet_html_slider}}{{/block}}	

		</div><!-- /.col-md-6 -->
		
		<div class="col-md-6">

			{{ $gimme->article->gist }}
	
		</div><!-- /.col-md-6 -->			
	</div><!-- /.row -->
  </div><!-- /.container -->

{{ include file="_tpl/_html-foot.tpl" }}