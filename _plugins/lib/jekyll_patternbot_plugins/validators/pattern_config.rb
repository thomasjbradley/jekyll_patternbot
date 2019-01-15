module JekyllPatternbot
  class PatternConfigValidator

    def initialize
      @validator = Rxrb::Rx.new({ :load_core => true })
      @schema = @validator.make_schema YAML.load_file File.expand_path('../schemas/pattern.yml', __dir__)
    end

    def check!(obj)
      @schema.check! obj
    end

  end
end
