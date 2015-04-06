<div class="row" style="background-color: #ddd; padding: 15px 0; margin-bottom: 20px">
  <div>
  	<div class="col-md-4">
  	  {{ include file="_snippets/user-image.tpl" size="xbig" }}
  	</div>

    <div class="col-md-4">
      <h3 class="bigger">{{ $user->first_name }} {{ $user->last_name }}</h3>
      <p>{{ $user['bio']|escape }}</p>
	</div>	
	
	<div class="col-md-4 last">
		<h3>User info</h3>
        <p>
        {{ if $user['facebook'] }}Facebook: <a target="_blank" class="info-text" href="http://www.facebook.com/{{ $user['facebook']|escape:url }}" rel="nofollow">{{ $user['facebook']|escape }}</a><br />{{ /if }}
        {{ if $user['twitter'] }}Twitter: <a target="_blank" class="info-text" href="http://www.twitter.com/{{ trim($user['twitter'], '@')|escape:url }}" rel="nofollow">@{{ trim($user['twitter'], '@')|escape }}</a><br />{{ /if }}
        {{ if $user['google'] }}Google+: <a target="_blank"  class="info-text" href="http://plus.google.com/{{ $user['google']|escape:url }}" rel="nofollow">{{ $user['google']|escape }}</a><br />{{ /if }}
        {{ if $user['organisation'] }}Organizacija: <span class="info-text">{{ $user['organisation']|escape }}</span><br />{{ /if }}
        {{ if $user['website'] }}Website: <a target="_blank" class="info-text" href="http://{{ $user['website']|escape:url }}" rel="nofollow">{{ $user['website']|escape }}</a><br />{{ /if }}
      </p>

      {{ if $user->logged_in }}
      <a href="{{ $view->url(['controller' => 'dashboard', 'action' => 'index'], 'default') }}">Edit profile</a>
      {{/if}}

    </div>
  </div>
</div>


{{* user comments *}}
<section class="clearfix">

{{ list_user_comments user=$user->identifier order="bydate desc" length="10" }}

{{ if $gimme->current_list->at_beginning }}
<h5>LATEST COMMENTS BY {{ $user->first_name|upper }} {{ $user->last_name|upper }}</h5>
<ul>
{{ /if }}

<li class="comment-content">
  <a href="{{ $gimme->user_comment->article->url }}">{{ $gimme->user_comment->article->name }}</a><br />

    <time>
    {{ $gimme->user_comment->submit_date|camp_date_format:"%d.%m.%Y at %H:%i"}}
    </time>
    <p>{{ $gimme->user_comment->content|escape }}</p>
</li>
<div class="clear"></div>


{{ if $gimme->current_list->at_end }}
          </ul>
{{ /if }}
{{ /list_user_comments }}