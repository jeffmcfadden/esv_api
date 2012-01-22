# ESV_API

An API Wrapper for the ESV API

# Installation

```ruby

    gem 'esv_api'

```

```ruby

    # Create an initializer:
	
	ESV.configure do |config|
	  config.api_key = YOUR_API_KEY
	end
```

```ruby

    @esv_text = ESV.passage_query( params[:passage] || "John 1", { 'include-footnotes' => 'false', 'include-headings' => 'false', 'include-subheadings' => 'false', 'include-audio-link' => 'false' } )
```


# Credits

With love to the Twitter Gem, from which I borrowed heavily.