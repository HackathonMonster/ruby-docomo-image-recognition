module DocomoImageRecognition
  class Configuration
    attr_accessor :base_url

    def initialize
      self.base_url = 'https://api.apigw.smt.docomo.ne.jp/imageRecognition/v1/recognize'
    end
  end
end
