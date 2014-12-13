# Docomo Image Recognition

Ruby SDK for Docomo recognition API.
https://dev.smt.docomo.ne.jp/?p=docs.api.page&api_docs_id=105

## Installation

Add 

```
gem 'docomo_image_recognition'
```

to your Gemfile or install it manually with

```sh
$ gem install docomo_image_recognition
```

## Usage

To use this API, you first need to get an API key from [Docomo developer page](https://dev.smt.docomo.ne.jp/?p=login).

Then, you can use it the following way:

```ruby
API_KEY = 'api you just got'
client = DocomoImageRecognition::Client.new(API_KEY)
client.recognize_from_url('http://the_url_you_want_to_anlayze.com/image.jpg')
client.recognize_from_file('/path/to/file/to/analyze.jpg')
```

Both method return the response in JSON format.

If an error occurs, a `DocomoImageRecognition::ApiError` is thrown.
