Rails.application.config.middleware.use OmniAuth::Builder do
  provider :linkedin, "f76692ed-f52e-497b-afaf-8dfff112d3b6", "1e023cd5-13d6-455c-b017-99911fe78be8"
end