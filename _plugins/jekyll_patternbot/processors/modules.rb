module JekyllPatternbot
  class ModulesProcessor

    def remove_unless_embed
      begin PatternbotData.dig(:css, :modulifier, :settings)
        unless PatternbotData[:css][:modulifier][:settings].kind_of?(Array) and PatternbotData[:css][:modulifier][:settings].include? 'embed'
          PatternbotData[:patterns][:internal]['modules'][:config]['patterns'].delete 'images-embed'
        end
      rescue
        PatternbotData[:patterns][:internal]['modules'][:config]['patterns'].delete 'images-embed'
      end
    end

    def remove_unless_media_objects
      begin PatternbotData.dig(:css, :modulifier, :settings)
        unless PatternbotData[:css][:modulifier][:settings].kind_of?(Array) and PatternbotData[:css][:modulifier][:settings].include? 'media-object'
          PatternbotData[:patterns][:internal]['modules'][:config]['patterns'].delete 'media-object'
        end
      rescue
        PatternbotData[:patterns][:internal]['modules'][:config]['patterns'].delete 'media-object'
      end
    end

    def remove_unless_skip_links
      begin PatternbotData.dig(:css, :modulifier, :settings)
        unless PatternbotData[:css][:modulifier][:settings].kind_of?(Array) and PatternbotData[:css][:modulifier][:settings].include? 'accessibility'
          PatternbotData[:patterns][:internal]['modules'][:config]['patterns'].delete 'skip-links'
        end
      rescue
        PatternbotData[:patterns][:internal]['modules'][:config]['patterns'].delete 'skip-links'
      end
    end

    def process
      remove_unless_embed
      remove_unless_media_objects
      remove_unless_skip_links
    end

  end
end
