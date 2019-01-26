module JekyllPatternbot
  class IconsProcessor

    def remove_unless_modulifier
      begin PatternbotData.dig(:css, :modulifier, :settings)
        unless PatternbotData[:css][:modulifier][:settings].kind_of?(Array) and PatternbotData[:css][:modulifier][:settings].include? 'icons'
          PatternbotData[:patterns][:internal]['icons'][:config]['patterns'].delete 'icons-with-labels'
          PatternbotData[:patterns][:internal]['icons'][:config]['patterns'].delete 'icon-classes'
          PatternbotData[:patterns][:internal]['icons'][:config]['patterns'].delete 'icon-sizes'
        end
      rescue
        PatternbotData[:patterns][:internal]['icons'][:config]['patterns'].delete 'icons-with-labels'
        PatternbotData[:patterns][:internal]['icons'][:config]['patterns'].delete 'icon-classes'
        PatternbotData[:patterns][:internal]['icons'][:config]['patterns'].delete 'icon-sizes'
      end
    end

    def process
      remove_unless_modulifier
    end

  end
end
