# Nononono

A celebration of saying no. A lot. It's a one-page joke site that reads the subdomain and says "No more" whatever it is, over a looping, full-screen YouTube clip of Michael Scott. A few subdomains have their own easter egg text and video. It is a more general take on [No More Gifs](https://github.com/superhighfives/no-more-gifs).

Status: archived. Made in January 2013 with the [Sinatra Boilerplate](https://github.com/superhighfives/sinatra-boilerplate), and hosted on Heroku until it was updated in 2017. It's no longer online.

## Running it

```sh
bundle
bundle exec foreman start
```

It pins Ruby 2.4.2, so it will need an old Ruby or some updating to run.

## How it works

- `app.rb` is a Sinatra app. It takes the first part of the hostname, so `gifs.example.com` says "No more gifs", and checks it against the `EASTER_EGGS` list.
- `views/index.haml` renders the text over an embedded YouTube video.
- Sass in `views/stylesheets` (with Compass) and CoffeeScript in `views/javascripts` are compiled on each request.
