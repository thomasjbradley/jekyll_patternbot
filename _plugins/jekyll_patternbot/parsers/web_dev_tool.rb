module JekyllPatternbot
  class WebDevToolParser

    def initialize(filename)
      @filename = filename
      @filepath = File.expand_path filename, Config['patternbot']['css']['source']
    end

    def exists?
      File.file? @filepath
    end

    def data
      if @data.nil? and File.file? @filepath
        @data = File.read(@filepath)
        if @data != ""
          @url_matches = @data.match(/https:\/\/(?<tool>modulifier|gridifier|typografier)\.web-dev\.tools\/#(?<url>[^\s]+)/)
          @url = @url_matches[0] if @url_matches
        else
          @data = nil
          @url_matches = false
          @url = ''
        end
      end
      @data
    end

    def extract_url_info
      @url_matches[:url] if @url_matches
    end

    def settings
     extract_url_info
    end

    def info
      data
      the_info = {
        :filename => @filename,
        :filepath => @filepath,
        :settings => settings,
      }
      if @url and @url != ''
        the_info[:url] = @url
      end
      the_info
    end

  end
end
