module JekyllPatternbot
  class ModulesProcessor

    def remove_embed
      unless (PatternbotData[:css].key? :modulifier and
        PatternbotData[:css][:modulifier].key? :settings and
        PatternbotData[:css][:modulifier][:settings].include? 'embed')
        PatternbotData[:patterns][:internal]['modules'][:config]['patterns'].delete 'embed'
      end
    end

    def remove_media_objects
      unless (PatternbotData[:css].key? :modulifier and
        PatternbotData[:css][:modulifier].key? :settings and
        PatternbotData[:css][:modulifier][:settings].include? 'media-object')
        PatternbotData[:patterns][:internal]['modules'][:config]['patterns'].delete 'media-objects'
      end
    end

    def remove_list_group
      unless (PatternbotData[:css].key? :modulifier and
        PatternbotData[:css][:modulifier].key? :settings and
        PatternbotData[:css][:modulifier][:settings].include? 'list-group')
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
