{{ include file="_tpl/_html-head.tpl" }}

  <body>

{{ include file="_tpl/header.tpl" }}

    <div class="container">

      <div class="starter-template">
        <h1>Template Library Theme</h1>
        <p class="lead">Examples and best practices to help you get familiar with Newscoop templating language and the power of $gimme</p>
      </div>

	  {{ list_sections }}
	  <div class="col-md-3">
	  <h3>{{ $gimme->section->name }}</h3>
	  <ul>
	  {{ list_articles constraints="type is entry" }}
	  	<li><a href="{{ url options="article" }}">{{ $gimme->article->name }}</a></li>
	  {{ /list_articles }}
	  </ul>
	  </div>
	  {{ /list_sections }}

    </div><!-- /.container -->


{{ include file="_tpl/_html-foot.tpl" }}