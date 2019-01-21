module JekyllPatternbot
  class ModulesProcessor

    def remove_embed
      begin PatternbotData.dig(:css, :modulifier, :settings)
        unless PatternbotData[:css][:modulifier][:settings].kind_of?(Array) and PatternbotData[:css][:modulifier][:settings].include? 'embed'
          PatternbotData[:patterns][:internal]['modules'][:config]['patterns'].delete 'embed'
        end
      rescue
        PatternbotData[:patterns][:internal]['modules'][:config]['patterns'].delete 'embed'
      end
    end

    def remove_media_objects
      begin PatternbotData.dig(:css, :modulifier, :settings)
        unless PatternbotData[:css][:modulifier][:settings].kind_of?(Array) and PatternbotData[:css][:modulifier][:settings].include? 'media-object'
          PatternbotData[:patterns][:internal]['modules'][:config]['patterns'].delete 'media-object'
        end
      rescue
        PatternbotData[:patterns][:internal]['modules'][:config]['patterns'].delete 'media-object'
      end
    end

    def remove_list_group
      begin PatternbotData.dig(:css, :modulifier, :settings)
        unless PatternbotData[:css][:modulifier][:settings].kind_of?(Array) and PatternbotData[:css][:modulifier][:settings].include? 'list-group'
          PatternbotData[:patterns][:internal]['modules'][:config]['patterns'].delete 'list-group'
        end
      rescue
        PatternbotData[:patterns][:internal]['modules'][:config]['patterns'].delete 'list-group'
      end
    end

    def process()
      remove_embed
      remove_media_objects
      remove_list_group
    end

  end
end
