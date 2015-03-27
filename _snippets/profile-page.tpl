{{ if $gimme->author->picture->imageurl }}
	<div class="col-md-4">
    	<img src="{{ $gimme->author->picture->getImageUrl(150, 150) }}" alt="{{ $gimme->author->name }}" style="max-width: 100%" />
    </div>               
{{ elseif $gimme->author->user->image(150, 150, 'crop') }}
    <div class="col-md-4">
    	<img src="{{ $gimme->author->user->image(150, 150, 'crop') }}" alt="{{ $gimme->author->user->uname|escape }}" style="max-width: 100%" />
    </div>
{{ /if }}

	<div class="col-md-8 last">
		{{ if $gimme->author->biography->first_name }}
    	<h4>{{ $gimme->author->biography->first_name }} {{$gimme->author->biography->last_name }}</h4>
    	{{ else }}
    	<h4>{{ $gimme->author->name }}</h4>
    	{{ /if }}
        <p>{{ $gimme->author->biography->text }}</p>
	</div>

{{* author content *}}
<section class="clearfix">
{{ $escapedName=str_replace(" ", "\ ", $gimme->author->name) }}

{{ list_articles ignore_issue="true" ignore_section="true" constraints="author is `$escapedName` type is news"  order="ByPublishDate desc" length="5"  }}

        {{if $gimme->current_list->at_beginning}}
        <h5>PUBLISHED ARTICLES</h5>
          <div class="bloger_news_items">
            <div class="space_left_content">
                  <ul>
        {{/if}}

      <li class="news_item">
        <div class="content content_text no_margin_left">

          {{ image rendition=$imageRendition }}
          <a href="{{ url options="article" }}" class="thumbnail">

           <img src="{{ $image->src }}" alt="{{ $image->caption }} {{ if $image->photographer }}(photo: {{ $image->photographer }}){{ /if }}" class="small"/>
         </a>
         {{/image}}

         <h6 class="info">{{ $gimme->section->name }} &middot; {{ $gimme->article->publish_date|camp_date_format:"%e.%m.%Y" }}</h6>
          <h5 class="title"><a href="{{ url options="article" }}">{{ $gimme->article->name }}</a></h5>

          <p>{{ if $gimme->article->deck|strip !== "" }}{{ $gimme->article->deck|strip_tags:false }}{{ elseif $gimme->article->full_text }}{{ $gimme->article->full_text|strip_tags:false|truncate:200:"[...]" }}{{ /if }}</p>
        </div>
      </li>

      {{ if $gimme->current_list->at_end }}

    </ul>
  </div>
</div>

{{ /if }}

{{ /list_articles }}
</section>