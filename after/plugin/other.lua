local rails_patterns = {
  { target = "/spec/factories/%1.rb",                context = "factories",  transformer = "singularize" },
  { target = "/app/controllers/**/%1_controller.rb", context = "controller", transformer = "pluralize" },
  { target = "/app/requests/**/%1_controller.rb",    context = "controller", transformer = "pluralize" },
  { target = "/app/views/%1/**/*.html.*",            context = "view" },
  { target = "/app/models/%1.rb",                    context = "models",     transformer = "singularize" },
  { target = "/spec/services/**/%1_spec.rb",         context = "services" },
  { target = "/spec/models/%1_spec.rb",              context = "models" },
  { target = "/spec/jobs/**/%1_spec.rb",             context = "jobs" },
  { target = "/spec/lib/**/%1_spec.rb",              context = "lib" },
  { target = "/spec/jobs/**/%1.rb",                  context = "jobs" },
}
local other_vim = prequire("other-nvim")

if (other_vim) then
  other_vim.setup({
    mappings = {
      {
        pattern = "/app/models/(.*).rb",
        target = {
          { target = "/spec/models/%1_spec.rb", context = "models" },
          { target = "/spec/factories/%1.rb",   context = "factories" },
        }
      },
      {
        pattern = "/spec/models/(.*)_spec.rb",
        target = {
          { target = "/app/models/%1.rb",          context = "models" },
          { target = "/app/controllers/**/%1.rb",  context = "controller", transformer = "pluralize" },
          { target = "/spec/factories/%1.rb",      context = "factories" },
          { target = "/spec/factories/%1_spec.rb", context = "factories" },
        }
      },
      {
        pattern = "/app/controllers/.*/(.*)_controller.rb",
        target = {
          { target = "/app/models/%1.rb",               context = "models",    transformer = "singularize" },
          { target = "/spec/controllers/**/%1_spec.rb", context = "controller" },
          { target = "/spec/factories/%1.rb",           context = "factories", transformer = "singularize" },
          { target = "/spec/factories/%1_spec.rb",      context = "factories", transformer = "singularize" },
        }
      },
      {
        pattern = "/app/services/.*/(.*).rb",
        target = {
          { target = "/spec/services/**/%1_spec.rb",      context = "services" },
          { target = "/app/controllers/%1_controller.rb", context = "controllers", transformer = "pluralize" },
          { target = "/app/models/%1.rb",                 context = "models" },
        }
      },
      {
        pattern = "/app/services/(.*).rb",
        target = {
          { target = "/spec/services/%1_spec.rb",         context = "services" },
          { target = "/app/controllers/%1_controller.rb", context = "controllers", transformer = "pluralize" },
          { target = "/app/models/%1.rb",                 context = "models" },
        }
      },
      {
        pattern = "/spec/services/(.*)_spec.rb",
        target = {
          { target = "/app/services/%1.rb",               context = "services" },
          { target = "/app/models/%1.rb",                 context = "models" },
          { target = "/app/controllers/%1_controller.rb", context = "controllers", transformer = "pluralize" },
        }
      },
      {
        pattern = "/app/jobs/.*/(.*).rb",
        target = {
          { target = "/spec/jobs/**/%1_spec.rb", context = "jobs" },
        }
      },
      {
        pattern = "/spec/jobs/.*/(.*)_spec.rb",
        target = {
          { target = "/app/jobs/**/%1.rb", context = "jobs" },
        }
      },

      {
        pattern = "/app/jobs/(.*).rb",
        target = {
          { target = "/spec/jobs/%1_spec.rb", context = "jobs" },
        }
      },
      {
        pattern = "/spec/jobs/(.*)_spec.rb",
        target = {
          { target = "/app/jobs/%1.rb", context = "jobs" },
        }
      }

    }
  })
end
