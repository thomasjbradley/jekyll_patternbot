module JekyllPatternbot
  class LogosFinder < Finder

    def base
      {
        :size_large => false,
        :size_64 => false,
        :size_32 => false,
        :size_16 => false,
      }
    end

    def info
      logos = base.clone
      for file in files
        logos[:size_large] = file if file.match? /256/
        logos[:size_large] = file if file.match? /^logo\./
        logos[:size_64] = file if file.match? /64/
        logos[:size_32] = file if file.match? /32/
        logos[:size_16] = file if file.match? /16/
      end
      logos
    end

  end
end
