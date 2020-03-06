module AppComponent
  class Engine < ::Rails::Engine
    isolate_namespace AppComponent

    # This enables rake db:migrate to find the migrations located in the engines
    # and run them against the main app schema
    initializer :append_migrations do |app|
      unless app.root.to_s.match(root.to_s+File::SEPARATOR)
        app.config.paths["db/migrate"].concat(config.paths["db/migrate"].expanded)
      end
    end

    # Set up default configs for our favorite tools
    config.generators do |g|
      g.orm             :active_record
      g.template_engine :slim
      g.test_framework  :rspec
    end

  end
end
