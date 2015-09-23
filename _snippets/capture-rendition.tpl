<section class="clearfix">          
{{ capture name="check_image" assign="thumbImage" }}{{ strip }}            
{{ image rendition="square" }}
	<figure class="thumb">
  		<a href="{{ url options="article" }}">
			<img src="{{ $image->src }}" width="{{ $image->width }}" height="{{ $image->height }}" rel="resizable" style="max-width: 100%" alt="{{ $image->caption }} {{ if $image->photographer|trim }}(photo: {{ $image->photographer }}){{ /if }}" />
		</a>
    		<figcaption>
      			<em>{{ $image->caption }} {{ if $image->photographer|trim }}(Photo: {{ $image->photographer }}){{ /if }}</em>
    		</figcaption>
  	</figure>
{{ /image }} 
{{ /strip }}{{ /capture }}
          
  	<div class="fourcol last">
         {{ if $thumbImage !== "" }}
         	{{ $thumbImage }}
         {{ else }}
            <p style="float: left; width: 100px; height: 100px; text-align: center; font-style: italic; font-size: 1.5em; line-height: 100px">No pic!</p>
         {{ /if }}                 
    		<header>
     			<hgroup>
      				<h2><a href="{{ url options="article" }}">{{ $gimme->article->name }}</a></h2>
      				<p class="article-info"><em>Published on {{ $gimme->article->publish_date|camp_date_format:"%M %e, %Y" }} in <a href="{{ uri options="section" }}">{{ $gimme->section->name }}</a></em></p>
    			</hgroup>
  		</header>
  	<div id="topstory-intro">
    		<p>{{ if $gimme->article->deck|strip !== "" }}{{ $gimme->article->deck }}{{ else }}{{ $gimme->article->full_text|truncate:150:"..." }}{{ /if }}</p>
	</div>
              
   </div>
</section>   