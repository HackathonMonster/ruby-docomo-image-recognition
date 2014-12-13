module DocomoImageRecognition
  class Client
    def initialize(api_key)
      base_url = DocomoImageRecognition.configuration.base_url
      @base_url = base_url + "?APIKEY=#{api_key}"
    end

    def recognize(data, options = default_options)
      url = "#{@base_url}&#{to_query(options)}"
      curl = Curl::Easy.new(url)
      curl.headers['Content-Type'] = 'application/octet-stream'
      curl.post_body = data
      curl.http_post
      body = JSON.parse(curl.body_str)
      raise_on_error!(body, curl.status)
      body
    end

    def recognize_from_file(path, options = default_options)
      data = File.read(path)
      recognize(data, options)
    end

    def recognize_from_url(url, options = default_options)
      data = download_file(url)
      recognize(data, options)
    end

    private

    def download_file(url)
      uri = URI(url)
      Net::HTTP.get(uri)
    end

    def default_options
      { recog: 'product-all', numOfCandidates: 10 }
    end

    def to_query(options)
      options
        .reject { |_k, v| v.nil? }
        .map { |k, v| k.to_s + '=' + v.to_s }
        .join('&')
    end

    def raise_on_error!(body, status)
      case status.split(' ')[0].to_i
      when 200 then return
      when 401 then fail 'not authorized', ApiError.new(body)
      when 400 then fail 'bad request', ApiError.new(body)
      end
    end
  end
end
