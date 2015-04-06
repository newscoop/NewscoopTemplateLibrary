<div class="row" style="background-color: #ddd; padding: 15px 0; margin-bottom: 20px">
{{ if $gimme->author->picture->imageurl }}
	<div class="col-md-4">
    	<img src="{{ $gimme->author->picture->getImageUrl(200, 200, 'crop') }}" alt="{{ $gimme->author->name }}" style="max-width: 100%" />
    </div>               
{{ elseif $gimme->author->user->image(200, 200, 'crop') }}
    <div class="col-md-4">
    	<img src="{{ $gimme->author->user->image(200, 200, 'crop') }}" alt="{{ $gimme->author->user->uname|escape }}" style="max-width: 100%" />
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
</div>

{{* author content *}}
<section class="clearfix">
{{ $escapedName=str_replace(" ", "\ ", $gimme->author->name) }}

{{ list_articles ignore_issue="true" ignore_section="true" constraints="author is `$escapedName` type is news"  order="ByPublishDate desc" length="5"  }}

	{{ if $gimme->current_list->at_beginning }}
    <h5>PUBLISHED ARTICLES BY {{ $gimme->author->name|upper }}</h5>
    {{ /if }}

	{{ include file="_snippets/news-teaser.tpl" imageRendition=$imageRendition }} 

{{ /list_articles }}
</section>