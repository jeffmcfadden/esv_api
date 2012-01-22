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

## Display Options

### include-passage-references

Include `<h2>` that indicate which passage is being displayed.

Default: `true`

### include-first-verse-numbers

Show the verse number (e.g., *53:1*) at the beginnings of chapters.

Default: `true`

### include-verse-numbers

Show verse numbers in the text.

Default: `true`

### include-footnotes

Include footnotes and references to them in the text.

Default: `true`

### include-footnote-links

If you have set `include-footnotes` to `true`, set this option to `false` to turn off the links to the footnotes within the text. The footnotes will still appear at the bottom of the passage. If `include-footnotes` is `false`, this parameter does not do anything.

Default: `true`

### include-headings

Include section headings. For example, the section heading of Matthew 5 is *The Sermon on the Mount*.

Default: `true`

### include-subheadings

Include subheadings. Subheadings are the titles of psalms (e.g., Psalm 73's *A Maskil of Asaph*), the acrostic divisions in Psalm 119, the speakers in Song of Solomon, and the textual notes that appear in John 7 and Mark 16.

Default: `true`

### include-surrounding-chapters

Show links under the reference to the previous, current (if not showing the whole chapter) and next chapters in the Bible. The link points to the ESV website, but you can modify it by changing the `link-url` option.

Default: `false`

### include-word-ids

Include a `<span>` tags surrounding each word with a unique id. The id has several parts; the id "w40001002.01-1" consists of: the letter w (needed for valid XHTML ids), an eight-digit verse identifier (40001002 indicates Matthew 1:2), a period (.), a two-digit word identifier (01), and a hyphen followed by a number (this number is incremented with each passage; it starts with 1). Footnotes do not have word ids.

Default: `false`

### link-url

Where embedded links to other passages should point. It currently applies only when `include-surrounding-chapters` is set to `true`.

Default: `http:// www.gnpcb.org/ esv/search/`

### include-audio-link

Include a link to the audio version of the requested passage. The link appears in a `<small>` tag in the passage's identifying `<h2>`.
	
Default: `true`

### audio-format

Takes a value of `flash`, `mp3`, `real`, or `wma` to indicate the format of the audio. It defaults to `flash`, but the default could change; if you have a strong preference for one of these formats, we recommend that you specify it explicitly. We recommend `flash` as the most flexible; an embedded Flash player is included in the text. When the audio-version is `hw`, the `mp3` option includes a link to an MP3 file. When the `audio-version` is `mm`, the mp3 option includes a link to an M3U file. However, this M3U link expires after about 24 hours, making it unsuitable for extended caching. The other two options, `real` and `wma`, only have New Testament recordings by Marquis Laughlin available. (The `real` option refers to RealAudio, and `wma` refers to Windows Media.)

Default: `flash`

### audio-version

Which recording to use. The options are: `hw` (David Cochran Heath [Hear the Word], complete Bible) `mm` (Max McLean, complete Bible), `ml` (Marquis Laughlin, New Testament only), `ml-mm` (David Cochran Heath for Old Testament, Marquis Laughlin for New Testament), and `ml-mm` (Max McLean for Old Testament, Marquis Laughlin for New Testament). Only affects the output if `audio-format` is `flash` or `mp3`. (David Cochran Heath and Max McLean's versions are only available in these two formats.)

Default: `hw`

### include-short-copyright

Each passage from the ESV needs to include the letters "ESV" at the end of the passage. To turn off this behavior, set this option to `false`.

Default: `true`

### include-copyright

Show a copyright notice at the bottom of the text. Any page that shows the ESV text from this service needs to include a copyright notice, but you do not need to include it with each passage. Best practice is probably to include the copyright manually on your page, rather than download it every time. This option is mutually exclusive with `include-short-copyright`, which overrides `include-copyright`.

Default: `false`

## Formatting HTML Output

HTML is the default output and will appear unless output-format is specified. To make full use of the text, you will probably want to link a CSS stylesheet to your page, either one you've created or [GNP's CSS](http://www.gnpcb.org/esv/assets/style/text.css). This stylesheet contains close to the minimum markup needed to render the text accurately.

# Credits

With love to the Twitter Gem, from which I borrowed heavily.