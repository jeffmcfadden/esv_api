# ESV_API

An API Wrapper for the [ESV API](http://www.esvapi.org/api)

# Limitations

Currently only supports `passage_query`

# Installation

```ruby

    gem 'esv_api'
```


# Usage

For your rails app:
 
```ruby

    #Create an initializer:
	
	ESV.configure do |config|
	  config.api_key = YOUR_API_KEY
	end
```

```ruby

    @esv_text = ESV.passage_query( params[:passage] || "John 1", { 'include-footnotes' => 'false', 'include-headings' => 'false', 'include-subheadings' => 'false', 'include-audio-link' => 'false' } )
```

## Query Types

The following methods are available as query types:

```ruby

    passage_query(passage, options={})
	
    query( q, options={} )
    
    reading_plan_query( options={} )
    
    query_info( q, options={} )
    
    reading_plan_info( options={} )
    
    verse( options={} )
    
    daily_verse( options={} )
```


## Query Options

The gem mirrors the API. To pass in options, just use the options hash in any available method, using options of the same name as specified in the [ESV API documentation](http://www.esvapi.org/api).

For example:

```ruby

    @esv_text = ESV.passage_query( params[:passage] || "John 1", { 'include-footnotes' => 'false', 'include-headings' => 'false', 'include-subheadings' => 'false', 'include-audio-link' => 'false' } )
```

 

## Formatting HTML Output

HTML is the default output and will appear unless output-format is specified. To make full use of the text, you will probably want to link a CSS stylesheet to your page, either one you've created or [GNP's CSS](http://www.gnpcb.org/esv/assets/style/text.css). This stylesheet contains close to the minimum markup needed to render the text accurately.

# Credits

With love to the Twitter Gem, from which I borrowed heavily.