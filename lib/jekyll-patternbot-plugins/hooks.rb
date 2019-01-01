module JekyllPatternbot

  Jekyll::Hooks.register :site, :post_read do |site|
    # site.documents.each do |doc|
      # if doc.relative_path.start_with? Settings::PATTERNS_FOLDER and doc.extname == '.html'
        # pp doc.name
      # end
    # end
  end

end
