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
        unless PatternbotData[:css][:modulifier][:settings].kind_of?(Array) and PatternbotData[:css][:modulifier][:settings].include? 'media-objects'
          PatternbotData[:patterns][:internal]['modules'][:config]['patterns'].delete 'media-objects'
        end
      rescue
        PatternbotData[:patterns][:internal]['modules'][:config]['patterns'].delete 'media-objects'
      end
    end

    def remove_list_group
      begin PatternbotData.dig(:css, :modulifier, :settings)
        unless PatternbotData[:css][:modulifier][:settings].kind_of?(Array) and PatternbotData[:css][:modulifier][:settings].include? 'list-groups'
          PatternbotData[:patterns][:internal]['modules'][:config]['patterns'].delete 'list-groups'
        end
      rescue
        PatternbotData[:patterns][:internal]['modules'][:config]['patterns'].delete 'list-groups'
      end
    end

    def process()
      remove_embed
      remove_media_objects
      remove_list_group
    end

  end
end
