Rails.application.config.dartsass.builds = {
  "application.scss"        => "application.css",
  "site.scss"       => "site.css",
  "admin.scss" => "admin.css"
}

if Rails.env.development?
  Rails.application.config.dartsass.build_options |= [ "--source-map" ]
end

Rails.application.config.dartsass.build_options |= [ "--silence-deprecation=import,global-builtin,color-functions,mixed-decls" ]
