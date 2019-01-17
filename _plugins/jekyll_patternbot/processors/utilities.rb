module JekyllPatternbot
  class UtilitiesProcessor

    def remove_classes
      begin PatternbotData.dig(:css, :theme, :utilities)
        unless PatternbotData[:css][:theme][:utilities].length > 0
          PatternbotData[:patterns][:internal]['utilities'][:config]['patterns'].delete 'classes'
        end
      rescue
        PatternbotData[:patterns][:internal]['utilities'][:config]['patterns'].delete 'classes'
      end
    end

    def remove_vars
      begin PatternbotData.dig(:css, :theme, :vars)
        unless PatternbotData[:css][:theme][:vars].length > 0
          PatternbotData[:patterns][:internal]['utilities'][:config]['patterns'].delete 'variables'
        end
      rescue
        PatternbotData[:patterns][:internal]['utilities'][:config]['patterns'].delete 'variables'
      end
    end

    def process()
      remove_classes
      remove_vars
    end

  end
end
