module DocomoImageRecognition
  class Error < StandardError
  end

  class DownloadError < Error
  end

  class ApiError < Error
    attr_reader :body
    def initialize(body)
      @body = body
    end
  end
end
