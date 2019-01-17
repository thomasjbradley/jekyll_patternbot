module JekyllPatternbot
  class PatternbotConsoleLogger

    def initialize
      @logger = Logger.new STDOUT
      @logger.level = Logger::INFO
      @logger.formatter = proc do |severity, datetime, progname, msg|
        "PATTERNBOT — #{datetime}: #{msg}\n"
      end
    end

    def fatal(msg)
      @logger.fatal "⬣ #{msg}".red
    end

    def warn(msg)
      @logger.warn "▲ #{msg}".yellow
    end

    def info(msg)
      @logger.info "✔ #{msg}".green
    end

  end
end
